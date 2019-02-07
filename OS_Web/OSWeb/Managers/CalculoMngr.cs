using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OSWeb.Models;
using System.Data.SqlClient;
using System.Data;

namespace OSWeb.Managers
{
    public class CalculoMngr
    {
        public Decimal getRemunBasica(string agrupacion, string categoria, Decimal remun)
        {

            try
            {
                Decimal remunBase = Decimal.Parse(System.Configuration.ConfigurationManager.AppSettings["SueldoMinimo"].ToString());

                if (remun >= remunBase)
                {

                    Decimal cat1 = 0;
                    Decimal cat2 = 0;
                    Decimal cat3 = 0;
                    Decimal cat4 = 0;
                    Decimal cat5 = 0;
                    SqlDataReader rdr = null;

                    string m_ConnectionString = null;

                    m_ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionStringTest"].ToString();

                    using (var conn = new SqlConnection(m_ConnectionString))
                    {
                        conn.Open();

                        SqlCommand cmd = new SqlCommand("spGetRemunbase", conn);

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("pAgrupacion", SqlDbType.VarChar)).Value = (agrupacion == "") ? (object)DBNull.Value : agrupacion;

                        rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {

                            cat1 = Decimal.Parse(rdr["Categoria1"].ToString());
                            cat2 = Decimal.Parse(rdr["Categoria2"].ToString());
                            cat3 = Decimal.Parse(rdr["Categoria3"].ToString());
                            cat4 = Decimal.Parse(rdr["Categoria4"].ToString());
                            cat5 = Decimal.Parse(rdr["Categoria5"].ToString());

                        }
                        conn.Close();
                    }

                    rdr.Dispose();
                    rdr.Close();

                    switch (categoria)
                    {
                        case "Primera":
                            remunBase = cat1;
                            break;
                        case "Segunda":
                            remunBase = cat2;
                            break;
                        case "Tercera":
                            remunBase = cat3;
                            break;
                        case "Cuarta":
                            remunBase = cat4;
                            break;
                        case "Quinta":
                            remunBase = cat5;
                            break;

                        default:
                            break;
                    }
                }
                return remunBase;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}