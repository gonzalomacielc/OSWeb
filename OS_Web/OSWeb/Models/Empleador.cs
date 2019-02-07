using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OSWeb.Models
{
    public class Empleador
    {
        public int IdEmpleador { get; set; }
        public string RazonSocial { get; set; }
        public string NombreFantasia { get; set; }
        public string Cuit { get; set; }
        public string TelefonoPrincipal { get; set; }
        public string TelefonoSecundario { get; set; }
        public string Direccion { get; set; }
        public string Localidad { get; set; }
        public string Provincia { get; set; }
        public string CodPostal { get; set; }
        public string Email { get; set; }

    } 
}