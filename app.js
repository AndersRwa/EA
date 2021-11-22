const express = require("express");
const app = express();

//Database

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'epok'
});
 
connection.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }
 
  console.log('Connected to database as id ' + connection.threadId);
});

//Start server

app.use(express.json());

app.listen(8080, () => {
    console.log("Server is running on port 8080.");
  });



//Routes

    //Main page

app.get("/", (req, res) => {
      res.sendFile(__dirname + "/index.html");
  });

    //Epok

app.get("/epok", (req, res, next) => {
    connection.query('SELECT * from epok_kurs', function (error, results, fields) {
        if (error) throw error;
       res.json(results);
      });
   });   

app.get("/epok/:id", (req, res, next) => {
        connection.query(`SELECT modulkod,benämning FROM epok_moduler where kurs_kurs = ? AND aktiv=1`,[req.params.id], function (error, results, fields) {
            if (error) throw error;
            res.json(results)
          });
    });


    //StudentIPS

app.get("/studentips", (req, res, next) => {
    connection.query('SELECT * from spis_studenter', function (error, results, fields) {
        if (error) throw error;
        res.json(results);
      });
   });   

app.get("/studentips/:id", (req, res, next) => {
        connection.query(`SELECT personnummer, namn FROM spis_studenter where studentid = ?`,[req.params.id], function (error, results, fields) {
            if (error) throw error;
            res.json(results)
          });
    });
  

    //Ladok

app.post('/ladok', function (req,res) {

  var modul = req.body.module;
  var pnr = req.body.pnr;
  var exdatum = req.body.exdatum;
  var betyg = req.body.betyg;
  var kurs = req.body.kurs;

  
   if (modul = null) res.send("Please specify module")
     else if (pnr = null) res.send("Please specify social security number")
     else if (exdatum = null) res.send("Please specify date")
     else if (betyg = null) res.send("Please specify grade")
     else if (kurs = null) res.send("Please specify course")

     else 
{
  connection.query(`INSERT INTO ladok_betyg (ladok_moduler_modulID,ladok_student_personnummer,exdatum,betyg,ladok_kurs_kursID) VALUES (?,?,?,?,?)`,[req.body.modul, req.body.pnr, req.body.exdatum, req.body.betyg, req.body.kurs],(err,rows,fields)=>{  
      if(!err)   
      res.send('Grade registred to ladok database');
        else  
        res.send("Could not add grade " + err);     
      })  
  }});

app.get("/ladok", (req, res, next) => {
    connection.query('SELECT * from ladok_betyg', function (error, results, fields) {
        if (error) throw error;
        res.json(results);
      });
   });  