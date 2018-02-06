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

    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];//網址帶過來的值
        string StrAmount = ""; //取回之現有數量
        string returnAmount = ""; //取回之歸還數量

        using (var cn = new SqlConnection(dblink))//取得現有數量
        {
            SqlDataAdapter com = new SqlDataAdapter("select EquipmentAmount from Equipment where EquipmentID=@id ", cn);
            com.SelectCommand.Parameters.AddWithValue("id", id); //Dataadapter 需要從 selectcommand 開始

            cn.Open();
            DataTable dt = new DataTable();
            com.Fill(dt);
            int IntAmount = Convert.ToInt32(dt.Rows[0]["EquipmentAmount"]);//取得剩餘數量
            StrAmount = Convert.ToString(IntAmount);

            //如果數量[EquipmentAmount] 小於原有數
            //    借取狀態[Audit] 1 (被借)

            //    數量等於0
            //    不顯示借閱

        }
        using (var cn =new SqlConnection(dblink))//取回借取數量[Note]
        {
            SqlDataAdapter com = new SqlDataAdapter("select BorrowNumber from Borrow where EquipmentID=@id", cn);
            com.SelectCommand.Parameters.AddWithValue("id", id);
            cn.Open();
            DataTable dt = new DataTable();
            com.Fill(dt);
            returnAmount = dt.Rows[0]["BorrowNumber"].ToString();

        }
        using (var cn = new SqlConnection(dblink))//還東西 修正剩餘數量 與 借用狀態
        {
            int addAmount = Convert.ToInt32(StrAmount) + Convert.ToInt32(returnAmount); //歸還後總數 : 現有數 + 歸還數

            SqlCommand com = new SqlCommand("Update Equipment set EquipmentAmount=@EquipmentAmount , Audit=@Audit where EquipmentID=@id", cn);
            com.Parameters.AddWithValue("id", id);
            com.Parameters.AddWithValue("EquipmentAmount", addAmount);
            com.Parameters.AddWithValue("Audit", 0);//被租借中剩餘數量 : ??  需再組字串

            cn.Open();
            com.ExecuteNonQuery();
        }
        using (var cn =new SqlConnection(dblink))//還東西Borrow 刪除借閱紀錄
        {
            SqlCommand com = new SqlCommand("delete from Borrow where EquipmentId=@id",cn);
            com.Parameters.AddWithValue("id", id);

            cn.Open();
            com.ExecuteNonQuery();
        }

        Response.Redirect("~/03_Ed/13_remand.aspx");
    }
}