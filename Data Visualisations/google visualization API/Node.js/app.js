var express = require('express');
var cors = require('cors');

var app = express();

app.get('/chart', function(req, res) {
  res.sendFile(__dirname + '/chart.html');
});

app.get('/datajson', cors(), (req, res, next) => {
    res.sendFile(__dirname + '/data.json');
}) 


app.listen(8001, function() {
  console.log('Aplicación ejemplo, escuchando el puerto 8001!');
});