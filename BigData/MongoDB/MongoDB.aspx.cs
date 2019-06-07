using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Threading.Tasks;

namespace WebApplication1
{
    public partial class MongoDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Conectar a Mongo
            string MDBconnectionString = "mongodb://USERXXX:PASSWORDXXX@ds261644.mlab.com:61644/mongodbsandboxireland";
            MongoClient mclient = new MongoClient(MDBconnectionString);

            IMongoDatabase db = mclient.GetDatabase("mongodbsandboxireland");



            // CONSULTA de datos  - TO DO 
            //var collection = db.GetCollection<Colors>("Tests");




            // INSERTAR datos Crear un objeto 
            var ocolor = new Colors();

            ocolor.color = "new colour";
            ocolor.value = "AAA";

            var collection = db.GetCollection<Colors>("Tests");

            // Insertar un objeto (documento) en la BD
            collection.InsertOneAsync(ocolor).Wait();

            Response.Write("Terminado");
            
            

        }


        public async Task<IEnumerable<Colors>> ExecuteAsync(IMongoCollection<Colors> collection)
        {
            var filters = new List<FilterDefinition<Colors>>();


            var fullCollection = await collection.FindAsync();
            return await fullCollection.ToListAsync();
        }




    }
}