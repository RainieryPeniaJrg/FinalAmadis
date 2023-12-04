using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE.FinalAmadis.DataLayer.Entities
{
    public class Conductor
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Apellido { get; set; } = string.Empty;
        public string FechaNacimiento { get; set; } = string.Empty;
        public string Direccion { get; set; } = string.Empty;
        public string NumeroDeTelefono { get; set; } = string.Empty;
        public string Cedula { get; set; } = string.Empty;
    }
}
