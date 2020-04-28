using System;
using System.Linq;
using DotNetConsole.Data;
using DotNetConsole.Models;

namespace DotNetConsole
{
    class Program
    {
        static void Main(string[] args)
        {

            using (var db = new SQLiteDBContext())
            {
                // Insert
                db.VideoGames.Add(new VideoGame { Title="Pokemon", Platform = "Nintendo", ReleaseYear=2001});
                db.VideoGames.Add(new VideoGame { Title="Minecraft", Platform = "XBox", ReleaseYear=2020});

                db.SaveChanges();
                Console.WriteLine("Video juego añadido...");

                // Read
                Console.WriteLine("Buscando video juegos...");
                var videogames = db.VideoGames.ToList();
                
                foreach (var videogame in videogames)
                {
                    Console.WriteLine($"{videogame.Title} - {videogame.Platform} - {videogame.ReleaseYear}");
                    Console.Write(videogame.Title);
                    Console.WriteLine(videogame.Platform);
                }
               
                // Borrar
                Console.WriteLine("Borrando un video juego...");
                VideoGame vg1 = db.VideoGames.First(); //get un objeto

                db.VideoGames.Remove(vg1);
                db.SaveChanges();


                //Actualizar
                Console.WriteLine("Actualizando un video juego...");
                VideoGame vg2 = db.VideoGames.First(); //get un objeto
                
                vg2.ReleaseYear = 1990;

                db.SaveChanges();

               
            }


           
            
        }
    }
}
