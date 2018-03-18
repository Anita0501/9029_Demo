using GemBox.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Eexcelstaturom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee employee = Employee.LoginUser();
        string ab = employee.EmployeeID;
        string aname = employee.EmployeeName;
        string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(connString))
        {

            DataTable ds = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("Select * from personnelfurloughwait Where statusfromowaitok in (0)", cn); //Customers 裡面的 CustomerID, CompanyName資料
            da.Fill(ds);                                                                                                                          //放入ds 名為Customers表格中                                                                                                                                                                                                               //da.SelectCommand.Parameters.AddWithValue("@statusfromowait0roko1rno2", 1);
            Label4.Text = "管理者:" + aname + " 編號:" + ab + " 已進入表單管理系統 " + " 目前還有" + ds.Rows.Count.ToString() + "筆表單未審核";
            
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //取得EmployeeID
            string pk = ((DataRowView)e.Row.DataItem)["Id"].ToString();
            //點選按鈕展開縮合細項資料功能
            Button c = (Button)e.Row.FindControl("Button1");
            c.OnClientClick = "var d = document.getElementById('d" + pk + "'); d.style.display = (d.style.display=='') ? 'none' : ''; return false;";
        }
    }

   
    protected void Button2_Click(object sender, EventArgs e)    
    {

        string connString = ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString;

        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("sheet1");
        mySheet.Cells[1, 1].Value = "表單編號";
        mySheet.Cells[1, 1].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 2].Value = "員工編號";
        mySheet.Cells[1, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 3].Value = "表單類型";
        mySheet.Cells[1, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 4].Value = "開始時間";
        mySheet.Cells[1, 4].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 5].Value = "結束時間";
        mySheet.Cells[1, 5].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 6].Value = "申請時間";
        mySheet.Cells[1, 6].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[1, 7].Value = "審核結果";
        mySheet.Cells[1, 7].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));

       
        using (SqlConnection cn = new SqlConnection(connString))
            {
             DataTable ds = new DataTable();
            string str = "Select * from personnelfurloughwait Where statusfromowaitok in (1,2)";
            SqlDataAdapter da = new SqlDataAdapter(str, cn);
            da.Fill(ds);
           for (int i = 0; i < ds.Rows.Count; i++)
            {
                    mySheet.Cells[i+2, 1].Value = ds.Rows[i]["Id"].ToString();
            mySheet.Cells[i+2, 2].Value = ds.Rows[i]["idpersonnel"].ToString();
            mySheet.Cells[i+2, 3].Value = ds.Rows[i]["type"].ToString();
            mySheet.Cells[i+2, 4].Value = ds.Rows[i]["timestart"].ToString();
            mySheet.Cells[i+2, 5].Value = ds.Rows[i]["timeend"].ToString();
            mySheet.Cells[i+2, 6].Value = ds.Rows[i]["daytime"].ToString();
            mySheet.Cells[i+2, 7].Value = ds.Rows[i]["statusfromowaitresatnooryes"].ToString();
            }
        }
        xlsx.Save(Server.MapPath(@"Output\Form.xlsx"));
        
        Response.AddHeader("Content-Type", "application/octet-stream");
        Response.AddHeader("Content-Transfer-Encoding", "Binary");
        Response.AddHeader("Content-disposition", "attachment;  filename=\"Form.xlsx\"");

        Response.WriteFile(
            HttpRuntime.AppDomainAppPath + @"05_Tid\Output\Form.xlsx");

        Response.End();

    }
    //protected void Button3_Click(object sender, EventArgs e)
    //{   
        

    //}
    
}

