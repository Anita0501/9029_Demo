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


        ////////
        if (!Page.IsPostBack)
        {
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
                SqlDataAdapter da = new SqlDataAdapter("Select * from personnelfurloughwait Where statusfromowaitok in (0)", cn); //Customers 裡面的 CustomerID, CompanyName資料
                                                                                                                                                                                                         //放入ds 名為Customers表格中
                //da.SelectCommand.Parameters.AddWithValue("@statusfromowait0roko1rno2", 1);
                da.Fill(ds);
                ListView1.DataSource = ds;
                ListView1.DataBind();
                //label1.Text = ds.Rows[0][0].ToString();
                //label1.Text = ds.Rows[0]["id"].ToString();
            }

        }
   }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(connString))
        {
            DataTable ds = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("Select * from personnelfurloughwait Where idpersonnel Like '%'+@idpersonnel + '%'and statusfromowaitok = 0", cn); //Customers 裡面的 CustomerID, CompanyName資料
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        foreach (ListViewItem item in ListView1.Items)
        {
           
            RadioButtonList bRadioButtonList = (RadioButtonList)item.FindControl("RadioButtonList1");
            Label aidLabel = (Label)item.FindControl("idLabel");
            if (bRadioButtonList.SelectedValue == "")
            {
                string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
                using (var conn = new SqlConnection(connString))
                {
                    SqlCommand com = new SqlCommand("Update personnelfurloughwait set statusfromowaitok=@statusfromowaitok where Id=@Id ", conn);

                    com.Parameters.AddWithValue("@Id", int.Parse(aidLabel.Text));
                    com.Parameters.AddWithValue("@statusfromowaitok", 0);
                    conn.Open();
                    com.ExecuteNonQuery();
                }
            }
            else if (int.Parse(bRadioButtonList.SelectedValue) == 1)
            {
                string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
                using (var conn = new SqlConnection(connString))
                {
                    SqlCommand com = new SqlCommand("Update personnelfurloughwait set statusfromowaitok=@statusfromowaitok,statusfromowaitresatnooryes=@statusfromowaitresatnooryes where Id=@Id ", conn);

                    com.Parameters.AddWithValue("@Id", int.Parse(aidLabel.Text));
                    com.Parameters.AddWithValue("@statusfromowaitok", int.Parse(bRadioButtonList.SelectedValue));
                    com.Parameters.AddWithValue("@statusfromowaitresatnooryes", "審核通過");
                    conn.Open();
                    com.ExecuteNonQuery();
                }
            }
            else if (int.Parse(bRadioButtonList.SelectedValue) == 2)
            {
                string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
                using (var conn = new SqlConnection(connString))
                {
                    SqlCommand com = new SqlCommand("Update personnelfurloughwait set statusfromowaitok=@statusfromowaitok,statusfromowaitresatnooryes=@statusfromowaitresatnooryes where Id=@Id ", conn);

                    com.Parameters.AddWithValue("@Id", int.Parse(aidLabel.Text));
                    com.Parameters.AddWithValue("@statusfromowaitok", int.Parse(bRadioButtonList.SelectedValue));
                    com.Parameters.AddWithValue("@statusfromowaitresatnooryes", "審核不通過");
                    conn.Open();
                    com.ExecuteNonQuery();
                }
            }

        }
        Response.Redirect("~/05_Tid/statusfromowaitokno.aspx");
        //Response.Write("11");
        ////for (int i = 0; i < ListView1.Items.Cou; i++)
        ////{

        ////    ListViewDataItem d = ListView1.Items[i];

        ////    //string aa = (d.FindControl("RadioButtonList1") as RadioButtonList).SelectedValue;
        ////    //Response.Write(ListView1

        ////}
        //for (int i = 0; i < ListView1.Items.Count; i++)
        //{
        //ListViewDataItem d = ListView1.Items[0];
        //    RadioButtonList bun = d.FindControl("RadioButtonList1") as RadioButtonList;
        ////}

    }
}