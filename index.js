const express = require('express');
const app = express();
const port = process.env.PORT || 8080;
const target = process.env.TARGET || 'World';

app.get('/', (req, res) => {
  console.log('Hello world received a request.');
  
  res.send(`Hello ${target}!`);
});

app.listen(port, () => {
  console.log('Hello world listening on port', port);
});
