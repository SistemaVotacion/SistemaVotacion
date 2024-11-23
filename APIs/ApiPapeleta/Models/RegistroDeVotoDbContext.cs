using Microsoft.EntityFrameworkCore;
namespace ApiPapeleta.Models
{


        public class RegistroDeVotoDbContext : DbContext
        {
            public RegistroDeVotoDbContext(DbContextOptions<RegistroDeVotoDbContext> options) : base(options) { }

            public DbSet<Candidato> Candidatos { get; set; }
            public DbSet<Provincia> Provincias { get; set; }
            public DbSet<Voto> Votos { get; set; }
        }
    
}
