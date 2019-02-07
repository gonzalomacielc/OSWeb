using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OSWeb.Models;
using System.Data.SqlClient;
using System.Data;

namespace OSWeb.Managers
{
    public class SolicitudMngr
    {
        public int insertSolicitud(int idEmpleador, string tipoSolicitud)
        {
            int pIdSolicitud = 0;

            try
            {
                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spInsertSolicitud", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("pIdEmpleador", SqlDbType.Int)).Value = (idEmpleador == 0) ? (object)DBNull.Value : idEmpleador;
                    cmd.Parameters.Add(new SqlParameter("pTipoSolicitud", SqlDbType.VarChar)).Value = (tipoSolicitud == "") ? (object)DBNull.Value : tipoSolicitud;
                    cmd.Parameters.Add(new SqlParameter("pFechaSolicitud", SqlDbType.DateTime)).Value = DateTime.Now;
                    cmd.Parameters.Add(new SqlParameter("pIdSolicitud", SqlDbType.Int)).Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    pIdSolicitud = Convert.ToInt32(cmd.Parameters["pIdSolicitud"].Value);
                    conn.Close();
                }

                return pIdSolicitud;

            }
            catch (Exception)
            {
                return -1;
            }
        }

        public List<Solicitud> getLastSolicitudes()
        {
            try
            {
                List<Solicitud> SolicitudesList = new List<Solicitud>();

                SqlDataReader rdr = null;

                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spGetLastSolicitudes", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Solicitud Sol = new Solicitud();
                        Sol.IdSolicitud = int.Parse(rdr["IdSolicitud"].ToString());
                        Sol.Empleador = rdr["Empleador"].ToString();
                        Sol.FechaSolicitud = rdr["FechaSolicitud"].ToString();
                        Sol.Estado = rdr["Estado"].ToString();
                        Sol.Tipo = rdr["Tipo"].ToString();
                        Sol.Responsable = rdr["Responsable"].ToString();
                        Sol.Sector = rdr["Sector"].ToString();

                        SolicitudesList.Add(Sol);
                    }
                    conn.Close();
                }

                rdr.Dispose();
                rdr.Close();

                return SolicitudesList;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Solicitud> getSolicitudesByIdEmpleador(int idEmpleador)
        {
            try
            {
                List<Solicitud> SolicitudesList = new List<Solicitud>();

                SqlDataReader rdr = null;

                string m_ConnectionString = null;

                m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                using (var conn = new SqlConnection(m_ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("spGetSolicitudesByIdEmpleador", conn);
                   
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("pIdEmpleador", SqlDbType.Int)).Value = (idEmpleador == 0) ? (object)DBNull.Value : idEmpleador;

                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Solicitud Sol = new Solicitud();
                        Sol.IdSolicitud = int.Parse(rdr["IdSolicitud"].ToString());
                        Sol.Empleador = rdr["Empleador"].ToString();
                        Sol.FechaSolicitud = rdr["FechaSolicitud"].ToString();
                        Sol.Estado = rdr["Estado"].ToString();
                        Sol.Tipo = rdr["Tipo"].ToString();
                        Sol.Responsable = rdr["Responsable"].ToString();
                        Sol.Sector = rdr["Sector"].ToString();

                        SolicitudesList.Add(Sol);
                    }
                    conn.Close();
                }

                rdr.Dispose();
                rdr.Close();

                return SolicitudesList;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}