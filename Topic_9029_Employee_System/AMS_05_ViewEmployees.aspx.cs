using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GemBox.Spreadsheet;

public partial class AMS_05_ViewEmployees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee emp = Employee.LoginUser();
        if (emp.RoleID != 1 && emp.RoleID != 2)
        {
            Response.Redirect("~/" + ConfigurationManager.AppSettings["NoPermissions"]);
        }
    }


    protected void EditButton_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("sheet1");
        mySheet.Cells[0, 0].Value = "員工編號";
        mySheet.Cells[0, 0].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 1].Value = "姓名";
        mySheet.Cells[0, 1].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 2].Value = "部門";
        mySheet.Cells[0, 2].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 3].Value = "職稱";
        mySheet.Cells[0, 3].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 4].Value = "角色";
        mySheet.Cells[0, 4].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 5].Value = "分機";
        mySheet.Cells[0, 5].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 6].Value = "到職日期";
        mySheet.Cells[0, 6].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 7].Value = "生日";
        mySheet.Cells[0, 7].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 8].Value = "手機號碼";
        mySheet.Cells[0, 8].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 9].Value = "現居地址";
        mySheet.Cells[0, 9].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));
        mySheet.Cells[0, 10].Value = "電子信箱";
        mySheet.Cells[0, 10].Style.FillPattern.SetSolid(SpreadsheetColor.FromName(ColorName.Orange));

        BusinessLogic logic = new BusinessLogic();
        List<Employee> empList = logic.GetEmployeeList();
        List<Role> roleList = logic.GetRoleData();
        List<Department> departmentList = logic.GetDepartmentData();
        for (int i = 1; i < empList.Count(); i++)
        {
            mySheet.Cells[i, 0].Value = empList[i].EmployeeID;
            mySheet.Cells[i, 1].Value = empList[i].EmployeeName;
            mySheet.Cells[i, 2].Value = departmentList.Single(d => d.DepartmentID == empList[i].DepatmentID).DepartmentName;
            mySheet.Cells[i, 3].Value = empList[i].JobTitle;
            mySheet.Cells[i, 4].Value = roleList.Single(r => r.RoleId == empList[i].RoleID).RoleName;
            mySheet.Cells[i, 5].Value = empList[i].EXT;
            mySheet.Cells[i, 6].Value = empList[i].DutyDate;
            mySheet.Cells[i, 7].Value = empList[i].Birthday;
            mySheet.Cells[i, 8].Value = empList[i].Cellphone;
            mySheet.Cells[i, 9].Value = empList[i].Address;
            mySheet.Cells[i, 10].Value = empList[i].Email;
        }

        xlsx.Save(Server.MapPath(@"~\Output\employeeSheet.xlsx"));


        Response.AddHeader("Content-Type", "application/octet-stream");
        Response.AddHeader("Content-Transfer-Encoding", "Binary");
        Response.AddHeader("Content-disposition", "attachment;  filename=\"employeeSheet.xlsx\"");

        Response.WriteFile(
            HttpRuntime.AppDomainAppPath + @"Output\employeeSheet.xlsx");

        Response.End();


    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeSuccess()", true);
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeFailed()", true);
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "IsDelete()", true);
    }
}