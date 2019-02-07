using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OSWeb.Models;
using System.Data.SqlClient;
using System.Data;

namespace OSWeb.Managers
{
    public class EmpleadorMngr
    {
        public List<Empleador> getEmpleadorByFilter(string busquedaEmpleador)
        {
            try
            {
                List<Empleador> EmpleadorLista = new List<Empleador>();
                SqlDataReader rdr = null;

                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spGetEmpleadorByFilters", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("pBusquedaEmpleador", SqlDbType.VarChar)).Value = (busquedaEmpleador == "") ? (object)DBNull.Value : busquedaEmpleador;
                   
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Empleador Emp = new Empleador();
                        Emp.IdEmpleador = int.Parse(rdr["IdEmpleador"].ToString());
                        Emp.RazonSocial = rdr["RazonSocial"].ToString();
                        Emp.NombreFantasia = rdr["NombreFantasia"].ToString();
                        Emp.Cuit = rdr["Cuit"].ToString();
                        Emp.TelefonoPrincipal = rdr["TelefonoPrincipal"].ToString();
                        Emp.TelefonoSecundario = rdr["TelefonoSecundario"].ToString();
                        Emp.Direccion = rdr["Direccion"].ToString();
                        Emp.Localidad = rdr["Localidad"].ToString();
                        Emp.Provincia = rdr["Provincia"].ToString();                      
                        Emp.Email = rdr["EmailPrincipal"].ToString();

                        EmpleadorLista.Add(Emp);

                    }
                    conn.Close();
                }

                rdr.Dispose();
                rdr.Close();

