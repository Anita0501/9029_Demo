using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BusinessSchedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee emp = Employee.LoginUser();
        Session["EmployeeInfo"] = emp;
        EmployeeIDTextBox.Text = emp.EmployeeID;
        EmployeeNameTextBox.Text = emp.EmployeeName;
    }

    protected void Demobtn_Click(object sender, EventArgs e)
    {
        //TripIDTextBox.Text = "";
        //CompanyIDTextBox.Text = "30986336";
        //CompanyNameTextBox.Text = "";
        //EmployeeIDTextBox.Text = "A1001";
        //EmployeeNameTextBox.Text = "陳月娥";
        TripThemeTextBox.Text = "簽訂合約";
        //TargetDateTextBox.Text = "";
        MemoTextBox.Text = "先與業務部主管確認合約內容與金額正確與否";
    }
    protected void CancelBtn_Click(object sender, EventArgs e)
    {
        //TripIDTextBox.Text = "";
        CompanyIDTextBox.Text = "";
        CompanyNameTextBox.Text = "";
        //EmployeeIDTextBox.Text = "";
        //EmployeeNameTextBox.Text = "";
        TripThemeTextBox.Text = "";
        TargetDateTextBox.Text = "";
        MemoTextBox.Text = "";
    }

    protected void InsertBtn_Click(object sender, EventArgs e)
    {
        try
        {
            ErrorLab.Text = "行程新增成功";
            CRM_BusinessSchedule r = new CRM_BusinessSchedule()
            {
                //TripID = Convert.ToInt32(TripIDTextBox.Text),
                CompanyID = Convert.ToInt32(CompanyIDTextBox.Text),
                CompanyName = CompanyNameTextBox.Text,
                EmployeeID = EmployeeIDTextBox.Text,
                EmployeeName = EmployeeNameTextBox.Text,
                TripTheme = TripThemeTextBox.Text,
                TargetDate = TargetDateTextBox.Text,
                Memo = MemoTextBox.Text
            };

            CRM_BusinessScheduleUtility ru = new CRM_BusinessScheduleUtility();
            ru.Insert(r);
        }
        catch (Exception ex)
        {
            ErrorLab.Text = "查無此客戶，請先建立客戶資料";
            //ErrorLab.Text = ex.Message;
        }
    }

    protected void SelectBtn_Click(object sender, EventArgs e)
    {
        try
        {
            ErrorLab.Text = "";
            int id = Convert.ToInt32(CompanyIDTextBox.Text);
            CRM_CustomerUtility ru = new CRM_CustomerUtility();
            List<CRM_Customer> rList = ru.GetCustomer(id);

            CompanyNameTextBox.Text = rList[0].CompanyName;
            
        }
        catch (Exception)
        {
            ErrorLab.Text = "查無此客戶資料";
            CompanyNameTextBox.Text = "";
        }
    }
}