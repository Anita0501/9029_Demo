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

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];//網址帶過來的值
        using (var cn = new SqlConnection(dblink))
        {
            //https://www.fooish.com/sql/insert-into.html
            SqlCommand com =
                new SqlCommand("Update Equipment " +
                "set EquipmentName=@EquipmentName,EquipmentAmount=@EquipmentAmount,SortID=@SortID,PurchaseDate=@PurchaseDate,Audit=@Audit,UseLife=@UseLife " +
                "where EquipmentID = @id", cn);
            com.Parameters.AddWithValue("id", id);
            com.Parameters.AddWithValue("EquipmentName", inputHorizontalWarning1.Value);
            com.Parameters.AddWithValue("EquipmentAmount", inputHorizontalWarning2.Value);
            com.Parameters.AddWithValue("SortID", idSortID.Value);
            com.Parameters.AddWithValue("PurchaseDate", PurchaseDate.Value);
            com.Parameters.AddWithValue("Audit", 0);//預設值 0 欄位可否不給值?
            com.Parameters.AddWithValue("UseLife", UseLife.Value);
            cn.Open();
            com.ExecuteNonQuery();
            Response.Redirect("~/03_Ed/03_edit.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];//網址帶過來的值
        if (Page.IsPostBack == false)
        {


            using (var cn = new SqlConnection(dblink))
            {
                SqlDataAdapter com = new SqlDataAdapter("select EquipmentName, EquipmentAmount, PurchaseDate, UseLife from Equipment where EquipmentID=@id ", cn);
                com.SelectCommand.Parameters.AddWithValue("id", id); //Dataadapter 需要從 selectcommand 開始

                cn.Open();
                DataTable dt = new DataTable();
                com.Fill(dt);

                StrAmount = dt.Rows[0]["EquipmentAmount"].ToString();//取回數量
                IntAmount = Convert.ToInt32(StrAmount);

                inputHorizontalWarning1.Value = dt.Rows[0]["EquipmentName"].ToString();
                inputHorizontalWarning2.Value = StrAmount;
                PurchaseDate.Value = dt.Rows[0]["PurchaseDate"].ToString();
                UseLife.Value = dt.Rows[0]["UseLife"].ToString();
            }
        }
    }
}