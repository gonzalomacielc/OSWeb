using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OSWeb.Models;
using System.Data.SqlClient;
using System.Data;

namespace OSWeb.Managers
{
    public class UsuarioMngr
    {
        public Usuario getUsuario(string Email, string Password)
        {
            try
            {

                SqlDataReader rdr = null;

                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                Usuario Usu = new Usuario();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spGetUsuario", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("pEmail", SqlDbType.VarChar)).Value = (Email == "") ? (object)DBNull.Value : Email;
                    cmd.Parameters.Add(new SqlParameter("pContraseña", SqlDbType.VarChar)).Value = (Password == "") ? (object)DBNull.Value : Password;

                    rdr = cmd.ExecuteReader();

                    while (rdr.Read())
                    {

                        Usu.IdUsuario = int.Parse(rdr["IdUsuario"].ToString());
                        Usu.Email = rdr["Email"].ToString();
                        Usu.Contraseña = rdr["Contraseña"].ToString();
                        Usu.IdPerfil = int.Parse(rdr["IdPerfil"].ToString());
                        Usu.IdEmpleador = int.Parse(rdr["IdEmpleador"].ToString());
                    }
                    conn.Close();
                }

                rdr.Dispose();
                rdr.Close();

                return Usu;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int insertUsuario(string Email, string Contraseña, int IdEmpleador)
        {
            try
            {

                int IdUsuario;
                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spInsertUsuario", conn);

                    cmd.CommandType = CommandType.StoredProcedure;   
                    cmd.Parameters.Add(new SqlParameter("pEmail", SqlDbType.VarChar)).Value = (Email == null) ? (object)DBNull.Value : Email;
                    cmd.Parameters.Add(new SqlParameter("pContraseña", SqlDbType.VarChar)).Value = (Contraseña == null) ? (object)DBNull.Value : Contraseña;
                    cmd.Parameters.Add(new SqlParameter("pIdEmpleador", SqlDbType.Int)).Value = (IdEmpleador == 0) ? (object)DBNull.Value : IdEmpleador;
                    cmd.Parameters.Add(new SqlParameter("pIdUsuario", SqlDbType.Int)).Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    IdUsuario = Convert.ToInt32(cmd.Parameters["pIdUsuario"].Value);
                    conn.Close();
                }

               

                return IdUsuario;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }
    }
}

