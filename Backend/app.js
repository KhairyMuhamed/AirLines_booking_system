const pool = require("./database");
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const fs = require("fs");
const app = express();
app.use(cors());
app.use(bodyParser.json());
const port = process.env.PORT || 3000;
const host = process.env.HOST || "localhost";

app.get("/", (_req, res) => {
  res.status(200).send("Welcome to the Airline Reservation System");
});

app.get("/customers", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query("SELECT * FROM customers");
    res.status(200).send(result.rows);
  } catch (error) {
    res.status(500).send(error);
  }
});

app.get("/schedule", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query("SELECT * FROM schedule");
    res.status(200).send(result.rows);
  } catch (error) {
    res.status(500).send(error);
  }
});

app.post("/customers", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query(
      "INSERT INTO customers (cust_ID, fname, lname, gender, age, contact_add, cust_email ,cust_pass) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *",
      [
        
        req.body.cust_ID,
        req.body.fname,
        req.body.lname,
        req.body.gender,
        req.body.age,
        req.body.contact_add,
        req.body.cust_email,
        req.body.cust_pass
      
      ]
    );
    connection.release();
    res.status(200).send(result.rows[0]);
  } catch (error) {
    res.status(500).send(error);
  }
  
});


app.post("/tickets_3", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query(
      "INSERT INTO tickets_3 (ticket_ID, ticket_num, date_flight, time_flight, time_land, destination, trip_type ,price,date_land,res_ID) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *",
      [
        
        req.body.ticket_ID,
        req.body.ticket_num,
        req.body.date_flight,
        req.body.time_flight,
        req.body.time_land,
        req.body.destination,
        req.body.trip_type,
        req.body.price,
        req.body.date_land,
        req.body.res_ID
      
      ]
    );
    connection.release();
    res.status(200).send(result.rows[0]);
  } catch (error) {
    res.status(500).send(error);
  }
  
});

app.get("/tickets", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query("SELECT * FROM tickets");
    res.status(200).send(result.rows[0]);
  } catch (error) {
    res.status(500).send(error);
  }
});


app.post("/tickets_3", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query(
      "INSERT INTO tickets_3(ticket_ID, ticket_num, date_flight, time_flight, time_land, destination , trip_type ,price, date_land, res_ID) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, &9, &10) RETURNING *",
      [
        
        req.body.ticket_ID,
        req.body.ticket_num,
        req.body.date_flight,
        req.body.time_flight,
        req.body.time_land,
        req.body.destination,
        req.body.trip_type,
        req.body.price,
        req.body.date_land,
        req.body.res_ID
      
      ]
    );
    connection.release();
    res.status(200).send(result.rows[0]);
  } catch (error) {
    res.status(500).send(error);
  }
  
});





app.get("/transactions", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query("SELECT * FROM transactions");
    res.status(200).send(result.rows);
  } catch (error) {
    res.status(500).send(error);
  }
});
app.post("/transactions", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query(
      "INSERT INTO transactions(trans_ID, trans_name, res_ID, schedule_ID, ticket_ID, trans_date, report_ID) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
      [
        
        req.body.trans_ID,
        req.body.trans_name,
        req.body.res_ID,
        req.body.schedule_ID,
        req.body.ticket_ID,
        req.body.trans_date,
        req.body.report_ID
      
      ]
    );
    connection.release();
    res.status(200).send(result.rows[0]);
  } catch (error) {
    res.status(500).send(error);
  }
 try{console.log(
  req.body.trans_ID,
  req.body.trans_name,
  req.body.res_ID,
  req.body.schedule_ID,
  req.body.ticket_ID,
  req.body.trans_date,
  req.body.report_ID
 )}catch(error){res.status(500).send(error);} 
});



app.post("/reports", async (req, res) => {
  try {
    const connection = await pool.connect();
    const result = await connection.query(
      "INSERT INTO reports(report_ID, trans_id, admin_ID,res_ID, report_date,No_tickets, income) VALUES ($1, $2, $3, $4,$5,$6,$7,$8) RETURNING *",
      [
        req.body.report_ID,
        req.body.trans_id,
        req.body.admin_ID,
        req.body.res_ID,
        req.body.report_date,
        req.body.No_tickets,
        req.body.income
      ]
    );
    connection.release();
    res.status(200).send(result.rows[0]);
  } catch (error) {
    res.status(500).send(error);
  }
  try{console.log(
    req.body.report_ID,
        req.body.admin_ID,
        req.body.report_date,
        req.body.income
   )}catch(error){res.status(500).send(error);}  
});



app.listen(port, host, () => {
  console.log(`Server running at http://${host}:${port}/`);
  fs.appendFile("time.txt", Date() + "\n", function (err) {
    if (err) throw err;
    console.log("Saved!");
  });
});