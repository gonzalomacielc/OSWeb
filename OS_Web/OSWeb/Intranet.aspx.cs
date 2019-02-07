using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSWeb.Managers;
using OSWeb.Models;
using System.Web.Services;

namespace OSWeb
{
    public partial class Intranet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //hdnIdUsuario.Value = Request["idUsuario"];
                //Usuario us = (Usuario)Cache.Get("Login" + hdnIdUsuario.Value);
                Usuario us = (Usuario)(Session["Usuario"]);
                validarLogin(us);
               
            }
        }

        protected void validarLogin(Usuario us)
        {
            if (us == null || us.IdUsuario == 0)
            {
                Response.Redirect("Register.aspx", true);
            }
            else
            {
                usuario.InnerHtml = us.Email + "<b class='caret'></b>";
            }
        }

        protected void gvEmpleadores_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            int index = gvr.RowIndex;
            //hdnIdEmpleado.Value = gvEmpleados.DataKeys[index].Value.ToString();
            //txtNombre.Value = gvEmpleados.DataKeys[index].Values["Nombre"].ToString();
            //txtApellido.Value = gvEmpleados.DataKeys[index].Values["Apellido"].ToString();
            //txtCuil.Value = gvEmpleados.DataKeys[index].Values["Cuil"].ToString();
            //txtFechaAlta.Text = DateTime.Parse(gvEmpleados.DataKeys[index].Values["FechaAlta"].ToString()).ToString("yyyy-MM-dd");
            //txtFechaBaja.Text = gvEmpleados.DataKeys[index].Values["FechaBaja"] == null ? "" : DateTime.Parse(gvEmpleados.DataKeys[index].Values["FechaBaja"].ToString()).ToString("yyyy-MM-dd");

            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append(@"<script type='text/javascript'>");
            //sb.Append("$('#hdnEdit').val('1');");
            //sb.Append("$('#myModal').modal({backdrop: 'static', keyboard: false});");
            //sb.Append("$('#myModal').modal('show');");
            //sb.Append("$('#myModalLabel').html('Editar Empleado');");
            //sb.Append("ActivarBotonBaja();");
            //sb.Append(@"</script>");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);

        }

        //protected void btnEmpleados_Click(object sender, EventArgs e)
        //{
            
        //}
               

        //protected void btnEmpleador_Click(object sender, EventArgs e)
        //{
        //    EmpleadorMngr empleadormng = new EmpleadorMngr();
        //    List<Empleador> empleadoresList = new List<Empleador>();
        //    empleadoresList = empleadormng.getEmpleadorByFilter(txtBusquedaEmpleador.Text);

        //    gvEmpleadores.DataSource = empleadoresList;
        //    gvEmpleadores.DataBind();
        //    gvEmpleados.DataSource = empleadoresList;
        //    gvEmpleados.DataBind();
        //}

        [WebMethod]
        public static List<Empleador> GetAllEmpleadores()
        {

            List<Empleador> empleadorList = new List<Empleador>();
            EmpleadorMngr empleadorMng = new EmpleadorMngr();

            empleadorList = empleadorMng.getAllEmpleadores();

            return empleadorList;

        }


        [WebMethod]
        public static List<Empleado> GetEmpleadosByEmpleador(string idEmpleador)
        {

            List<Empleado> empleadoList = new List<Empleado>();
            EmpleadoMngr empleadoMng = new EmpleadoMngr();

            empleadoList = empleadoMng.getEmpleadosByIdEmpleador(int.Parse(idEmpleador));

            return empleadoList;

        }


        [WebMethod]
        public static List<Solicitud> GetLastSolicitudes()
        {

            List<Solicitud> solicitudList = new List<Solicitud>();
            SolicitudMngr solicitudMngr = new SolicitudMngr();

            solicitudList = solicitudMngr.getLastSolicitudes();

            return solicitudList;

        }

        [WebMethod]
        public static List<Solicitud> GetSolicitudesByIdEmpleador(string idEmpleador)
        {

            List<Solicitud> solicitudList = new List<Solicitud>();
            SolicitudMngr solicitudMngr = new SolicitudMngr();

            solicitudList = solicitudMngr.getSolicitudesByIdEmpleador(int.Parse(idEmpleador));

            return solicitudList;

        }
    }
}