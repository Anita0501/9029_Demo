using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class personnelformsee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //string connString = ConfigurationManager.ConnectionStrings["testConnectionString1"].ConnectionString;
        //using (SqlConnection cn = new SqlConnection(connString))
        //{
        //    DataTable ds = new DataTable();
        //    SqlDataAdapter da = new SqlDataAdapter("Select id,idpersonnel,type,timestart,timeend,description,daytime from personnelfurloughwait Where idpersonnel Like '%'+@idpersonnel + '%'", cn); //Customers 裡面的 CustomerID, CompanyName資料
        //                                                                                                                                                                                             //放入ds 名為Customers表格中
        //    da.SelectCommand.Parameters.AddWithValue("@idpersonnel", "1");
        //    da.Fill(ds);
        //    ListView1.DataSource = ds;
        //    ListView1.DataBind();
        //    label1.Text = ds.Rows[0][0].ToString();
        //    label1.Text = ds.Rows[0]["id"].ToString();
        //}

        //////
        Employee employee = Employee.LoginUser();
        string ab = employee.EmployeeID;
        string aname = employee.EmployeeName;
        Label1.Text = "使用者:" + aname + " 編號:" + ab + " 已進入表單申請系統";
        if (!Page.IsPostBack)
        {
           
            string aa = employee.EmployeeID;

            //SqlDataAdapter da = new SqlDataAdapter("Select id,idpersonnel,type,timestart,timeend,description,daytime from personnelfurloughwait where statusfromowait0roko1rno2 = 0 and idpersonnel= ", cn);
            //string a = tid;
     
                       string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(connString))
            {
                DataTable ds = new DataTable();                                                                      
                SqlDataAdapter da = new SqlDataAdapter("Select id,idpersonnel,type,timestart,timeend,description,daytime from personnelfurloughwait Where idpersonnel Like '%' + '"+ aa +"'  + '%'  and statusfromowaitok = 0", cn); //Customers 裡面的 CustomerID, CompanyName資料
                ////注意 這要用session判斷                                                                                                                                                                                             //放入ds 名為Customers表格中   idpersonnel=     
                da.Fill(ds);
                ListView1.DataSource = ds;
                ListView1.DataBind();
            }
        }
      
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    string connString = ConfigurationManager.ConnectionStrings["testConnectionString1"].ConnectionString;
    //    using (SqlConnection cn = new SqlConnection(connString))
    //    {
    //        DataTable ds = new DataTable();
    //        SqlDataAdapter da = new SqlDataAdapter("Select id,idpersonnel,type,timestart,timeend,description,daytime from personnelfurloughwait Where idpersonnel Like '%'+@idpersonnel + '%'", cn); //Customers 裡面的 CustomerID, CompanyName資料
    //                                                                                                                                                                                                      //放入ds 名為Customers表格中
    //        da.SelectCommand.Parameters.AddWithValue("@idpersonnel", TextBox1.Text);
    //        da.Fill(ds);
    //        ListView1.DataSource = ds;
    //        ListView1.DataBind();
    //        //label1.Text = ds.Rows[0][0].ToString();
    //        //label1.Text = ds.Rows[0]["id"].ToString();
    //    }
    //}


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/05_Tid/personnelformwaitadd.aspx");
    }
}