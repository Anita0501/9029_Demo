using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _03_Profile : System.Web.UI.Page
{
    public Employee emp;
    protected void Page_Load(object sender, EventArgs e)
    {
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
            PermissionsDropDownList.AppendDataBoundItems = true;
            PermissionsDropDownList.DataSource = roleList;
            PermissionsDropDownList.DataTextField = "RoleName";
            PermissionsDropDownList.DataValueField = "RoleId";
            PermissionsDropDownList.DataBind();

            ShowProfile();
        }
    }

    protected void EditButton_Click(object sender, EventArgs e)
    {
        EmpNameTextBox.Enabled = true;
        CellphoneTextBox.Enabled = true;
        AddressTextBox.Enabled = true;
        EditButton.Enabled = false;
        SubmitButton.CssClass = "offset-sm-8 col-sm-1 btn btn-primary";
        CancelButton.CssClass = "btn btn-danger offset-sm-1 col-sm-1";
        ImageLabel.CssClass = "col-sm-2 deep-font-colour form-control-label";
        FileUpload1.CssClass = "";
    }
    //送出確認修改
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        //先取得原始個人資料
        emp = Employee.LoginUser();
        byte[] bytes = emp.ImageBytes;

        //如果有上傳照片就將新的取代原始資料
        if (FileUpload1.HasFile)
        {
            bytes = FileUpload1.FileBytes;
        }

        //將textBox各項資料放進list
        List<string> inputList = new List<string>()
        {
            EmpIDTextBox.Text,
            EmpNameTextBox.Text,
            DepatmentDropDownList.SelectedValue,
            JobTitleTextBox.Text,
            PermissionsDropDownList.SelectedValue,
            DutyDate.Text,
            Birthday.Text,
            ExtTextBox.Text,
            CellphoneTextBox.Text,
            AddressTextBox.Text,
            EmailTextBox.Text,
            emp.Password,
            emp.StartDate,
            emp.EndDate,
        };
        BusinessLogic bl = new BusinessLogic();
        //建立新的使用者資訊、並將新的使用者資訊寫入DB
        emp = bl.CreateEmpInfo(inputList, bytes);
        bl.UpdateEmployee(emp);

        //將新資料存入session
        Session["EmployeeInfo"] = emp;
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeSuccess()", true);

    }
    public void ChangeControl()
    {
        EmpNameTextBox.Enabled = false;
        CellphoneTextBox.Enabled = false;
        AddressTextBox.Enabled = false;
        EditButton.Enabled = true;
        SubmitButton.CssClass = "hide";
        CancelButton.CssClass = "hide";
        ImageLabel.CssClass = "hide";
        FileUpload1.CssClass = "hide";
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeFailed()", true);
    }

    public void ShowProfile()
    {
        int roleSelectIndex = 0;
        emp = Employee.LoginUser();

        if (emp.RoleID == 1)
        {
            roleSelectIndex = 1;
        }
        else if (emp.RoleID == 3)
        {
            roleSelectIndex = 2;
        }
        else if (emp.RoleID == 9)
        {
            roleSelectIndex = 3;
        }
        string base64String = Convert.ToBase64String(emp.ImageBytes, 0, (emp.ImageBytes).Length);
        EmpImage.ImageUrl = "data:image/png;base64," + base64String;
        EmpIDTextBox.Text = emp.EmployeeID.ToString();
        EmpNameTextBox.Text = emp.EmployeeName;
        DepatmentDropDownList.SelectedIndex = emp.DepatmentID;
        JobTitleTextBox.Text = emp.JobTitle;
        PermissionsDropDownList.SelectedIndex = roleSelectIndex;
        DutyDate.Text = emp.DutyDate;
        Birthday.Text = emp.Birthday;
        CellphoneTextBox.Text = emp.Cellphone;
        ExtTextBox.Text = emp.EXT;
        AddressTextBox.Text = emp.Address;
        EmailTextBox.Text = emp.Email;
    }
}