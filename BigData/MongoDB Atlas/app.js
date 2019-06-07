
var express = require('express');
var app=express();


const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://admin:XXXXXX@centroseim-deot8.mongodb.net/sample_airbnb?retryWrites=true&w=majority";
var strResponse = "";

app.route('/AirBNB').get(function(req, res)  {

  const client = new MongoClient(uri, { useNewUrlParser: true });

  client.connect(function (err, db) {
      if (err) {
        strResponse = 'Unable to connect to the mongoDB server. Error:' + err;
      }
      else {

            var db = client.db('sample_airbnb');
              
             // Get un documento (fila)
            //var strquery = {_id: "10359729"};
             db.collection('listingsAndReviews').findOne({"_id": "10359729"}, function (findErr, result) {
              if (findErr) throw findErr;
                strResponse = "<p>";
                strResponse = strResponse + result.name + ": ";
                strResponse = strResponse + result.description;
                strResponse = strResponse + "</p>";
                client.close();
            }); 


             var strquery = {"minimum_nights":"1"};
            db.collection('listingsAndReviews').find(strquery).forEach(function(result) {
                strResponse = strResponse + "<p>";
                strResponse = strResponse + result.name + ": ";
                strResponse = strResponse + result.listing_url;
                strResponse = strResponse + "</p>";
                
            });

            
      }
    });
  
  client.close();
  res.send(strResponse);

});


var server = app.listen(8001, function() {
  console.log('Example app listening on port 8001!');
}); 
