using API_VotoTotal.Models;
using Microsoft.EntityFrameworkCore;

namespace API_VotoTotal.Data
{

    public class VotoTotalContext : DbContext
    {

        public VotoTotalContext(DbContextOptions<VotoTotalContext> options) : base(options)
        {
        }

        public DbSet<Candidatos> Candidatos { get; set; }
        public DbSet<Provincia> Provincias { get; set; }
        public DbSet<VotosTotales> VotosTotales { get; set; }



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Candidatos>().ToTable("Candidatos");
            modelBuilder
       .Entity<Candidatos>(
           eb =>
           {
               eb.HasNoKey();
               // eb.ToView("View_BlogPostCounts");
               eb.Property(v => v.nombre).HasColumnName("Candidato");
               eb.Property(v => v.VotosCandidato).HasColumnName("Total_Votos");

           });

            modelBuilder.Entity<Provincia>().ToTable("Provincias");
            modelBuilder
       .Entity<Provincia>(
           eb =>
           {
               eb.HasNoKey();
               // eb.ToView("View_BlogPostCounts");
               eb.Property(v => v.nombre).HasColumnName("Provincia");
               eb.Property(v => v.VotosProvincia).HasColumnName("Total_Votos");

           });

            modelBuilder.Entity<VotosTotales>().ToTable("VotosTotales");
            modelBuilder
       .Entity<VotosTotales>(
           eb =>
           {
               eb.HasNoKey();
              // eb.ToView("View_BlogPostCounts");
               eb.Property(v => v.VotosTodosCandidatos).HasColumnName("voto_id");
           });

        }
    }
}
