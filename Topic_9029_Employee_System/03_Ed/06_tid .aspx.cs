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
    protected void Button1_Click1(object sender, EventArgs e)
    {
        //string id = Request.QueryString["id"];
        using (var cn = new SqlConnection(dblink))
        {
            List<string> dataList = new List<string>();


            //SqlDataAdapter com = new SqlDataAdapter("select e.EquipmentAmount ,b.BorrowNumber,e.EquipmentID " +
            //    "from Equipment e " +
            //    "inner join Borrow b " +
            //    "on e.EquipmentID = b.EquipmentID " +
            //    "where e.Audit = 1 and e.SortID = 1 " +
            //    "cont", cn);//取的類別 "1" [3C產品]
            ////com.SelectCommand.Parameters.AddWithValue("id", id); //Dataadapter 需要從 selectcommand 開始

            SqlDataAdapter com = new SqlDataAdapter("select count(SortID) as count from equipment where SortID = 1 and Audit = 1",cn);
            
            cn.Open();
            DataTable dt = new DataTable();
            com.Fill(dt);
            string IntAmount = dt.Rows[0]["count"].ToString();//取得剩餘數量
            dataList.Add(IntAmount);
            Label1.Text = dataList[0];
        }
    }
}