                return EmpleadorLista;
            }


            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int insertEmpleador(string RazonSocial, string NombreFantasia, string Cuit, string Direccion, string TelefonoPrincipal, string TelefonoSecundario, string Provincia, string Localidad ,string CodigoPostal, string Email)
        {
            try
            {

                int IdEmpleador;
                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spInsertEmpleador", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("pRazonSocial", SqlDbType.VarChar)).Value = (RazonSocial == "") ? (object)DBNull.Value : RazonSocial;
                    cmd.Parameters.Add(new SqlParameter("pNombreFantasia", SqlDbType.VarChar)).Value = (NombreFantasia == "") ? (object)DBNull.Value : NombreFantasia;
                    cmd.Parameters.Add(new SqlParameter("pCuit", SqlDbType.VarChar)).Value = (Cuit == "") ? (object)DBNull.Value : Cuit;
                    cmd.Parameters.Add(new SqlParameter("pDireccion", SqlDbType.VarChar)).Value = (Direccion == "") ? (object)DBNull.Value : Direccion;
                    cmd.Parameters.Add(new SqlParameter("pTelefonoPrincipal", SqlDbType.VarChar)).Value = (TelefonoPrincipal == "") ? (object)DBNull.Value : TelefonoPrincipal;
                    cmd.Parameters.Add(new SqlParameter("pTelefonoSecundario", SqlDbType.VarChar)).Value = (TelefonoSecundario == "") ? (object)DBNull.Value : TelefonoSecundario;
                    cmd.Parameters.Add(new SqlParameter("pProvincia", SqlDbType.VarChar)).Value = (Provincia == "") ? (object)DBNull.Value : Provincia;
                    cmd.Parameters.Add(new SqlParameter("pLocalidad", SqlDbType.VarChar)).Value = (Localidad == "") ? (object)DBNull.Value : Localidad;
                    cmd.Parameters.Add(new SqlParameter("pCodigoPostal", SqlDbType.VarChar)).Value = (CodigoPostal == "") ? (object)DBNull.Value : CodigoPostal;
                    cmd.Parameters.Add(new SqlParameter("pEmail", SqlDbType.VarChar)).Value = (Email == null) ? (object)DBNull.Value : Email;
                    cmd.Parameters.Add(new SqlParameter("pIdEmpleador", SqlDbType.Int)).Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    IdEmpleador = Convert.ToInt32(cmd.Parameters["pIdEmpleador"].Value);
                    conn.Close();
                }



                return IdEmpleador;

            }
            catch (Exception ex)
            {
                return 0;
            }

        }

        public int UpdateEmpleador(int IdEmpleador, string RazonSocial, string NombreFantasia, string Cuit, string Direccion, string TelefonoPrincipal, string TelefonoSecundario, string Provincia, string Localidad, string CodigoPostal, string Email)
        {
            try
            {
                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spUpdateEmpleador", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("pIdEmpleador", SqlDbType.Int)).Value = (IdEmpleador == 0) ? (object)DBNull.Value : IdEmpleador;
                    cmd.Parameters.Add(new SqlParameter("pRazonSocial", SqlDbType.VarChar)).Value = (RazonSocial == "") ? (object)DBNull.Value : RazonSocial;
                    cmd.Parameters.Add(new SqlParameter("pNombreFantasia", SqlDbType.VarChar)).Value = (NombreFantasia == "") ? (object)DBNull.Value : NombreFantasia;
                    cmd.Parameters.Add(new SqlParameter("pCuit", SqlDbType.VarChar)).Value = (Cuit == "") ? (object)DBNull.Value : Cuit;
                    cmd.Parameters.Add(new SqlParameter("pDireccion", SqlDbType.VarChar)).Value = (Direccion == "") ? (object)DBNull.Value : Direccion;
                    cmd.Parameters.Add(new SqlParameter("pTelefonoPrincipal", SqlDbType.VarChar)).Value = (TelefonoPrincipal == "") ? (object)DBNull.Value : TelefonoPrincipal;
                    cmd.Parameters.Add(new SqlParameter("pTelefonoSecundario", SqlDbType.VarChar)).Value = (TelefonoSecundario == "") ? (object)DBNull.Value : TelefonoSecundario;
                    cmd.Parameters.Add(new SqlParameter("pProvincia", SqlDbType.VarChar)).Value = (Provincia == "") ? (object)DBNull.Value : Provincia;
                    cmd.Parameters.Add(new SqlParameter("pLocalidad", SqlDbType.VarChar)).Value = (Localidad == "") ? (object)DBNull.Value : Localidad;
                    cmd.Parameters.Add(new SqlParameter("pCodigoPostal", SqlDbType.VarChar)).Value = (CodigoPostal == "") ? (object)DBNull.Value : CodigoPostal;
                    cmd.Parameters.Add(new SqlParameter("pEmail", SqlDbType.VarChar)).Value = (Email == null) ? (object)DBNull.Value : Email;

                    cmd.ExecuteNonQuery();

                    conn.Close();
                }

                return 0;

            }
            catch (Exception ex)
            {
                return 1;
            }
        }

        public Empleador getEmpleador(int idEmpleador)
        {
            try
            {
                Empleador Emp = new Empleador();
                SqlDataReader rdr = null;

                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spGetEmpleador", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("pIdEmpleador", SqlDbType.VarChar)).Value = (idEmpleador == 0) ? (object)DBNull.Value : idEmpleador;
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {

                        Emp.IdEmpleador = int.Parse(rdr["IdEmpleador"].ToString());
                        Emp.RazonSocial = rdr["RazonSocial"].ToString();
                        Emp.NombreFantasia = rdr["NombreFantasia"].ToString();
                        Emp.Cuit = rdr["Cuit"].ToString();
                        Emp.TelefonoPrincipal = rdr["TelefonoPrincipal"].ToString();
                        Emp.TelefonoSecundario = rdr["TelefonoSecundario"].ToString();
                        Emp.Direccion = rdr["Direccion"].ToString();
                        Emp.Localidad = rdr["Localidad"].ToString();
                        Emp.Provincia = rdr["Provincia"].ToString();
                        Emp.CodPostal = rdr["CodigoPostal"].ToString();
                        Emp.Email = rdr["EmailPrincipal"].ToString();

                    }
                    conn.Close();
                }

                rdr.Dispose();
                rdr.Close();

                return Emp;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Empleador> getAllEmpleadores()
        {
            try
            {
                List<Empleador> EmpleadorList = new List<Empleador>();
               
                SqlDataReader rdr = null;

                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spGetAllEmpleadores", conn);

                    cmd.CommandType = CommandType.StoredProcedure;
                   
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Empleador Emp = new Empleador();
                        Emp.IdEmpleador = int.Parse(rdr["IdEmpleador"].ToString());
                        Emp.RazonSocial = rdr["RazonSocial"].ToString();
                        Emp.NombreFantasia = rdr["NombreFantasia"].ToString();
                        Emp.Cuit = rdr["Cuit"].ToString();
                        Emp.TelefonoPrincipal = rdr["TelefonoPrincipal"].ToString();
                        Emp.TelefonoSecundario = rdr["TelefonoSecundario"].ToString();
                        Emp.Direccion = rdr["Direccion"].ToString();
                        Emp.Localidad = rdr["Localidad"].ToString();
                        Emp.Provincia = rdr["Provincia"].ToString();
                        Emp.CodPostal = rdr["CodigoPostal"].ToString();
                        Emp.Email = rdr["EmailPrincipal"].ToString();

                        EmpleadorList.Add(Emp);
                    }
                    conn.Close();
                }

                rdr.Dispose();
                rdr.Close();

                return EmpleadorList;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}

