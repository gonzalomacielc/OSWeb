using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSWeb.Managers;
using OSWeb.Models;

namespace OSWeb
{
    public partial class Empleadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //hdnIdUsuario.Value = Request["idUsuario"];
                //Usuario us = (Usuario)Cache.Get("Login" + hdnIdUsuario.Value);
                Usuario us = (Usuario)(Session["Usuario"]);
                validarLogin(us);
                cargarEmpleador(us);
                cargarEmpleados(us);

            }
            else
            {
                validarLogin((Usuario)(Session["Usuario"]));
                if (gvEmpleados.Rows.Count != 0)
                {
                    gvEmpleados.UseAccessibleHeader = true;
                    gvEmpleados.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            btnGuardar.Style.Add("visibility", "hidden");

            Usuario us = (Usuario)(Session["Usuario"]);

            EmpleadorMngr emp = new EmpleadorMngr();
            emp.UpdateEmpleador(us.IdEmpleador, txtRazonSocial.Value, txtNombreFantasia.Value, txtCuit.Value, txtDireccion.Value, txtTelPrin.Value, txtTelSec.Value, selPcia.Value, txtLocalidad.Value ,txtCodPostal.Value, txtEmail.Value);
        }

        protected void gvEmpleados_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvEmpleados_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btnCargaEmpleado_Click(object sender, EventArgs e)
        {
            Usuario us = (Usuario)(Session["Usuario"]);

            EmpleadoMngr emp = new EmpleadoMngr();
            if (txtNombre.Value != "" && txtApellido.Value != "" && txtCuil.Value != "" && ddlAgrupacion.Value != "" && ddlCategoria.Value != "" && ddlTipoContrato.Value != "" && ddlJornada.Value != "" && DateTime.Parse(txtFechaAlta.Text) != null)
            {
                if (hdnEdit.Value == "0")
                {
                    emp.insertEmpleado(us.IdEmpleador, txtNombre.Value, txtApellido.Value, txtCuil.Value, ddlAgrupacion.Value, ddlCategoria.Value, ddlTipoContrato.Value, ddlJornada.Value, DateTime.Parse(txtFechaAlta.Text));
                }
                else
                {
                    DateTime? fechabaja = string.IsNullOrEmpty(txtFechaBaja.Text) ? (DateTime?)null : DateTime.Parse(txtFechaBaja.Text);

                    emp.editEmpleado(int.Parse(hdnIdEmpleado.Value), txtNombre.Value, txtApellido.Value, txtCuil.Value, ddlAgrupacion.Value, ddlCategoria.Value, ddlTipoContrato.Value, ddlJornada.Value, DateTime.Parse(txtFechaAlta.Text), fechabaja);
                }
                cargarEmpleados(us);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            }
            else
            {
                lblError.Visible = true;

            }

           
         
        }

        protected void cargarEmpleados(Usuario us)
        {
            EmpleadoMngr emp = new EmpleadoMngr();
            List<Empleado> EmpleList = new List<Empleado>();

            if (System.Configuration.ConfigurationManager.AppSettings["SinDB"].ToString() == "True")
            {
                Empleado emp1 = new Empleado();
                emp1.IdEmpleador = 1;
                emp1.IdEmpleado = 1;
                emp1.Nombre = "Gonzalo";
                emp1.Apellido = "Maciel";
                emp1.Cuil = "2392562569";
                emp1.Agrupacion = "Otros";
                emp1.Categoria = "Cuarta";
                emp1.TipoContrato = "Permanente";
                emp1.Jornada = "Completa";
                emp1.FechaAlta = "01/01/2017";

                EmpleList.Add(emp1);

                Empleado emp2 = new Empleado();
                emp2.IdEmpleador = 1;
                emp2.IdEmpleado = 1;
                emp2.Nombre = "Melina";
                emp2.Apellido = "Maldonado";
                emp2.Cuil = "238545549";
                emp2.Agrupacion = "Otros";
                emp2.Categoria = "Cuarta";
                emp2.TipoContrato = "Permanente";
                emp2.Jornada = "Completa";
                emp2.FechaAlta = "01/01/2017";

                EmpleList.Add(emp2);
            }
            else
            {
                EmpleList = emp.getEmpleadosByIdEmpleador(us.IdEmpleador);
            }
            gvEmpleados.DataSource = EmpleList;
            gvEmpleados.DataBind();

            if (gvEmpleados.Rows.Count != 0)
            {
                gvEmpleados.UseAccessibleHeader = true;
                gvEmpleados.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


        protected void cargarEmpleador(Usuario us)
        {
            EmpleadorMngr empleamng = new EmpleadorMngr();
            Empleador emple = new Empleador();

            if (System.Configuration.ConfigurationManager.AppSettings["SinDB"].ToString() == "True")
            {
                txtRazonSocial.Value = "Empresa Ficticia";
                txtNombreFantasia.Value = "Empresa Ficticia";
                txtCuit.Value = "235656569";
                txtDireccion.Value = "Direccion 123";
                txtTelPrin.Value = "11565656";
                txtTelSec.Value = "1154655656";
                selPcia.Value = "Ciudad Autónoma de Buenos Aires";
                txtCodPostal.Value = "1001";
                txtEmail.Value = "Admin@admin.com";
            }
            else
            {
                emple = empleamng.getEmpleador(us.IdEmpleador);
                txtRazonSocial.Value = emple.RazonSocial;
                txtNombreFantasia.Value = emple.NombreFantasia;
                txtCuit.Value = emple.Cuit;
                txtDireccion.Value = emple.Direccion;
                txtTelPrin.Value = emple.TelefonoPrincipal;
                txtTelSec.Value = emple.TelefonoSecundario;
                selPcia.Value = emple.Provincia;
                txtLocalidad.Value = emple.Localidad;
                txtCodPostal.Value = emple.CodPostal;
                txtEmail.Value = emple.Email;
            }
        }

        protected void gvEmpleados_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            int index = gvr.RowIndex;
            hdnIdEmpleado.Value = gvEmpleados.DataKeys[index].Value.ToString();
            txtNombre.Value = gvEmpleados.DataKeys[index].Values["Nombre"].ToString();
            txtApellido.Value = gvEmpleados.DataKeys[index].Values["Apellido"].ToString();
            txtCuil.Value = gvEmpleados.DataKeys[index].Values["Cuil"].ToString();     
            txtFechaAlta.Text = DateTime.Parse(gvEmpleados.DataKeys[index].Values["FechaAlta"].ToString()).ToString("yyyy-MM-dd");
            txtFechaBaja.Text = gvEmpleados.DataKeys[index].Values["FechaBaja"] == null ? "" : DateTime.Parse(gvEmpleados.DataKeys[index].Values["FechaBaja"].ToString()).ToString("yyyy-MM-dd");

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#hdnEdit').val('1');");
            sb.Append("$('#myModal').modal({backdrop: 'static', keyboard: false});");
            sb.Append("$('#myModal').modal('show');");
            sb.Append("$('#myModalLabel').html('Editar Empleado');");
            sb.Append("ActivarBotonBaja();");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);

        }

        protected void validarLogin(Usuario us)
        {
            if (us == null || us.IdUsuario == 0)
            {
                Response.Redirect("Register.aspx", true);
            }
        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            Decimal remunebase = 0;
            CalculoMngr calc = new CalculoMngr();
            remunebase = calc.getRemunBasica(selAgLibreDeuda.Value, selCatLibreDeuda.Value, Decimal.Parse(txtRemBas.Text));

            Decimal Aportes = CalculoAportes(remunebase);
            Decimal Contribuciones = CalculoContribuciones(remunebase);
            Decimal Total = Aportes + Contribuciones;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#myModalAp').modal({backdrop: 'static', keyboard: false});");
            sb.Append("$('#lblCalcAportes').html('" + Aportes + "' );");
            sb.Append("$('#lblCalcContribuciones').html('" + Contribuciones + "' );");
            sb.Append("$('#lblCalcTotal').html('" + Total + "' );");
            sb.Append("$('#myModalAp').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScriptAP", sb.ToString(), false);
        }

        protected void btnSolicitar_Click(object sender, EventArgs e)
        {            
            int sol = 0;
            Usuario us = (Usuario)(Session["Usuario"]);
            SolicitudMngr solmngr = new SolicitudMngr();
            sol = solmngr.insertSolicitud(us.IdEmpleador, "LibreDeuda");
            Mailing m = new Mailing();            
            m.Asunto = "Solicitud de libre deuda N°" + sol;
            m.To = System.Configuration.ConfigurationManager.AppSettings["SMTPTo"];
            m.Cc = this.txtEmail.Value;
            m.Body = "El empleador " + this.txtRazonSocial.Value + " Cuit: "+ this.txtCuit.Value + " Mail: " +  this.txtEmail.Value + " solicita el comprobante de libre deuda." + Environment.NewLine + "Se genera la solicitud N°" + sol;
            m.Enviar();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#myModalSol').modal({backdrop: 'static', keyboard: false});");
            sb.Append("$('#lblSol').html('" + sol  + "' );");
            sb.Append("$('#myModalSol').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScriptLD", sb.ToString(), false);
        }

        protected Decimal CalculoAportes (decimal remuneracion)
        {
            Decimal aporte = remuneracion * 3 / 100;        

            return aporte;
        }

        protected Decimal CalculoContribuciones( decimal remuneracion)
        {
            Decimal contribucion = remuneracion * 6 / 100;

            return contribucion;
        }

    }
}