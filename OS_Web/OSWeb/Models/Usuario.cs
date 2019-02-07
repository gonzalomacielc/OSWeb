using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OSWeb.Models
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
        public int IdPerfil { get; set; }
        public int IdEmpleador { get; set; }
    }
}