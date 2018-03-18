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
public partial class personnelformwaitupdat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //    string connString = ConfigurationManager.ConnectionStrings["testConnectionString1"].ConnectionString;
        //    using (SqlConnection cn = new SqlConnection(connString))
        //    {
        //        DataTable ds = new DataTable();
        //        SqlDataAdapter da = new SqlDataAdapter("Select id,idpersonnel,type,timestart,timeend,description,daytime from personnelfurloughwait Where idpersonnel Like '%'+@idpersonnel + '%'", cn); //Customers 裡面的 CustomerID, CompanyName資料

        //        //放入ds 名為Customers表格中
        //        da.SelectCommand.Parameters.AddWithValue("Id", int.Parse(Request.QueryString["id"]));

        //        TextBox1.Text = ds.Rows[0]["Id"].ToString();
        //        TextBox2.Text = ds.Rows[0]["idpersonnel"].ToString();
        //        TextBox3.Text = ds.Rows[0]["type"].ToString();
        //        TextBox4.Text = ds.Rows[0]["timestart"].ToString();
        //        TextBox5.Text = ds.Rows[0]["timeend"].ToString();
        //        label1.Text = ds.Rows[0]["description"].ToString();
        //        label1.Text = ds.Rows[0]["daytime"].ToString();

        //    }

        //}
        //if (!Page.IsPostBack)
        //{
        //    string connString = ConfigurationManager.ConnectionStrings["testConnectionString1"].ConnectionString;
        //    using (SqlConnection cn = new SqlConnection(connString))
        //    {
        //        DataTable ds = new DataTable();
        //        SqlDataAdapter da = new SqlDataAdapter("Select id,idpersonnel,type,timestart,timeend,description,daytime from personnelfurloughwait", cn); //Customers 裡面的 CustomerID, CompanyName資料
        //                                                                                                                                                //放入ds 名為Customers表格中      
        //        da.Fill(ds);

        //    }
        //}
       
            string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(connString))
            {
                DataTable ds = new DataTable();
                string str = "Select * from personnelfurloughwait Where Id Like '%" + Request.QueryString["id"] + "%'";
                SqlDataAdapter da = new SqlDataAdapter(str, cn); //Customers 裡面的 CustomerID, CompanyName資料

                //放入ds 名為Customers表格中
                //da.SelectCommand.Parameters.AddWithValue("@Id", int.Parse(Request.QueryString["id"]));
                da.Fill(ds);
                TextBox1.Text = ds.Rows[0]["Id"].ToString();
                TextBox2.Text = ds.Rows[0]["idpersonnel"].ToString();
            }

        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/05_Tid/personnelformsee.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;

        using (var conn = new SqlConnection(connString))
        {
                SqlCommand com = new SqlCommand("Update personnelfurloughwait set idpersonnel=@idpersonnel,[type]=@type,timestart=@timestart,timeend=@timeend,[description]=@description,daytime=@daytime where Id=@Id ", conn);
                DateTime sDate = Convert.ToDateTime(TextBox3.Text);
                DateTime eDate = Convert.ToDateTime(TextBox4.Text);
                TimeSpan ts = eDate - sDate;
                double days = ts.TotalDays;
                string a = Convert.ToInt32(days).ToString();
                
                com.Parameters.AddWithValue("@Id", int.Parse(TextBox1.Text));
                com.Parameters.AddWithValue("@idpersonnel", TextBox2.Text);
                com.Parameters.AddWithValue("@type", DropDownList1.Text);
                com.Parameters.AddWithValue("@timestart", TextBox3.Text);
                com.Parameters.AddWithValue("@timeend", TextBox4.Text);
                com.Parameters.AddWithValue("@description", TextArea1.Value);
                com.Parameters.AddWithValue("@daytime", DateTime.Now.ToString("yyyy/MM/dd",CultureInfo.InvariantCulture));
                com.Parameters.AddWithValue("daystred", a);
                conn.Open();
                com.ExecuteNonQuery();
               
            //}
            //catch (Exception ex)
            //{
            //    Label1.Text = "Failed";
            //}
        }
        Response.Redirect("~/05_Tid/personnelformsee.aspx");
    }
}