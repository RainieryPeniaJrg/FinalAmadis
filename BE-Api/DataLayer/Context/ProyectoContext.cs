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
    }
}
