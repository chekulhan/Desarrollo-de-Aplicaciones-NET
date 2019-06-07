
var http = require('http');

var mathsmod = require('./maths');

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write("Sumar: " + mathsmod.sumar(5,2));
    res.end();
}).listen(process.env.PORT); 