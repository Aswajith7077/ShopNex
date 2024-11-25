import dotenv from "dotenv";
import nodemailer from "nodemailer";

dotenv.config();

const value = (email)=>{
    const transporter = nodemailer.createTransport({
        port: 465,               // true for 465, false for other ports
        host: "smtp.gmail.com",
        auth: {
            user: '22pt05@psgtech.ac.in',
            pass: process.env.Password,
         },
        secure: true,
    })
    const mailData = {
        from: '22pt05@pagtech.ac.in',  // sender address
          to: email,   // list of receivers
          subject: 'New Product Available',
          text: 'That was easy!'
    }
    transporter.sendMail(mailData)
}

value('aswajith777@gmail.com');