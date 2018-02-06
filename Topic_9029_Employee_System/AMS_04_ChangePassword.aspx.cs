using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AMS_04_FirstLogin : System.Web.UI.Page
{
    public Employee empInfo;

    protected void Page_Load(object sender, EventArgs e)
    {
        empInfo = Employee.LoginUser();
        if (empInfo.StartDate == empInfo.EndDate)
        {
            Hint.Text = "首次登入請更改密碼";
        }
        else if( DateTime.Parse(empInfo.EndDate) <= DateTime.Now)
        {
            Hint.Text = "上次更換密碼:" + empInfo.StartDate;
        }
        EmpNameTextBox.Text = empInfo.EmployeeName;
        EmpIDTextBox.Text = empInfo.EmployeeID;
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        empInfo = Employee.LoginUser();
        if (OPasswordTextBox.Text == empInfo.Password)
        {
            if (PasswordTextBox.Text == PasswordTextBox2.Text)
            {
                empInfo.Password = PasswordTextBox.Text;
                empInfo.StartDate = DateTime.Now.ToShortDateString();
                empInfo.EndDate = (DateTime.Now.AddMonths(3)).ToShortDateString();
                BusinessLogic bl = new BusinessLogic();
                bl.UpdateEmployee(empInfo);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeSuccess()", true);
            }
        }
        else
        {
            warningLable.Text = "<i class=\"fa fa-exclamation - triangle\" aria-hidden=\"true\"></i>" +
                "密碼修改失敗" +
                "<i class=\"fa fa-exclamation - triangle\" aria-hidden=\"true\"></i>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeFailed()", true);

        }
    }
}