const express = require('express');
const router = express.Router();
const app = express();
const mysql = require('mysql2');
const bp = require('body-parser');
var session = require('express-session');
const bodyParser = require('body-parser');
var path = require('path');

require('dotenv').config();
const port = 3030;

app.use("/",router);

// Setting up the public directory
app.use('/public', express.static('sec1_gr5_src'));


let dbConn = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USERNAME,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
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

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.get('/', function(req, res){
    res.sendFile(path.join(__dirname+'./sec1_gr5_src/HtmlLoginpage.html'));
    console.log("kuy jump");
});
app.post('/auth', function(req,res){
    var username = req.body.username;
    var password = req.body.password;
    if (username && password)
    {
        dbConn.query('SELECT * FROM Login_Information WHERE username = ? AND password = ?', {username, password}, function(error, results, fields)
        {
            if (results.length > 0) {
                req.session.loggedIn = true;
                req.session.username = username;
                res.redirect('/home');
            }
            else{
                res.send('Invalid');
            }
            res.end();
        });
    }
    else{
        res.send('plz enter user and pass');
        res.end();
    }
});

app.get('/home', function(req,res){
    if (req.session.loggedIn){
        res.send('Welcome back');
    }else{
        res.send('plz login to view');
    }
    res.end();
});

app.listen(port, () => console.log(`listening on port ${port}!`));