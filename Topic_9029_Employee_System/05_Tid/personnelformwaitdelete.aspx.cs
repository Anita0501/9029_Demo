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
public partial class personnelformwaitdelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
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
                TextBox3.Text = ds.Rows[0]["type"].ToString();
                TextBox4.Text = ds.Rows[0]["timestart"].ToString();
                TextBox5.Text = ds.Rows[0]["timeend"].ToString();
                TextArea1.Value = ds.Rows[0]["description"].ToString();
                TextBox6.Text = ds.Rows[0]["daytime"].ToString();

            }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;

        using (var conn = new SqlConnection(connString))
        {
         
            {
                SqlCommand com = new SqlCommand("Delete from personnelfurloughwait where Id=@Id", conn);
                com.Parameters.AddWithValue("Id", int.Parse(TextBox1.Text));
                conn.Open();
                com.ExecuteNonQuery();        
            }
          
        }
        Response.Redirect("~/05_Tid/personnelformsee.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/05_Tid/personnelformsee.aspx");
    }
}
