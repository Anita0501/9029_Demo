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
        Employee employee = Employee.LoginUser();//引用一點的方法
        string InId = employee.EmployeeID;//員工編號
        string InName = employee.EmployeeName;//員工名稱
        using (var conn = new SqlConnection(dblink))
        {
            //SqlDataAdapter da = new SqlDataAdapter("select UserName,Unit,BorrowStartDate,BorrowEndDate  from Borrow  where Audit = 1", conn);

            SqlDataAdapter da = 
                new SqlDataAdapter("select e.* , b.* " +
                "from Borrow e left join Equipment b " +
                "on e.EquipmentID = b.EquipmentID " +
                "where Audit = 1 and UserName = '" + InName + "' ", conn);

            conn.Open();

            DataTable dt = new DataTable();
            da.Fill(dt);

            ListView1.DataSource = dt;//網頁&disgin 只要設定一邊 
            ListView1.DataBind();
        }
    }
}