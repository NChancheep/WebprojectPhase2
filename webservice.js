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
	host     : process.env.MYSQL_HOST,
	user     : process.env.MYSQL_USERNAME,
	password : process.env.MYSQL_PASSWORD,
	database : process.env.MYSQL_DATABASE
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

//apadij
//itcs212_1
app.post('/login', function (req, res) {
    let username = req.body.info.username;
	let password = req.body.info.password;
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
	dbConn.query('SELECT * FROM Login_Information WHERE username = ? AND password = ?', [username, password], function(error, results){
        if (error) throw error;
		if (results.length > 0)
		{
			console.log(results);
			return res.send({
				error: false,
				data: results[0],
				message: 'User retrieved'
			});
		}
        else
		{
			console.log(results);
			return res.send({
			error: true,
			data: results[0],
			message: 'ERROR'
		});
		}
    });
});

