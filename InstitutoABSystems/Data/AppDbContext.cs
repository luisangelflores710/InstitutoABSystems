using InstitutoABSystems.Models;
using InstitutoABSystems.Pages;
using Microsoft.EntityFrameworkCore;
 
namespace InstitutoABSystems.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Estudiante> Estudiantes { get; set; }
        public DbSet<Examen> Examenes { get; set; }
        public DbSet<Inscrip> Inscripciones { get; set; }
    }
}
