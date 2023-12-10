using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE.FinalAmadis.DataLayer.Context;
using BE.FinalAmadis.DataLayer.Core;
using BE.FinalAmadis.DataLayer.Entities;
using BE.FinalAmadis.DataLayer.Interfaces;

namespace BE.FinalAmadis.DataLayer.Repositories
{
    public class MultasRepostory : Repository<Multas>, IMultasRepository
    {
        public MultasRepostory(ProyectoContext context) : base(context) { }
    }
}
