using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSWeb.Managers;
using OSWeb.Models;
using System.Text;

namespace OSWeb
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UsuarioMngr usmngr = new UsuarioMngr();
            Usuario us = new Usuario();

            if (System.Configuration.ConfigurationManager.AppSettings["SinDB"].ToString() == "True")
            {
                us.IdUsuario = 1;
                us.Email = "admin@admin.com";
                us.Contraseña = "admin";
                us.IdPerfil = 1;
                us.IdEmpleador = 1;
            }
            else
            {
                us = usmngr.getUsuario(__txtEmail.Value, __txtPass.Value);
            }

            if (us.IdUsuario != 0)
            {
                if (us.IdPerfil == 1)
                {   //En un futuro cambiar a la pagina de administracion
                    //Cache.Insert("Login" + us.IdUsuario, us, null, DateTime.Now.AddMinutes(10), System.Web.Caching.Cache.NoSlidingExpiration);
                    Session["Usuario"] = us;
                    Response.Redirect("~/Empleadores.aspx", true);

                    //Response.Clear();

                    //StringBuilder sb = new StringBuilder();
                    //string postbackUrl = "/Empleadores.aspx";
                    //sb.Append("<html>");
                    //sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                    //sb.AppendFormat("<form name='form' action='{0}' method='post'>", postbackUrl);
                    //sb.AppendFormat("<input type='hidden' name='idUsuario' value='{0}'>", us.IdUsuario);
                    //// Other params go here
                    //sb.Append("</form>");
                    //sb.Append("</body>");
                    //sb.Append("</html>");

                    //Response.Write(sb.ToString());

                    //Response.End();
                }
                else
                {
                    Session["Usuario"] = us;
                    Response.Redirect("~/Empleadores.aspx", true);

                    //Cache.Insert("Login" + us.IdUsuario, us, null, DateTime.Now.AddMinutes(10), System.Web.Caching.Cache.NoSlidingExpiration);
                    //Response.Redirect("~/Empleadores.aspx" + us.IdUsuario, true);

                    //Response.Clear();

                    //StringBuilder sb = new StringBuilder();
                    //string postbackUrl = "/Empleadores.aspx";
                    //sb.Append("<html>");
                    //sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                    //sb.AppendFormat("<form name='form' action='{0}' method='post'>", postbackUrl);
                    //sb.AppendFormat("<input type='hidden' name='idUsuario' value='{0}'>", us.IdUsuario);
                    //// Other params go here
                    //sb.Append("</form>");
                    //sb.Append("</body>");
                    //sb.Append("</html>");

                    //Response.Write(sb.ToString());

                    //Response.End();
                }

            }
            else
            {
                lblErrorLogin.Text = "Usuario o contraseña incorrecta!!";
                __txtEmail.Value = "";
            }
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            UsuarioMngr usmngr = new UsuarioMngr();
            EmpleadorMngr empl = new EmpleadorMngr();
            Usuario us = new Usuario();
            int okInsert = empl.insertEmpleador(__txtRazonSocial.Value, __txtNombreFantasia.Value, __txtCuit.Value, __txtDireccion.Value, __txtTelPrincipal.Value, __txtTelSecundario.Value, ddlProv.Value, __txtLocalidad.Value, __txtCodPostal.Value, __txtUsuario.Value);
            if (okInsert != 0)
            {
                int idusuario = usmngr.insertUsuario(__txtUsuario.Value, __txtPassword.Value, okInsert);

                if (idusuario != 0)
                {
                    us = usmngr.getUsuario(__txtUsuario.Value, __txtPassword.Value);
                    Session["Usuario"] = us;
                    Response.Redirect("~/Empleadores.aspx", true);
                }
                else
                {
                    lblErrorRegister.Text = "Error en creación de usuario";
                }

            }
            else
            {
                lblErrorRegister.Text = "Error en creación de Empleador";

            }

        }
    }
}