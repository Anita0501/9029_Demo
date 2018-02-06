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
    protected void Button1_Click1(object sender, EventArgs e)
    {
        using (var cn = new SqlConnection(dblink))
        {
            //https://www.fooish.com/sql/insert-into.html
            SqlCommand com =
                new SqlCommand("Insert into Equipment values(@EquipmentName,@EquipmentAmount,@SortID,@PurchaseDate,@Audit,@UseLife)", cn);
            //com.Parameters.AddWithValue("EquipmentID", inputHorizontalSuccess.Value);
            com.Parameters.AddWithValue("EquipmentName", inputHorizontalWarning1.Value);
            com.Parameters.AddWithValue("EquipmentAmount", inputHorizontalWarning2.Value);
            com.Parameters.AddWithValue("SortID", idSortID.Value);
            com.Parameters.AddWithValue("PurchaseDate", PurchaseDate.Value);
            com.Parameters.AddWithValue("Audit",0);//預設值 0 欄位可否不給值?
            com.Parameters.AddWithValue("UseLife", UseLife.Value);
            cn.Open();
            com.ExecuteNonQuery();
        }
    }
}