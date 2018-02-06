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
public class EWC_DBHelper
{

    public static void RunTSQL(string tsql, Dictionary<string, object> parameters)
    {
        string cnStr = WebConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;

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

    //public static void RunTSQL2(string tsql, string[] columns , Dictionary<string, object>[] parametersAry)
    //{
    //    string cnStr = WebConfigurationManager.ConnectionStrings["NorthwindConnectionString1"].ConnectionString;

    //    using (SqlConnection cn = new SqlConnection(cnStr))
    //    {
    //        SqlCommand cmd = new SqlCommand(tsql, cn);

    //        foreach (string columnName in columns)
    //        {
    //            cmd.Parameters.Add(new SqlParameter(columnName , null));
    //        }

    //        cn.Open();
    //        foreach (Dictionary<string, object> dict in parametersAry)
    //        {
    //            foreach (KeyValuePair<string, object> item in dict)
    //            {
    //                cmd.Parameters[item.Key].Value = item.Value;
    //            }
    //            cmd.ExecuteNonQuery();
    //        }

    //    }
    //}

    public static DataTable GetDataTable(string tsql, Dictionary<string, object> parameters)
    {
        string cnStr = WebConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;

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