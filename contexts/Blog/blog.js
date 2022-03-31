const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");
const multer = require('multer');

app.use(bodyParser.json());

const storage = multer.diskStorage({
    // Destination to store image     
    destination: 'views', 
      filename: (req, file, cb) => {
          cb(null, file.fieldname + '_' + Date.now() 
             + path.extname(file.originalname))
            // file.fieldname is name of the field (image)
            // path.extname get the uploaded file extension
    }
});

const upload = multer({
    storage: storage,
    limits: {
    fileSize: 10000000 // 10000000 Bytes = 10 MB
    },
    fileFilter(req, file, cb) {
      // upload only mp4 and mkv format
      if (!file.originalname.match(/\.(mp4|MPEG-4|mkv|png|jpg)$/)) { 
         return cb(new Error('Please upload a video/image!!!'))
      }
      cb(undefined, true)
   }
})

//Post a blog
Router.post('/', (req, res) => {

    //res.send(req.file)

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_POST",
            message: "body parameters were not found"
        });
        return
    }
    //const img = req.file.filename;
    const { title, description, author, created_on, filename} = req.body;
    
    if (title == null || description == null || author == null ) {
        res.send({
            error: true,
            message: "One or many of the requred body arguements is missing",
            code: "C002_POST"
        })
        return
    }
    mariadb.query(`INSERT INTO blog VALUES(DEFAULT,'${title}','${description}','${author}',DEFAULT, '${filename}')`, (err, rows) => {
        if (!err) {
            res.send({
                error: false,
                data: `Blog with the Title name: '${title}' has been uploaded.`
            })
            return
        } else {
            res.send({
                error: true,
                message: err,
                code: "C001_SQL_POST"
            })
            return
        }
    })
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
            mariadb.query('SELECT title, description, author, created_on, path from blog', (err, rows) => {
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

    const { title, description,author, path, id } = req.body

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