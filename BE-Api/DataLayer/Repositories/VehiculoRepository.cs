using BE.FinalAmadis.DataLayer.Core;
using BE.FinalAmadis.DataLayer.Entities;
using BE.FinalAmadis.DataLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE.FinalAmadis.DataLayer.Context;

namespace BE.FinalAmadis.DataLayer.Repositories
{
    public class VehiculoRepository : Repository<Vehiculos>, IVehiculoRepository
    {
       

        public VehiculoRepository(ProyectoContext context) : base(context ){ }
       
    }
}
