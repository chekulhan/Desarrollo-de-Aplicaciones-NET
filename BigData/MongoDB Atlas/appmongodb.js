
var express = require('express');
var app=express();


const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://admin:XXXXXXX@centroseim-deot8.mongodb.net/sample_airbnb?retryWrites=true&w=majority";
var strResponse = "";

app.route('/AirBNB').get(function(req, res)  {

  const client = new MongoClient(uri, { useNewUrlParser: true });

  client.connect()
    .then(function (err, db)
      {
        var db = client.db('sample_airbnb');
        
        // Ejercio 1:
        /* return db.collection('listingsAndReviews').findOne({"_id": "10359729"})
          .then(result => {
            if(result) {
              console.log('Successfully found document: ' + result);
              res.send(result.summary);

            } else {
              console.log('No document matches the provided query.')
            }
            return result
          })
          .catch(err => console.error('Failed to find document: ${err}'))
 */
 // fin de Ejercio 1:


          // Ejercicio 2:
        var strquery = {"minimum_nights":"1"};

         const options = {
          "projection": { "_id": 0 },
          "sort": { "name": 1 }
        };
        
        db.collection('listingsAndReviews').find(strquery, options).toArray(function (err, result) {
          result.forEach(element => {
            strResponse = strResponse + "<p>" + element.name + "</p>";
          });
          res.send(strResponse);
          client.close();
        });
      });
    // fin de Ejercicio 2:
 

          /* // Ejercicio 3:
      return db.collection('listingsAndReviews').count(strquery)
          .then(numDocs => res.json('${numDocs} items have a review.' + numDocs))
          //.then(numDocs => console.log('${numDocs} items have a review.' + numDocs))
          .catch(err => console.error("Failed to count documents: ", err))
      });  */
      // fin de Ejercicio 3:
     

});



var server = app.listen(8001, function() {
  console.log('Example app listening on port 8001!');
}); 
