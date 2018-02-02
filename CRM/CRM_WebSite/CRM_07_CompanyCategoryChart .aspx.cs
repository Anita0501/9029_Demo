using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using GemBox.Spreadsheet;

public partial class CRM_06_CompanyChart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = DBHelper.GetDataTable("select a.CompanyCategory ,b.Id  ,count(a.CompanyCategory) as 'Count' from CRM_Customer as a left join CRM_CompanyCategorys as b on a.CompanyCategory = b.CompanyCategory group by a.CompanyCategory, b.Id", null);

        var CompanyScaleAry = dt.AsEnumerable().Select(r => r["CompanyCategory"].ToString()).ToArray();
        var CountAry = dt.AsEnumerable().Select(r => r["Count"].ToString()).ToArray();
        CompanyCategoryHiddenField.Value = string.Join(",", CompanyScaleAry);
        CountHiddenField.Value = string.Join(",", CountAry);
    }

    protected void ExcelBtn_Click(object sender, EventArgs e)
    {
        DataTable dt = DBHelper.GetDataTable("select a.CompanyCategory ,count(a.CompanyCategory) as 'Count' from CRM_Customer as a left join CRM_CompanyCategorys as b on a.CompanyCategory = b.CompanyCategory group by a.CompanyCategory, b.Id", null);
        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("CompanyCategoryChart");
        mySheet.Cells[1, 2].Value = "產業類別";
        mySheet.Cells[1, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 3].Value = "統計筆數";
        mySheet.Cells[1, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));

        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 2,
               StartRow = 2,
           });
        xlsx.Save(Server.MapPath(@"~\Output\CRM_CompanyCategoryStatisticsList.xlsx"));
        MsgLab.Text = "Excel檔案匯出成功";
    }

}