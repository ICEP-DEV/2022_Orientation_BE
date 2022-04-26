const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");
const multer = require('multer');

app.use(bodyParser.json());



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




Router.get('/', (req, res, next) => {

    let field;

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "S001",
            message: "body parameters were not found"
        })
        return
    }


    if (req.body.id) {
        if (req.body.id == "*") {
            mariadb.query('SELECT title, description, author, created_on, path, link, subtittle from blog', (err, rows) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows
                    });
                } else {
                    res.send({
                        error: true,
                        code: "C001_SQL_GET",
                        message: err
                    });
                    return
                }
            })
        }
        else {
            mariadb.query(`SELECT ${req.body.field} FROM blog`, (err, rows, fields) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows,
                    })
                    return
                } else {
                    res.send({
                        error: true,
                        code: "S001_SQL",
                        message: "field element was not found as a body element"
                    })
                    return
                }
                
            });
            
        } 
    
    }else {
        res.send({
            error: true,
            code: "S002",
            message: "field element was not found as a body element"
        })
        return
    }


});

Router.put('/', (req, res) => {
    let field;
    let updateValue = "";

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_PUT",
            message: "body parameters were not found"
        });
        return
    }

    const { title, description,author, path, link, subtittle, id } = req.body

    mariadb.query(`UPDATE blog SET ${req.body.field} = '${req.body.updateValue}' WHERE id = ${req.body.id}`, (err, rows) => {
        if (!err) {
            res.send({
                error: false,
                data: `one column has been deleted.`
            })
            return
        } else {
            res.send({
                error: true,
                message: err,
                code: "C001_SQL_PUT"
            })
            return
        }
    })
})

Router.delete('/', (req, res, next) => {

    let field;

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "S001",
            message: "body parameters were not found"
        })
        return
    }


    if (req.body.id) {
        if (req.body.id == "*") {
            mariadb.query('DELETE * from blog', (err, rows) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows
                    });
                } else {
                    res.send({
                        error: true,
                        code: "C001_SQL_GET",
                        message: err
                    });
                    return
                }
            })
        }
        else {
            mariadb.query(`DELETE FROM blog WHERE id = ${req.body.id}`, (err, rows, fields) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows,
                    })
                    return
                } else {
                    res.send({
                        error: true,
                        code: "S001_SQL",
                        message: "field element was not found as a body element"
                    })
                    return
                }
                
            });
            
        } 
    
    }else {
        res.send({
            error: true,
            code: "S002",
            message: "field element was not found as a body element"
        })
        return
    }


});

module.exports = Router;