using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee empInfo = Employee.LoginUser();
        if (empInfo == null)
        {
            Response.Redirect("~/" + ConfigurationManager.AppSettings["LoginPage"]);
        }

        string changePassword = "false";
        //如果 StartDate = EndDate(第一次登入)   EndDate<=現在日期(密碼過期)
        if (empInfo.StartDate == empInfo.EndDate || DateTime.Parse(empInfo.EndDate) <= DateTime.Now)
        {
            changePassword = "true";
        }

        string base64String = Convert.ToBase64String(empInfo.ImageBytes, 0, (empInfo.ImageBytes).Length);
        EmpImage.ImageUrl = "data:image/png;base64," + base64String;

        string str = empInfo.EmployeeID + "," + empInfo.EmployeeName + ","
            + empInfo.JobTitle + "," + changePassword;

        string url = "/" + ConfigurationManager.AppSettings["LoginPage"];
        EmployeeHiddenField.Value = str;
        urlHiddenField.Value = url;
    }
}

