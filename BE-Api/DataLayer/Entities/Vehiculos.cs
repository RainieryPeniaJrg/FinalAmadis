using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE.FinalAmadis.DataLayer.Entities
{
    public class Vehiculos
    {
        public int Id { get; set; }
        public string Placa { get; set; } = string.Empty;
        public string Color { get; set; } = string.Empty;
        public string Marca { get; set; } = string.Empty;
        public string Modelo { get; set; } = string.Empty;
        public int Anio { get; set; } = int.MaxValue;

        public int IdMulta { get; set; }
        public Multas Multa { get; set; }
    }
}
