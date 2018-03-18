using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Demo : System.Web.UI.Page
{
    string dblink = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        using (var conn = new SqlConnection(dblink))
        {
            SqlDataAdapter da = new SqlDataAdapter("select * , case SortID " +
                "when '1' then N'3C產品' " +
                "when '2' then N'周邊器材' " +
                "when '3' then N'五金工具' " +
                "when '4' then N'活動設備' end as StrSortID " +
                "from Equipment ", conn);

            //da.SelectCommand.Parameters.AddWithValue("checkValue", 1);//@checkValue 需要再加上這行給值
            conn.Open();
            DataTable dt = new DataTable();
            da.Fill(dt);
            ListView1.DataSource = dt;//網頁&disgin 只要設定一邊 
            ListView1.DataBind();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string checkValue = seleClass.Value;

        using (var conn = new SqlConnection(dblink))
        {
            SqlDataAdapter da = new SqlDataAdapter("select * , case SortID " +
                "when '1' then N'3C產品' " +
                "when '2' then N'周邊器材' " +
                "when '3' then N'五金工具' " +
                "when '4' then N'活動設備' end as StrSortID " +
                "from Equipment " +
                "where SortID =@checkValue", conn);
                //"select EquipmentID,SortID,EquipmentName,EquipmentAmount, Audit from Equipment where SortID =@checkValue", conn);

            da.SelectCommand.Parameters.AddWithValue("checkValue", checkValue);//@checkValue 需要再加上這行給值
            conn.Open();
            DataTable dt = new DataTable();
            da.Fill(dt);
            ListView1.DataSource = dt;//網頁&disgin 只要設定一邊 
            ListView1.DataBind();
        }
    }
}