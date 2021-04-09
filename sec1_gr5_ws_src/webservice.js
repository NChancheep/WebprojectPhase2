const express = require("express");
const path = require("path");
const http = require("http");
const fs = require("fs");
const app = express();

app.use(express.static(path.join(__dirname, '../sec1_gr5_src/css')));
app.use(express.static(path.join(__dirname, '../sec1_gr5_src/picture')));

const myQ1Server = http.createServer((req, res) => {
    const userPath = req.url; 
    if (userPath === "/") {
        fs.readFile("../sec1_gr5_src/html/HtmlMainpage.html", function (err, data) {
            console.log("Req at: " + userPath);
            res.statusCode = 200;
            res.setHeader("Content-Type", "text/html;charset=utf-8");
            res.write(data);
            res.end();
        });
    } else {
        console.log("Req at: " + userPath);
        res.statusCode = 404;
        res.setHeader("Content-Type", "text/plain");
        res.write("Where are you going?");
        res.end();
    }
 
});
console.log("Listening on the port 3030");
myQ1Server.listen(3030);