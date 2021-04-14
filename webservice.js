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
    host: 'localhost',
    user: 'project2',
    password: '1234',
    database: 'project1_phase2_group5'
});

dbConn.connect((err) => {
    if(err) throw err;
    console.log("Database connected");
})

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(bp.urlencoded({extended : true}));
app.use(bp.json());

/*app.post('/auth', function(request, response) {
	var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
		dbConn.query('SELECT * FROM Login_Information WHERE username = ? AND password = ?', [username, password], function(error, results){
			if (error) throw error;
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
				console.log(results);
				console.log(sql);
				return response.send({error:true, data:results.affectedRows, message: 'successfully.'});
			} else {
				request.session.loggedin = false;
				request.session.username = null;
				console.log(username);
				console.log(password);
				console.log(results);
				console.log(sql);
				return response.send({error:true,data:results[0],message:'Incorrect Username and/or Password!'});
			}	
        });
	} else {
		return response.send({error:true,data:results[0],message:'Please enter Username and Password!'});
	}
});*/

app.get('/login', function (req, res) {
    let username = req.body.username;
	let password = req.body.password;
	console.log(username, password)
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
	dbConn.query('SELECT username FROM Login_Information WHERE username = ? AND password = ?', [username, password], function(error, results){
        if (error) throw error;
		console.log(results);
        return res.send({
            error: false,
            data: results[0],
            message: 'User retrieved'
        });
    });
});

