using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee emp = Employee.LoginUser();
        if (emp.RoleID != 1 && emp.RoleID != 2)
        {
            Response.Redirect("~/" + ConfigurationManager.AppSettings["NoPermissions"]);
        }
        if (!Page.IsPostBack)
        {
            BusinessLogic bl = new BusinessLogic();
            List<Department> departmentList = bl.GetDepartmentData();
            DepatmentDropDownList.AppendDataBoundItems = true;
            DepatmentDropDownList.DataSource = departmentList;
            DepatmentDropDownList.DataTextField = "DepartmentName";
            DepatmentDropDownList.DataValueField = "DepartmentID";
            DepatmentDropDownList.DataBind();

            List<Role> roleList = bl.GetRoleData();
            RoleDropDownList.AppendDataBoundItems = true;
            RoleDropDownList.DataSource = roleList;
            RoleDropDownList.DataTextField = "RoleName";
            RoleDropDownList.DataValueField = "RoleID";
            RoleDropDownList.DataBind();
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        BusinessLogic logic = new BusinessLogic();
        List<Employee> empList = logic.GetEmployeeList();
        string insertEmpId = EmpIDTextBox.Text.Trim();
        foreach (var item in empList)
        {
            //ID已存在
            if (item.EmployeeID == insertEmpId)
            {
                EmpIdWarningLabel.Text = "編號已使用";
                EmpIdWarningLabel.CssClass = "warning small-font";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeFailed()", true);
                return;
            }
        }
        if (!IconFileUpload.HasFile)
        {
            FileUpLoadWaenLabel.Text = "請選擇照片";
            FileUpLoadWaenLabel.CssClass = "warning small-font";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "insertFailed_file()", true);
            return;
        }
        //將表格中的資料轉為員工資料物件並存入BD
        byte[] bytes = IconFileUpload.FileBytes;
        List<string> inputList = new List<string>()
        {
            EmpIDTextBox.Text,
            EmpNameTextBox.Text,
            DepatmentDropDownList.SelectedValue,
            JobTitleTextBox.Text,
            RoleDropDownList.SelectedValue,
            DutyDate.Text,
            Birthday.Text,
            ExtTextBox.Text,
            CellphoneTextBox.Text,
            AddressTextBox.Text,
            EmailTextBox.Text,
            "0000",
            DateTime.Now.ToShortDateString(),
            DateTime.Now.ToShortDateString()
        };

        BusinessLogic bl = new BusinessLogic();
        bytes = IconFileUpload.FileBytes;
        bl.InsertEmployee(bl.CreateEmpInfo(inputList, bytes));

        //將員工對應的角色權限以(員工編號-網頁-權限)的方式存在DB
        int roleid = int.Parse(RoleDropDownList.SelectedValue);
        string empId = EmpIDTextBox.Text.Trim();
        List<Permissions> permissionList = bl.GetPermissionsData().Where(p => p.RoleId == roleid).ToList();
        foreach (var item in permissionList)
        {
            bl.InsertEmployeePermission(new EmployeePermissions(empId, item.SiteId, item.Enable));
        }

        //完成後呼叫前端function
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeSuccess()", true);
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/" + ConfigurationManager.AppSettings["ProfilePage"]);
    }
}