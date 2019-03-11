namespace MVCBlogs.DAL
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    using MVCBlogs.Models;

    public class DBWebBlog : DbContext
    {
        // El contexto se ha configurado para usar una cadena de conexión 'DBWebBlog' del archivo 
        // de configuración de la aplicación (App.config o Web.config). De forma predeterminada, 
        // esta cadena de conexión tiene como destino la base de datos 'MVCBlogs.DAL.DBWebBlog' de la instancia LocalDb. 
        // 
        // Si desea tener como destino una base de datos y/o un proveedor de base de datos diferente, 
        // modifique la cadena de conexión 'DBWebBlog'  en el archivo de configuración de la aplicación.
        public DBWebBlog()
            : base("name=DBWebBlog")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //Configure default schema
            modelBuilder.HasDefaultSchema("WebBlog");
        }

        // Agregue un DbSet para cada tipo de entidad que desee incluir en el modelo. Para obtener más información 
        // sobre cómo configurar y usar un modelo Code First, vea http://go.microsoft.com/fwlink/?LinkId=390109.

        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
    }

    //public class MyEntity
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}
}