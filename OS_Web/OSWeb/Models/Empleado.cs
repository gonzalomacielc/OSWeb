using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OSWeb.Models
{
    public class Empleado
    {
        public int IdEmpleado { get; set; }
        public int IdEmpleador { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Cuil { get; set; }      
        public string Agrupacion { get; set; }
        public string Categoria { get; set; }
        public string TipoContrato { get; set; }
        public string Jornada { get; set; }
        public string FechaAlta { get; set; }
        public string FechaBaja { get; set; }

    }
}