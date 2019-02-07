using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OSWeb.Models
{
    public class Solicitud
    {

        public int IdSolicitud { get; set; }
        public string Empleador { get; set; }
        public string FechaSolicitud { get; set; }
        public string Estado { get; set; }
        public string Tipo { get; set; }       
        public string Responsable { get; set; }
        public string Sector { get; set; }
    }
}