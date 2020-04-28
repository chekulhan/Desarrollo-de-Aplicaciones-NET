using Microsoft.EntityFrameworkCore;
using DotNetConsole.Models;

namespace DotNetConsole.Data
{
    public class SQLiteDBContext : DbContext
    {
        public SQLiteDBContext() {

        }
        protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseSqlite("Data Source=sqlitevideogames.db");

        public DbSet<DotNetConsole.Models.VideoGame> VideoGames { get; set; }
    }
}
