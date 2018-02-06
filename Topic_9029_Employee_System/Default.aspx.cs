using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        byte[] bytes = FileUpload1.FileBytes;
        foreach (var item in bytes)
        {
            Response.Write(item);
        }
        Session["test"] = bytes;

        string str = "insert into [Table] values(@ID,@Image)";

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString);

        SqlCommand cmd = new SqlCommand(str, cn);
        cmd.Parameters.AddWithValue("@ID", 1);
        cmd.Parameters.AddWithValue("@Image", bytes);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString);
        string str = "select * from [Table]";
        SqlCommand cmd = new SqlCommand(str, cn);

        byte[] bytes = new byte[1];

        cn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            bytes = (byte[])reader[1];
        }
        reader.Close();
        cn.Close();


        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        Image1.ImageUrl = "data:image/png;base64," + base64String;
    }
    private void SQLHelperNonQuery(string cmdStr, Dictionary<string, object> data)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString);

        SqlCommand cmd = new SqlCommand(cmdStr, cn);
        foreach (KeyValuePair<string, object> item in data)
        {
            cmd.Parameters.AddWithValue(item.Key, item.Value);
        }
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string str = "insert into [Table] values(@ID,@Image)";
        string key = "500";

        Dictionary<string, object> data = new Dictionary<string, object>()
        {
            { "@ID", 500 },
            { "@Image", DBNull.Value }
        };
        SQLHelperNonQuery(str, data);
    }
}