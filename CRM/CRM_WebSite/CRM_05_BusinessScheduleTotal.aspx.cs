using GemBox.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _03_Sel_Del_Customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    //protected void DeleteBtn_Click(object sender, EventArgs e)
    //{
    //    CRM_CustomerUtility ru = new CRM_CustomerUtility();
    //    int id = Convert.ToInt32(DeleteTextBox.Text);
    //    ru.Delete(id);
    //}

    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        CRM_BusinessSchedule r = new CRM_BusinessSchedule() { TripID = Convert.ToInt32(TripIDHiddenField.Value) };
        r.CompanyID = Convert.ToInt32(CompanyID.Text);
        r.CompanyName = CompanyName.Text;
        r.EmployeeID = EmployeeID.Text;
        r.EmployeeName = EmployeeName.Text;
        r.TripTheme = TripTheme.Text;
        r.TargetDate = TargetDate.Text;
        r.Memo = Memo.Text;

        CRM_BusinessScheduleUtility ru = new CRM_BusinessScheduleUtility();
        ru.Update(r);
    }
    protected void ExcelBtn_Click(object sender, EventArgs e)
    {
        DataTable dt = DBHelper.GetDataTable("select * from CRM_BusinessSchedule", null);
        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("BusinessSchedules");
        mySheet.Cells[1, 2].Value = "行程單號";
        mySheet.Cells[1, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 3].Value = "統編";
        mySheet.Cells[1, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 4].Value = "公司名稱";
        mySheet.Cells[1, 4].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 5].Value = "員工編號";
        mySheet.Cells[1, 5].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 6].Value = "員工名稱";
        mySheet.Cells[1, 6].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 7].Value = "行程主題";
        mySheet.Cells[1, 7].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 8].Value = "預約日期";
        mySheet.Cells[1, 8].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));
        mySheet.Cells[1, 9].Value = "備註欄";
        mySheet.Cells[1, 9].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.LightBlue));

        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 2,
               StartRow = 2,
           });
        xlsx.Save(Server.MapPath(@"~\Output\CRM_BusinessSchedulesList.xlsx"));
        MsgLab.Text = "Excel檔案匯出成功";
    }

}