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
        //"select count(idpersonnel) as daystred , idpersonnel from personnelfurloughwait group by idpersonnel"

        if (!Page.IsPostBack)
        {
            SqlDataAdapter daa = new SqlDataAdapter(
            "Select * from personnelfurloughwait Where statusfromowaitok in (1,2)",
             @"Data Source=S16C\SQLEXPRESS;Initial Catalog=9029_Employees_Database;Persist Security Info=True;User ID=sa;Password=sa"
             );

        DataTable dt = new DataTable();
        daa.Fill(dt);
        var idpersonnelAry = dt.AsEnumerable().Select(r => r["name"].ToString()).ToArray();
        var daystredAry = dt.AsEnumerable().Select(r => r["daystred"].ToString()).ToArray();
        HiddenField1.Value = string.Join(",", idpersonnelAry);
        HiddenField2.Value = string.Join(",", daystredAry);


        }
        //SqlDataAdapter daa = new SqlDataAdapter(

        //    "select count(country) as count , country from customers group by country",
        //    @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\2018pojustv2\App_Data\test.mdf;Integrated Security=True"
        //    );

        //DataTable dt = new DataTable();
        //daa.Fill(dt);
        //var counrtyAry = dt.AsEnumerable().Select(r => r["count"].ToString()).ToArray();
        //var countAry = dt.AsEnumerable().Select(r => r["count"].ToString()).ToArray();
        //HiddenField1.Value = string.Join(",", counrtyAry);
        //HiddenField2.Value = string.Join(",", countAry);

        //    string connString = ConfigurationManager.ConnectionStrings["testConnectionString1"].ConnectionString;
            //    using (SqlConnection cn = new SqlConnection(connString))
            //{
            //    DataTable ds = new DataTable();
            //    SqlDataAdapter da = new SqlDataAdapter("Select id,idpersonnel,type,timestart,timeend,description,daytime from personnelfurloughwait", cn); //Customers 裡面的 CustomerID, CompanyName資料
            //                                                                                                                                                                                                  //放入ds 名為Customers表格中      
            //    da.Fill(ds);
            //    ListView1.DataSource = ds;
            //    ListView1.DataBind();
            //}
            string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(connString))
            {
                DataTable ds = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("Select * from personnelfurloughwait Where statusfromowaitok in (1,2)", cn); //Customers 裡面的 CustomerID, CompanyName資料
                                                                                                                                                                                                         //放入ds 名為Customers表格中
                //da.SelectCommand.Parameters.AddWithValue("@statusfromowait0roko1rno2", 1);
                da.Fill(ds);
                ListView1.DataSource = ds;
                ListView1.DataBind();


            }

        
        

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(connString))
        {
            DataTable ds = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("Select * from personnelfurloughwait Where idpersonnel Like '%'+@idpersonnel + '%' and statusfromowaitok in (1,2) ", cn); //Customers 裡面的 CustomerID, CompanyName資料
                                                                                                                                                                       //放入ds 名為Customers表格中
            da.SelectCommand.Parameters.AddWithValue("@idpersonnel", TextBox1.Text);
            da.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
            //label1.Text = ds.Rows[0][0].ToString();
            //label1.Text = ds.Rows[0]["id"].ToString();
        }
    }

    
   
    //select count(id) from personnelfurloughwait where statusfromowait0roko1rno2 = 0
  
}