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
        //Employee empInfo = Employee.LoginUser();
        //if(empInfo == null)
        //{
        //    Response.Redirect("~/" + ConfigurationManager.AppSettings["LoginPage"]);
        //}

        //string str = empInfo.PermissionsID + "," + empInfo.EmployeeName + "," 
        //    + empInfo.JobTitle + ","+empInfo.FirstLogin;
        //EmployeeHiddenField.Value = str;
    }
}

