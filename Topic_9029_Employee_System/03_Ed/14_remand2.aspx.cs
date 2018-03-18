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
        Employee employee = Employee.LoginUser();//引用一點的方法
        string InId = employee.EmployeeID;//員工編號
        string InName = employee.EmployeeName;//員工名稱

        using (var cn = new SqlConnection(dblink))//取得現有數量
        {
            SqlDataAdapter com = new SqlDataAdapter("select EquipmentAmount from Equipment where EquipmentID=@id ", cn);
            com.SelectCommand.Parameters.AddWithValue("id", id); //Dataadapter 需要從 selectcommand 開始

            cn.Open();
            DataTable dt = new DataTable();
            com.Fill(dt);
            int IntAmount = Convert.ToInt32(dt.Rows[0]["EquipmentAmount"]);//取得剩餘數量
            StrAmount = Convert.ToString(IntAmount);
        }

        using (var cn = new SqlConnection(dblink))//取回借取數量[Note]
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

            SqlCommand com = new SqlCommand
            //("Update Equipment set EquipmentAmount=@EquipmentAmount , Audit=@Audit where EquipmentID=@id ", cn);

            ("Update Equipment " +
            "set EquipmentAmount=@EquipmentAmount, Audit=@Audit " +
            "from Equipment e " +
            "left join Borrow b " +
            "on e.EquipmentID = b.EquipmentID " +
            "where e.EquipmentID=@id and Audit = 1 and UserName = '" + InName + "'", cn);//UserName = '王秋霞' 指定使用者

            com.Parameters.AddWithValue("id", id);
            com.Parameters.AddWithValue("EquipmentAmount", addAmount);

            if (Convert.ToInt32(StrAmount) == 0)
            {
                com.Parameters.AddWithValue("Audit", 0);//被租借中剩餘數量 : ??  需再組字串
            }
            else
                com.Parameters.AddWithValue("Audit", 1);//被租借中剩餘數量 : ??  需再組字串


            cn.Open();
            com.ExecuteNonQuery();
        }

        using (var cn = new SqlConnection(dblink))//還東西Borrow 刪除借閱紀錄
        {
            SqlCommand com = new SqlCommand("delete from Borrow where EquipmentId=@id and UserName = '" + InName + "'", cn);
            com.Parameters.AddWithValue("id", id);

            cn.Open();
            com.ExecuteNonQuery();
        }

        Response.Redirect("~/03_Ed/13_remand.aspx");
    }
}