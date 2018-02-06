using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AMS_08_ResetEmployeePassword : System.Web.UI.Page
{
    public string code;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void ShowButton_Click(object sender, EventArgs e)
    {
        BusinessLogic bl = new BusinessLogic();
        string empId = EmpIdTextBox.Text.Trim();
        Employee empInfo = bl.GetEmployeeList().SingleOrDefault(emp => emp.EmployeeID == empId);

        if (empInfo != null)
        {
            Department department = bl.GetDepartmentData().Single(d => d.DepartmentID == empInfo.DepatmentID);
            string strEmpInfo = "員工編號 : " + empId + "</br>員工姓名 : " + empInfo.EmployeeName + "</br>部門 : " + department.DepartmentName;
            empInfoLabel.Text = strEmpInfo;
            empInfoLabel.CssClass = "offset-3";
        }
        else
        {
            empInfoLabel.CssClass = "offset-3 warning";
            empInfoLabel.Text = "輸入錯誤";
        }

    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        BusinessLogic bl = new BusinessLogic();
        string empId = EmpIdTextBox.Text.Trim();
        Employee empInfo = bl.GetEmployeeList().SingleOrDefault(emp => emp.EmployeeID == empId);


        byte[] bytes = empInfo.ImageBytes;


        //將textBox各項資料放進list
        List<string> inputList = new List<string>()
        {
            empInfo.EmployeeID,
            empInfo.EmployeeName,
            empInfo.DepatmentID.ToString(),
            empInfo.JobTitle,
            empInfo.RoleID.ToString(),
            empInfo.DutyDate,
            empInfo.Birthday,
            empInfo.EXT,
            empInfo.Cellphone,
            empInfo.Address,
            empInfo.Email,
            "0000",
            DateTime.Now.ToShortDateString(),
            DateTime.Now.ToShortDateString(),
        };

        //建立新的使用者資訊、並將新的使用者資訊寫入DB
        empInfo = bl.CreateEmpInfo(inputList, bytes);
        bl.UpdateEmployee(empInfo);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeSuccess()", true);
    }
}