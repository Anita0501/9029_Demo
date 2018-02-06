using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for DBHelper
/// </summary>
public class DBHelper
{
    public static string cnStr = WebConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;

    public static void RunTSQL(string tsql, Dictionary<string, object> parameters)
    {
        using (SqlConnection cn = new SqlConnection(cnStr))
        {
            SqlCommand cmd = new SqlCommand(tsql, cn);

            foreach (KeyValuePair<string, object> item in parameters)
            {
                cmd.Parameters.AddWithValue(item.Key, item.Value);
            }
            cn.Open();
            cmd.ExecuteNonQuery();
        }

    }



    public static DataTable GetDataTable(string tsql, Dictionary<string, object> parameters)
    {
        SqlDataAdapter da = new SqlDataAdapter(tsql, cnStr);

        if (parameters != null)
        {
            foreach (KeyValuePair<string, object> item in parameters)
            {
                da.SelectCommand.Parameters.AddWithValue(item.Key, item.Value);
            }
        }

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }
}