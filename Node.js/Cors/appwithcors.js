var express = require('express');
var cors = require('cors');

var app = express();


app.get('/datawithcors', cors(), (req, res, next) => {
res.json({ msg: 'WHOAH with CORS it works!' })
}) 


app.listen(8001, function() {
  console.log('Aplicación ejemplo, escuchando el puerto 8001!');
});