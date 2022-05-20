//PORT FOR THE API ENDPOINT________________________
const { APP_PORT,DATABASE } = require('./globals');
//_________________________________________________
const HOSTNAME = "ec2-18-234-218-224.compute-1.amazonaws.com"

const express = require('express');
const path = require('path');
const app = express()
const multer = require('multer');
const mariadb = require('./connection');
const cors = require('cors');


app.use(cors({origin: '*'}));


app.use(function(req, res, next) {
    //Header allowences of METHODS
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});


//Publisize a folder
app.use(express.static('public')); 
app.use('/images', express.static('bin/images'));
app.use('/videos', express.static('bin/videos'));

app.get('/', (req, res) => { 
    res.send('Not a accessbled Address app'); 
});


const handleErr = (error, req, res, next) => {
    res.status(400).send(error.message)
    return
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
      fileSize: 10000000 // 1000000 Bytes = 1 MB
    },
    fileFilter(req, file, cb) {
      if (!file.originalname.match(/\.(png|jpg|PNG|JPG|JPEG|GIF|gif|jpeg)$/)) { 
         // upload only png and jpg format
         return cb(new Error('Please upload a Image'))
       }
     cb(undefined, true)
  }
})

const videoUpload = multer({
    storage: videoStorage,
    limits: {
    fileSize: 150000000 // 50000000 Bytes = 50 MB
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
      const title = req.body.title;
      const description = req.body.description;;
      const author = req.body.author;
      const subTittle = req.body.sub;
      const link = req.body.link;
       
        //Adding a blog post with a image
        mariadb.query(`INSERT INTO blog(path, author, title, description, created_on,link,subTittle) VALUES('http://${HOSTNAME}/images/${img}','${author}','${title}', '${description}', DEFAULT,'${link}','${subTittle}')`, (err,result) => {
            if(err) throw err
            res.send('Image uploaded')
            return
        })
          
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
      mariadb.query(`INSERT INTO blog(path, author, title, description, created_on,link,subTittle) VALUES('http://${HOSTNAME}/videos/${vid}','${author}','${title}', '${description}', DEFAULT,'${link}','${subTittle}')`, (err,result) => {
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
        mariadb.query(`INSERT INTO videos(path, tittle, createdAt,category,type,noOfViews) VALUES('http://${HOSTNAME}/videos/${vid}','${title}', DEFAULT,'${category}','${fileType}',0)`, (err,result) => {
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


app.listen(APP_PORT, () => {
  console.log("********************************************************");
  console.log("* DB: "+DATABASE()+":3306 DBname:'orientation_db_schema'    *");
  console.log("*           S3 Bucket(U/D) Amazon : by Cheyeza         *");
  console.log("*                   PORT : "+APP_PORT+"                        *");
  console.log("********************************************************");
})

module.exports = app;