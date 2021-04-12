const express = require('express');
const app = express();
const mysql = require('mysql2');
const bp = require('body-parser');

require('dotenv').config();

const port = 3030;

const router = express.Router();
app.use("/",router);
router.use(bp.json());
router.use(bp.urlencoded({
    extended: true
}))
// Setting up the public directory
app.use('/public', express.static('sec1_gr5_src'));

app.listen(port, () => console.log(`listening on port ${port}!`));

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