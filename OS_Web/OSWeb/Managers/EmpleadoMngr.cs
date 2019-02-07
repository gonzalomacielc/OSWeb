using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OSWeb.Models;
using System.Data.SqlClient;
using System.Data;

namespace OSWeb.Managers
{
    public class EmpleadoMngr
    {

        public List<Empleado> getEmpleadosByIdEmpleador(int IdEmpleador)
        {

            try
            {
                List<Empleado> ListaEmpleado = new List<Empleado>();
                SqlDataReader rdr = null;

                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spGetEmpleadosByIdEmpleador", conn);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("pIdEmpleador", SqlDbType.Int)).Value = (IdEmpleador == 0) ? (object)DBNull.Value : IdEmpleador;

                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Empleado Emp = new Empleado();
                        Emp.IdEmpleado = int.Parse(rdr["IdEmpleado"].ToString());
                        Emp.Nombre = rdr["Nombre"].ToString();
                        Emp.Apellido = rdr["Apellido"].ToString();
                        Emp.Cuil = rdr["Cuil"].ToString();
                        Emp.Agrupacion = rdr["Agrupacion"].ToString();
                        Emp.Categoria = rdr["Categoria"].ToString();
                        Emp.Jornada = rdr["Jornada"].ToString();
                        Emp.FechaAlta = rdr["FechaAlta"].ToString(); 
                        Emp.FechaBaja = rdr["FechaBaja"].ToString(); 
                        ListaEmpleado.Add(Emp);

                    }
                    conn.Close();
                }

                rdr.Dispose();
                rdr.Close();

                return ListaEmpleado;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        public List<Empleado> getAllEmpleados()
        {

            try
            {
                List<Empleado> ListaEmpleado = new List<Empleado>();
                SqlDataReader rdr = null;

                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spGetAllEmpleados", conn);

                    cmd.CommandType = CommandType.StoredProcedure;
                   

                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Empleado Emp = new Empleado();
                        Emp.IdEmpleado = int.Parse(rdr["IdEmpleado"].ToString());
                        Emp.Nombre = rdr["Nombre"].ToString();
                        Emp.Apellido = rdr["Apellido"].ToString();
                        Emp.Cuil = rdr["Cuil"].ToString();
                        Emp.Agrupacion = rdr["Agrupacion"].ToString();
                        Emp.Categoria = rdr["Categoria"].ToString();
                        Emp.Jornada = rdr["Jornada"].ToString();
                        Emp.FechaAlta = rdr["FechaAlta"].ToString(); 
                        Emp.FechaBaja = rdr["FechaBaja"].ToString(); 
                        ListaEmpleado.Add(Emp);

                    }
                    conn.Close();
                }

                rdr.Dispose();
                rdr.Close();

                return ListaEmpleado;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int insertEmpleado(int IdEmpleador, string Nombre, string Apellido, string Cuil, string Agrupacion, string Categoria, string TipoContrato, string Jornada, DateTime FechaAlta)
        {
            try
            {
                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spInsertEmpleados", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("pIdEmpleador", SqlDbType.Int)).Value = (IdEmpleador == 0) ? (object)DBNull.Value : IdEmpleador;
                    cmd.Parameters.Add(new SqlParameter("pNombre", SqlDbType.VarChar)).Value = (Nombre == "") ? (object)DBNull.Value : Nombre;
                    cmd.Parameters.Add(new SqlParameter("pApellido", SqlDbType.VarChar)).Value = (Apellido == "") ? (object)DBNull.Value : Apellido;
                    cmd.Parameters.Add(new SqlParameter("pCuil", SqlDbType.VarChar)).Value = (Cuil == "") ? (object)DBNull.Value : Cuil;
                    cmd.Parameters.Add(new SqlParameter("pAgrupacion", SqlDbType.VarChar)).Value = (Agrupacion == "") ? (object)DBNull.Value : Agrupacion;
                    cmd.Parameters.Add(new SqlParameter("pCategoria", SqlDbType.VarChar)).Value = (Categoria == "") ? (object)DBNull.Value : Categoria;
                    cmd.Parameters.Add(new SqlParameter("pTipoContrato", SqlDbType.VarChar)).Value = (TipoContrato == "") ? (object)DBNull.Value : TipoContrato;
                    cmd.Parameters.Add(new SqlParameter("pJornada", SqlDbType.VarChar)).Value = (Jornada == "") ? (object)DBNull.Value : Jornada;
                    cmd.Parameters.Add(new SqlParameter("pFechaAlta", SqlDbType.DateTime)).Value = (FechaAlta == null) ? (object)DBNull.Value : FechaAlta;

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

        public int editEmpleado(int IdEmpleado, string Nombre, string Apellido, string Cuil, string Agrupacion, string Categoria, string TipoContrato, string Jornada, DateTime FechaAlta, DateTime? FechaBaja)
        {
            try
            {
                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spUpdateEmpleado", conn);

                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.Add(new SqlParameter("pIdEmpleado", SqlDbType.Int)).Value = (IdEmpleado == 0) ? (object)DBNull.Value : IdEmpleado;
                    cmd.Parameters.Add(new SqlParameter("pNombre", SqlDbType.VarChar)).Value = (Nombre == "") ? (object)DBNull.Value : Nombre;
                    cmd.Parameters.Add(new SqlParameter("pApellido", SqlDbType.VarChar)).Value = (Apellido == "") ? (object)DBNull.Value : Apellido;
                    cmd.Parameters.Add(new SqlParameter("pCuil", SqlDbType.VarChar)).Value = (Cuil == "") ? (object)DBNull.Value : Cuil;
                    cmd.Parameters.Add(new SqlParameter("pAgrupacion", SqlDbType.VarChar)).Value = (Agrupacion == "") ? (object)DBNull.Value : Agrupacion;
                    cmd.Parameters.Add(new SqlParameter("pCategoria", SqlDbType.VarChar)).Value = (Categoria == "") ? (object)DBNull.Value : Categoria;
                    cmd.Parameters.Add(new SqlParameter("pTipoContrato", SqlDbType.VarChar)).Value = (TipoContrato == "") ? (object)DBNull.Value : TipoContrato;
                    cmd.Parameters.Add(new SqlParameter("pJornada", SqlDbType.VarChar)).Value = (Jornada == "") ? (object)DBNull.Value : Jornada;
                    cmd.Parameters.Add(new SqlParameter("pFechaAlta", SqlDbType.DateTime)).Value = (FechaAlta == null) ? (object)DBNull.Value : FechaAlta;
                    cmd.Parameters.Add(new SqlParameter("pFechaBaja", SqlDbType.DateTime)).Value = (FechaBaja == null) ? (object)DBNull.Value : FechaBaja;
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

    }
}
