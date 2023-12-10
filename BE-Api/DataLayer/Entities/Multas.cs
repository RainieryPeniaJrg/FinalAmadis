using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE.FinalAmadis.DataLayer.Entities
{
    public class Multas
    {
        public int Id { get; set; }
        public string CedulaInfractor { get; set; } = string.Empty;
        public string PlacaVehiculo { get; set; } = string.Empty;
      
        //public string FotoEvidencia { get; set; } = string.Empty;
        public string Comentario { get; set; } = string.Empty;
        public double Latitud { get; set; }
        public double Longitud { get; set; }
        public DateTime Fecha { get; set; }
        //public TimeSpan Hora { get; set; }

        public int TipoMultaId { get; set; }
        public TipoMulta TipoMulta { get; set; }
        public int VehiculoId { get; set; }
        public Vehiculos Vehiculo { get; set; }
     
    }
}
