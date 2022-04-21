const express = require('express');
const path = require('path');
const app = express()
const multer = require('multer');
const mariadb = require('./connection');
const port = process.env.PORT || 3007


app.get('/', (req, res) => { 
    res.send('Not a accessbled Address'); 
});


const handleErr = (error, req, res, next) => {
    res.status(400).send({ error: error.message })
}

const imageStorage = multer.diskStorage({
    // Destination to store image     
    destination: 'bin/images', 
      filename: (req, file, cb) => {
          cb(null, file.fieldname + '_' + Date.now() 
             + path.extname(file.originalname))
            // file.fieldname is name of the field (image)
            // path.extname get the uploaded file extension
    }
});

const videoStorage = multer.diskStorage({
    destination: 'bin/videos', // Destination to store video 
    filename: (req, file, cb) => {
        cb(null, file.fieldname + '_' + Date.now() 
         + path.extname(file.originalname))
    }
});

const imageUpload = multer({
    storage: imageStorage,
    limits: {
      fileSize: 1000000 // 1000000 Bytes = 1 MB
    },
    fileFilter(req, file, cb) {
      if (!file.originalname.match(/\.(png|jpg)$/)) { 
         // upload only png and jpg format
         return cb(new Error('Please upload a Image'))
       }
     cb(undefined, true)
  }
})

const videoUpload = multer({
    storage: videoStorage,
    limits: {
    fileSize: 50000000 // 50000000 Bytes = 50 MB
    },
    fileFilter(req, file, cb) {
      // upload only mp4 and mkv format
      if (!file.originalname.match(/\.(mp4|MPEG-4|mkv)$/)) { 
         return cb(new Error('Please upload a video'))
      }
      cb(undefined, true)
   }
})


// For Single image upload
app.post('/uploadImage', imageUpload.single('image'), (req, res) => {

    
      const img = req.file.filename;
      
      if(req.body.type == 'blog')
      {
        const title = req.body.title;
        const description = req.body.description;;
        const author = req.body.author;
        const subTittle = req.body.sub;
        const link = req.body.link;
       
        //Adding a blog post with a image
        mariadb.query(`INSERT INTO blog(path, author, title, description, created_on,link,subTittle) VALUES('http://localhost:6900/images/${img}','${author}','${title}', '${description}', DEFAULT,'${link}','${subTittle}')`, (err,result) => {
            if(err) throw err
            console.log("Image uploaded");
            res.send('Image uploaded')
            return
        })
      }
      
      return

},handleErr)

app.post('/uploadVideo', videoUpload.single('video'), (req, res) => {
   

   const vid = req.file.filename;
   
   
   if(req.body.type == 'blog')
   {
    const title = req.body.title;
    const description = req.body.description;
    const author = req.body.author;
    const subTittle = req.body.sub;
    const link = req.body.link;
    
    //Adding a blog post with a video
      mariadb.query(`INSERT INTO blog(path, author, title, description, created_on,link,subTittle) VALUES('http://localhost:6900/videos/${vid}','${author}','${title}', '${description}', DEFAULT,'${link}','${subTittle}')`, (err,result) => {
        if(err) throw err
        res.send('Video uploaded for blog')
      })
    }
    else if(req.body.type == 'orientation')
    {
        const faculty = req.body.fac
        const title = req.body.title
        const category = req.body.category
        const fileType = req.body.fileType
      

        //Adding a video post with a image
        mariadb.query(`INSERT INTO videos(path, tittle, createdAt,category,type,noOfViews) VALUES('http://localhost:6900/videos/${vid}','${title}', DEFAULT,'${category}','${fileType}',0)`, (err,result) => {
            if(err) throw err
          
            if(result.insertId)
            {
              mariadb.query(`INSERT INTO fac_vid VALUES(DEFAULT,${faculty},${result.insertId})`,(err,result)=>{
                if(err) throw err
                res.send("video for orientation was added")
              })
            }
            return
        })
    }
    return
},handleErr) 


app.listen(port, () => {
  console.log("********************************************************");
  console.log("* DB: localhost:3306 DBname:'orientation_db_schema'    *");
  console.log("*                PORT is running on " + port + "               *");
  console.log("*                 file upload by cheyeza               *");
  console.log("********************************************************");
})

module.exports = app;