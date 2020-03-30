// programación sincrona
var fs = require("fs");
var data = fs.readFileSync("archivo1.txt", "utf8");
console.log(data);
console.log("after calling readFileSynch");

// programación asincrona
fs.readFile("archivo1.txt", "utf8", function(err, data) {
  if (err) return console.error(err);
  console.log(data);
});



// Modulos Básicos: MINI PROYECTOS

// Actividad: Datos de plataforma
const os = require("os");

console.log(os.platform());
console.log(os.arch());

// Motor v8 de Chrome / Node
const v8 = require("v8");

var s = v8.getHeapStatistics();
console.log(JSON.stringify(s));



// inspect objetos y modules
var persona = new Object();
persona.name = "Jon";
persona.apellido = "Maria";
persona.edad = 34;

const fs = require("fs");
const util = require("util");

console.log(util.inspect(fs));


// Guardar datos de user en formato JSON en archivo
const os = require("os");

var user = os.userInfo();
console.log(JSON.stringify(user));
fs.writeFile("user.json", JSON.stringify(user), "utf8", function(err, data) {
  if (err) return console.error(err);
  console.log("data written to file");
});




// Importar modulos - npm instal X
var uc = require("upper-case");
console.log(uc);
var s = "this is a string";

console.log(uc.upperCase(s));


// Paises y sus regiones
var worldCountries = require("world-countries");

worldCountries.forEach(element => {
  console.log(`Pais ${element.name.common} y region: ${element.region}`);
});

console.log("end");


// npm i chalk
var Chalk = require("chalk");
console.log(Chalk.blue("Hello world"));
console.log("end");


