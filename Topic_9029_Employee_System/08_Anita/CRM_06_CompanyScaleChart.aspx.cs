using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using GemBox.Spreadsheet;
using GemBox.Spreadsheet.Charts;

public partial class CRM_06_CompanyChart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = DBHelper.GetDataTable("select a.CompanyScale ,b.Id  ,count(a.CompanyScale) as 'Count' from CRM_Customer as a left join CRM_CompanyScales as b on a.CompanyScale = b.CompanyScale group by a.CompanyScale, b.Id", null);

        var CompanyScaleAry = dt.AsEnumerable().Select(r => r["CompanyScale"].ToString()).ToArray();
        var CountAry = dt.AsEnumerable().Select(r => r["Count"].ToString()).ToArray();
        CompanyScaleHiddenField.Value = string.Join(",", CompanyScaleAry);
        CountHiddenField.Value = string.Join(",", CountAry);
    }
    protected void ExcelBtn_Click(object sender, EventArgs e)
    {
        DataTable dt = DBHelper.GetDataTable("select a.CompanyScale ,count(a.CompanyScale) as 'Count' from CRM_Customer as a left join CRM_CompanyScales as b on a.CompanyScale = b.CompanyScale group by a.CompanyScale, b.Id", null);
        var CompanyScaleAry = dt.AsEnumerable().Select(r => r["CompanyScale"].ToString()).ToArray();
        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("CompanyScaleChart");
        mySheet.Cells[1, 2].Value = "公司規模";
        mySheet.Cells[1, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 3].Value = "統計筆數";
        mySheet.Cells[1, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));

        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 2,
               StartRow = 2,
           });

        int Length = CompanyScaleAry.Length;
        var chart = mySheet.Charts.Add(ChartType.Pie, "G2", "O25");
        chart.SelectData(mySheet.Cells.GetSubrangeAbsolute(1, 2, Length + 1, 3), true);


        xlsx.Save(Server.MapPath(@"\Output\CRM_CompanyScaleStatisticsList.xlsx"));
        MsgLab.Text = "Excel檔案匯出成功";

        Response.AddHeader("Content-Type", "application/octet-stream");
        Response.AddHeader("Content-Transfer-Encoding", "Binary");
        Response.AddHeader("Content-disposition", "attachment;  filename=\"CRM_CompanyScaleStatisticsList.xlsx\"");

        Response.WriteFile(
            HttpRuntime.AppDomainAppPath + @"Output\CRM_CompanyScaleStatisticsList.xlsx");

        Response.End();

    }

}