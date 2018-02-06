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
    string pageID = "";
    string StrAmount = "";//畫面進入會讀取一次數量,並取代""
    int IntAmount = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];//網址帶過來的值
        if (Page.IsPostBack == false)
        {
            using (var cn = new SqlConnection(dblink))
            {
                SqlCommand com = new SqlCommand(
                    "Delete from Equipment where EquipmentID=@id", cn);//引用SqlCommand物件
                com.Parameters.AddWithValue("id", id);//參數名稱 需用""包圍, 值
                cn.Open();
                com.ExecuteNonQuery();
                Response.Redirect("~/03_Ed/03_edit.aspx");
            }
        }
    }
}