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
    string StrAmount = "";//畫面進入會讀取一次數量,並取代""
    int IntAmount = 0 ;
    string pageID = "";
    
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];

        int BorrowAmount = IntAmount - Convert.ToInt32(Text2.Value);//剩餘數量-借取數量

        
        using (var cn = new SqlConnection(dblink))//新增要借取之資訊
        {
            //id 要 上一頁帶過來
            //
            SqlCommand InCom =
                new SqlCommand("Insert into Borrow values(@UserName,@Unit,@BorrowStartDate,@BorrowEndDate,@BorrowNumber,@EquipmentID)", cn);
            InCom.Parameters.AddWithValue("id", id);//索引欄位 必須填值
            InCom.Parameters.AddWithValue("UserName", idUserName.Value);
            InCom.Parameters.AddWithValue("Unit", idUnit.Value);
            InCom.Parameters.AddWithValue("BorrowStartDate", idBorrowStartDate.Value);
            InCom.Parameters.AddWithValue("BorrowEndDate", idBorrowEndDate.Value);
            InCom.Parameters.AddWithValue("BorrowNumber", Text2.Value);//暫時紀錄 借取數量
            InCom.Parameters.AddWithValue("EquipmentID", id);//重複資料欄位 
            InCom.Parameters.AddWithValue("EquipmentAmount", Text2.Value);//重複資料欄位 
            cn.Open();
            InCom.ExecuteNonQuery();
        }
        using (var cn = new SqlConnection(dblink))//借取後[Audit]為 "1"
        {
            SqlCommand UpCom = new SqlCommand("Update Equipment set EquipmentAmount=@EquipmentAmount, Audit=@Audit where EquipmentID=@EquipmentID", cn);
            UpCom.Parameters.AddWithValue("Audit", 1);
            UpCom.Parameters.AddWithValue("EquipmentID", id);
            UpCom.Parameters.AddWithValue("EquipmentAmount", BorrowAmount);// BorrowAmount:剩餘數量-借取數量
            cn.Open();
            UpCom.ExecuteNonQuery();
        }

        Response.Redirect("~/03_Ed/11_InsertBorrow.aspx");

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Employee employee = Employee.LoginUser();//引用一點的方法
        string InId = employee.EmployeeID;//員工編號
        string InName = employee.EmployeeName;//員工名稱
        string id = Request.QueryString["id"];//網址帶過來的值
        using (var cn = new SqlConnection(dblink))
        {
            //id 要 上一頁帶過來
            //
            SqlCommand com =
                new SqlCommand("select EquipmentName from Equipment where EquipmentID=@id", cn);
            com.Parameters.AddWithValue("id", id);
            cn.Open();

            pageID = com.ExecuteScalar().ToString();
            Text1.Value = pageID;
        }
        using (var cn = new SqlConnection(dblink))
        {
            SqlDataAdapter com = new SqlDataAdapter("select EquipmentAmount from Equipment where EquipmentID=@id ", cn);
            com.SelectCommand.Parameters.AddWithValue("id", id); //Dataadapter 需要從 selectcommand 開始

            cn.Open();
            DataTable dt = new DataTable();
            com.Fill(dt);
            StrAmount = dt.Rows[0]["EquipmentAmount"].ToString();//取回數量
            IntAmount = Convert.ToInt32(StrAmount);
        }
        idUserName.Value = InName ;
    }
}