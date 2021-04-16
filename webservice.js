const express = require('express');
const router = express.Router();
const app = express();
const mysql = require('mysql2');
const bp = require('body-parser');
const cors = require("cors");
app.use(cors());

var session = require('express-session');
var path = require('path');

require('dotenv').config();
const port = 3030;

app.listen(port, () => console.log(`listening on port ${port}!`));

app.use("/", router);
router.use(bp.json());

// Setting up the public directory
app.use('/public', express.static('sec1_gr5_src'));

let dbConn = mysql.createConnection({
	host: process.env.MYSQL_HOST,
	user: process.env.MYSQL_USERNAME,
	password: process.env.MYSQL_PASSWORD,
	database: process.env.MYSQL_DATABASE
});

dbConn.connect((err) => {
	if (err) throw err;
	console.log("Database connected");
})

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(bp.urlencoded({
	extended: true
}));
app.use(bp.json());

//apadij
//itcs212_1
app.post('/userlogin', function (req, res) {
	let username = req.body.username;
	let password = req.body.password;
	console.log(req.body.info);
	console.log(username, password);
	if (!username) {
		return res.status(400).send({
			error: true,
			message: 'Please provide username.'
		});
	}
	if (!password) {
		return res.status(400).send({
			error: true,
			message: 'Please provide password.'
		});
	}
	dbConn.query('SELECT * FROM Login_Information WHERE username = ? AND password = ?', [username, password], function (error, results) {
		if (error) throw error;
		if (results.length > 0) {
			console.log(results);
			console.log();
			return res.send({
				error: false,
				data: results[0],
				message: 'User retrieved'
			});
		} else {
			console.log(results);
			return res.send({
				error: true,
				data: results[0],
				message: 'ERROR'
			});
		}
	});
});

app.post('/adminlogin', function (req, res) {
	let username = req.body.username;
	let password = req.body.password;
	console.log(req.body.info);
	console.log(username, password);
	if (!username) {
		return res.status(400).send({
			error: true,
			message: 'Please provide username.'
		});
	}
	if (!password) {
		return res.status(400).send({
			error: true,
			message: 'Please provide password.'
		});
	}
	dbConn.query('SELECT * FROM Admin_Information WHERE username = ? AND password = ?', [username, password], function (error, results) {
		if (error) throw error;
		if (results.length > 0) {
			console.log(results);
			console.log();
			return res.send({
				error: false,
				data: results[0],
				message: 'User retrieved'
			});
		} else {
			console.log(results);
			return res.send({
				error: true,
				data: results[0],
				message: 'ERROR'
			});
		}
	});
});


app.post('/register', function (req, res, next) {

	
	inputData = {
		username: req.body.username,
		password: req.body.password,
		firstname: req.body.firstname,
		lastname: req.body.lastname,
		address: req.body.address,
		age: req.body.age,
		email: req.body.email
	}
	console.log(inputData);
	// check unique email address
	var sql = 'SELECT * FROM Login_Information WHERE email =?';
	dbConn.query(sql, [inputData.email], function (err, results) {
		if (err) throw err
		if (results.length > 1) {
			//var msg = inputData.email_address + "was already exist";
			return res.send({
				error: false,
				message: inputData.email + 'was already exist'
			});
		}  else {
			// save users data into database
			var sql = 'INSERT INTO Login_Information SET ?';
			dbConn.query(sql, inputData, function (err, results) {
				if (err) throw err;
				return res.send({
					error: false,
					data: results.affectedRows,
					message: 'Your are successfully registered.'
				}); 
			});
			//var msg = "Your are successfully registered";
		}
	})
});

router.get('/search&/Food/:name',function(req,res){
    let Food_Name = req.params.name;
    if(!Food_Name) 
    {
        return res.status(400).send({error: true, message:'Please provide product name.'});
    }

    dbConn.query('SELECT Food_Name FROM Food WHERE Food_Name=? order by Food_Name', Food_Name,function(error,results)
    {
        console.log(results);
        if(error) throw error;
        return res.send({error:false,data:results,message:'Product retrssieved'});
    });                                                                                                                                               4
});
router.get('/search&/Food',function(req,res){
    dbConn.query('SELECT Food_Name FROM Food',function(error,results){
        if (error) throw error;
        return res.send({error: false, data:results,message:'list Food.'});
    });                                                                                                                                             4
});

//`Drink_Name`, `Drink_Price`
router.get('/search&/Drink/:name',function(req,res){
    let Drink_Name = req.params.name;
    if(!Drink_Name) 
    {
        return res.status(400).send({error: true, message:'Please provide product name.'});
    }

    dbConn.query('SELECT Drink_Name FROM Drink WHERE Drink_Name=? order by Drink_Name', Drink_Name,function(error,results)
    {
        if(error) throw error;
        console.log(results);
        return res.send({error:false,data:results,message:'Product retrssieved'});
    });                                                                                                                                               4
});
router.get('/search&/Drink',function(req,res){
    dbConn.query('SELECT Drink_Name FROM Drink',function(error,results){
        if (error) throw error;
        return res.send({error: false, data:results,message:'list Drink.'});
    });                                                                                                                                             4
});

//`Dessert_Name`, `Dessert_Price`
router.get('/search&/Dessert/:name',function(req,res){
    let Dessert_Name = req.params.name;
    if(!Dessert_Name) 
    {
        return res.status(400).send({error: true, message:'Please provide product name.'});
    }

    dbConn.query('SELECT Dessert_Name FROM Dessert WHERE Dessert_Name=? order by Dessert_Name', Dessert_Name,function(error,results)
    {
        if(error) throw error;
        console.log(results);
        return res.send({error:false,data:results,message:'Product retrssieved'});
    });                                                                                                                                               4
});

router.get('/search&/Dessert',function(req,res){
    dbConn.query('SELECT Dessert_Name FROM Dessert',function(error,results){
        if (error) throw error;
        return res.send({error: false, data:results,message:'list Dessert.'});
    });                                                                                                                                             4
});

//`Branch_id`, `Contact_No`, `Location`, `Name`
router.get('/search&/Branch',function(req,res){
    dbConn.query('SELECT Location FROM Branch',function(error,results){
        if (error) throw error;
        return res.send({error: false, data:results,message:'list Branch.'});
    });
});