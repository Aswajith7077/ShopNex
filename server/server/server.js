import express from "express";
import mysql from "mysql2";
import dotenv from 'dotenv';

dotenv.config();

const app = express();
app.use(express.json());

const pool = mysql
  .createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DATABASE
  });

console.log("hello");



/*

GET MINIMUM POINTS TO GET A REWARD

*/
app.get('/',(req,res)=>{
  if(!req.body){
    return;
  }
  pool.getConnection((err,connection)=>{
    if(err){
      console.log('Database connection error : ',err);
      return res.status(500).json({err : 'Database Error'});
    }
    connection.query(`CALL GET_MIN_POINTS_FOR_REWARD('${req.body["USER_ID"]}')`,(err,rows)=>{
      connection.release();
      if(err){
        return res.status(500).json({error : 'Query Error'});
      }
      res.json(rows[0]);
      console.log("GET_MIN_POINTS_FOR_REWARD Successfull Execution !")
    });
  })
})

/*

A GET Request with body {"USER_ID" :'johndoe@example.com'} 

GET CART ITEMS OF A USER

*/

app.get('/cart',(req,res)=>{
  if(!req.body){
    return;
  }
  console.log(req.body["USER_ID"])
  pool.getConnection((err,connection)=>{
    if(err){
      console.log('Database connection error',err);
      return res.status(500).json({error : 'Database error'})
    }
    connection.query(`CALL GET_CART_ITEMS('${req.body["USER_ID"]}')`,(err,rows)=>{
      connection.release();
      if(err){
        console.log('Query Error',err);
        return res.status(500).json({error : "Database Query Error"});
      }
      res.json(rows[0]);
      console.log("GET_CART_ITEMS Successfull Execution !");
    })

  })
});

/*

A Post Requst with  body { USER_ID: 'johndoe@example.com'}



*/

app.post('/',(req,res)=>{
  if(!req.body){
    return;
  }
  // console.log(req.body["USER_ID"])
  pool.getConnection((err,connection)=>{
    if(err){
      // console.log('Database connection error',err);
      return res.status(500).json({error : 'Database error'})
    }
    connection.query(`CALL GET_CART_ITEMS('${req.body["USER_ID"]}')`,(err,rows)=>{
      connection.release();
      if(err){
        // console.log('Query Error',err);
        return res.status(500).json({error : "Database Query Error"});
      }
      res.json(rows[0]);
      console.log("GET_CART_ITEMS Successfull Execution !");
    })

  })
});




/*

A Post Requst with  body { USER_ID: 'johndoe@example.com', PRODUCT_ID: 1010, QUANTITY: 5 }

ADD AN ELEMENT TO CART

*/
app.post('/cart',(req,res)=>{

  console.log(req.body)
  pool.getConnection((err,connection)=>{
    if(err){
      console.log('Database connection error',err);
      return res.status(500).json({error : 'Database error'})
    }
    connection.query(`CALL ADD_TO_CART('${req.body['USER_ID']}',${req.body['PRODUCT_ID']},${req.body['QUANTITY']})`,(err,rows)=>{
      connection.release();
      if(err){
        console.log('Query Error');
        return res.status(500).json({error : "Database Query Error"});
      }
      res.json(rows[0]);
      console.log("ADD_TO_CART Successfull Execution !");
    })
  })
});

/*

PLACING an Order

*/

app.post('/product',(req,res)=>{
  if(!req.body){
    return;
  }
  // console.log(req.body["USER_ID"])
  pool.getConnection((err,connection)=>{
    if(err){
      // console.log('Database connection error',err);
      return res.status(500).json({error : 'Database error'})
    }
    connection.query(`CALL PLACE_ORDER('${req.body["USER_ID"]}',${req.body['PRODUCT_ID']},${req.body['QUANTITY']})`,(err,rows)=>{
      connection.release();
      if(err){
        // console.log('Query Error',err);
        return res.status(500).json({error : "Database Query Error"});
      }
      res.json(rows[0]);
      console.log("GET_CART_ITEMS Successfull Execution !");
    })

  })
});




app.listen(8000,()=>{
  console.log('Server is live at 8000');
});


