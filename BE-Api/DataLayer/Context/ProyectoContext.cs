using BE.FinalAmadis.DataLayer.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE.FinalAmadis.DataLayer.Context
{
    public class ProyectoContext :  DbContext
    {
      
        public DbSet<TipoMulta> TiposMultas { get; set; }
        public DbSet<Multas> Multas { get; set; }
        public DbSet<Vehiculos> Vehiculos { get; set; }
        public DbSet<Conductor> Conductores { get; set; }
        public ProyectoContext(DbContextOptions<ProyectoContext> options) : base(options) { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=.;Database=AmadisFinal;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Multas>()
                .HasOne(m => m.TipoMulta)
                .WithMany()
                .HasForeignKey(m => m.TipoMultaId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Multas>()
                .HasOne(m => m.Vehiculo)
                .WithMany()
                .HasForeignKey(m => m.VehiculoId)
                .OnDelete(DeleteBehavior.NoAction);
        }
    }

}
