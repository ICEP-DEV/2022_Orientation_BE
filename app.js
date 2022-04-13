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
    fileSize: 10000000 // 10000000 Bytes = 10 MB
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

    const title = req.body.title;
    const description = req.body.description;;
    const img = req.file.filename;
    const author = req.body.author;

 mariadb.query(`INSERT INTO blog(path, author, title, description, created_on) VALUES('http://localhost:6900/images/${img}','${author}','${title}', '${description}', DEFAULT)`, (err,result) => {
    if(err) throw err
    console.log("Image uploaded");
    res.send('Image uploaded')
    return
  })
  return
},handleErr)

app.post('/uploadVideo', videoUpload.single('video'), (req, res) => {
   res.send(req.file)

   const vid = req.file.filename;
   const title = req.body.title;
   const description = req.body.description;
   const author = req.body.author;

   mariadb.query(`INSERT INTO blog(path, author, title, description, created_on) VALUES('${vid}','${author}','${title}', '${description}', DEFAULT)`, (err,result) => {
     if(err) throw err
     console.log("Video uploaded");
     res.send('Video uploaded')
   })
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