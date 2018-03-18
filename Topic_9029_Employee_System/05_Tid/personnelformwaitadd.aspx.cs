using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
using System.Configuration;

public partial class personnelformwaitadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Employee employee = Employee.LoginUser();
        TextBox2.Text = employee.EmployeeID;
        //com.Parameters.AddWithValue("Id", int.Parse(Request.QueryString["id"]));
        string aname = employee.EmployeeName;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Employee employee = Employee.LoginUser();
        TextBox2.Text = employee.EmployeeID;
        string aname = employee.EmployeeName;
        string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;

        using (var conn = new SqlConnection(connString))
        {
                
                SqlCommand com = new SqlCommand("insert into personnelfurloughwait values(@idpersonnel,@type,@timestart,@timeend,@description,@daytime,@statusfromowaitok,@statusfromowaitresatnooryes,@statusfromowaitresatbute,@daystred,@name)", conn);
                 DateTime sDate = Convert.ToDateTime(TextBox3.Text);
                DateTime eDate = Convert.ToDateTime(TextBox4.Text);
                TimeSpan ts = eDate - sDate;
                double days = ts.TotalDays;
                string a = Convert.ToInt32(days).ToString();
                com.Parameters.AddWithValue("idpersonnel", TextBox2.Text);
                com.Parameters.AddWithValue("type", DropDownList1.Text);
                com.Parameters.AddWithValue("timestart", TextBox3.Text);
                com.Parameters.AddWithValue("timeend", TextBox4.Text);
                com.Parameters.AddWithValue("description", TextArea1.Value);
                com.Parameters.AddWithValue("daytime", DateTime.Now.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture));
                com.Parameters.AddWithValue("statusfromowaitok", 0);
                com.Parameters.AddWithValue("statusfromowaitresatnooryes","未審核");
                com.Parameters.AddWithValue("statusfromowaitresatbute", "無");
                com.Parameters.AddWithValue("daystred", a);
                com.Parameters.AddWithValue("name", aname);
                //DateTime dt1 = new DateTime.ToString(2008, 12, 31);
                //DateTime dt2 = new DateTime.ToString("TextBox4.Text");
                //TimeSpan ts = dt2 - dt1;
            
            conn.Open();
                com.ExecuteNonQuery();
               
            
        
        }
        Response.Redirect("~/05_Tid/personnelformsee.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/05_Tid/personnelformsee.aspx");
    }
}