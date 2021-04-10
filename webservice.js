const express = require('express');
const app = express();
const port = 3030;

// Setting up the public directory
app.use('/public', express.static('sec1_gr5_src'));

app.listen(port, () => console.log(`listening on port ${port}!`));