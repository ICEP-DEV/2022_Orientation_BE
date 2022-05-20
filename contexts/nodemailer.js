"use strict";
const nodemailer = require("nodemailer");
const express = require('express');
const app = express();
const Router = express.Router();
const bodyParser = require('body-parser')


app.use(bodyParser.json());

Router.get('/', (req, res) => {
    
    // async..await is not allowed in global scope, must use a wrapper
async function main() {
    // Generate test SMTP service account from ethereal.email
    // Only needed if you don't have a real mail account for testing
    let testAccount = await nodemailer.createTestAccount();
  
    // create reusable transporter object using the default SMTP transport
    let transporter = nodemailer.createTransport({
      host: 'email-smtp.us-east-1.amazonaws.com',
      port: 587,
      secure: false, // true for 465, false for other ports
      auth: {
        user: 'AKIA2234SEJNDE663XFN', // generated ethereal user
        pass: 'BGkhQsJLce3iOaA+/GVPAnXCtKM1F1bgMs/TUxdFnWvb', // generated ethereal password
      },
    });
  
    // send mail with defined transport object
    let info = await transporter.sendMail({
      from: 'no-reply-tut-orientation@outlook.com', // sender address
      to: req.query.email, // list of receivers
      subject: "Hello ✔", // Subject line
      text: "Hello world?", // plain text body
      html: "<b>Hello world?</b>", // html body
    });
  
    res.send({
        error:false,
        testURL: nodemailer.getTestMessageUrl(info),
        messageid : info.messageId
    })
      return    
  }
  
  main()
  .catch((e)=>{
      res.send({
          error: true,
          message : e
      })
      return;
  });
  return
});

module.exports = Router;