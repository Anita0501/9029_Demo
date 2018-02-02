using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemBox.Spreadsheet;
using System.Data;

public partial class _03_Sel_Del_Customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void DeleteBtn_Click(object sender, EventArgs e)
    {
        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        int id = Convert.ToInt32(DeleteTextBox.Text);
        ru.Delete(id);
    }

    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        CRM_Customer r = new CRM_Customer() { CompanyID = Convert.ToInt32(CompanyID.Text) };
        r.CompanyName = CompanyName.Text;
        r.CompanyAddress = CompanyAddress.Text;
        r.CompanyPhone = CompanyPhone.Text;
        r.OfficialWebsite = OfficialWebsite.Text;
        r.ContactPerson = ContactPerson.Text;
        r.CP_Phone = CP_Phone.Text;
        r.CP_Email = CP_Email.Text;
        r.CompanyScale = CompanyScale.Text;
        r.CompanyCategory = CompanyCategory.Text;

        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        ru.Update(r);
    }

    protected void ExcelBtn_Click(object sender, EventArgs e)
    {
        DataTable dt = DBHelper.GetDataTable("select * from CRM_Customer", null);
        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("Customers");
        mySheet.Cells[1, 2].Value = "統編";
        mySheet.Cells[1, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 3].Value = "公司名稱";
        mySheet.Cells[1, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 4].Value = "公司地址";
        mySheet.Cells[1, 4].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 5].Value = "公司電話";
        mySheet.Cells[1, 5].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 6].Value = "公司官網";
        mySheet.Cells[1, 6].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 7].Value = "負責窗口";
        mySheet.Cells[1, 7].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 8].Value = "負責窗口電話";
        mySheet.Cells[1, 8].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 9].Value = "負責窗口E-mail";
        mySheet.Cells[1, 9].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 10].Value = "公司規模";
        mySheet.Cells[1, 10].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 11].Value = "產業類別";
        mySheet.Cells[1, 11].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));

        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 2,
               StartRow = 2,
           });
        xlsx.Save(Server.MapPath(@"~\Output\CRM_CustomersList.xlsx"));
        MsgLab.Text = "Excel檔案匯出成功";
    }
}