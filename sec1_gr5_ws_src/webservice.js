const express = require('express');
require('dotenv').config();
const mysql = require('mysql2');
const bp = require('body-parser');

const app = express();
const router = express.Router();
app.use("/",router);
router.use(bp.json());
router.use(bp.urlencoded({
    extended: true
}))

app.listen(3032, () => {
    console.log('listening on 3032');
})

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