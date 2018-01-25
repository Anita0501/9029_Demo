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

    }

    protected void Demobtn_Click(object sender, EventArgs e)
    {
        TripIDTextBox.Text = "";
        CompanyIDTextBox.Text = "53212539";
        CompanyNameTextBox.Text = "高思數位網路有限公司";
        EmployeeIDTextBox.Text = "888";
        EmployeeNameTextBox.Text = "林小牙";
        TripThemeTextBox.Text = "新產品Demo";
        TargetDateTextBox.Text = "";
        MemoTextBox.Text = "出發前再次電聯客戶確認到訪時間是否方便拜訪";
    }
    protected void CancelBtn_Click(object sender, EventArgs e)
    {
        TripIDTextBox.Text = "";
        CompanyIDTextBox.Text = "";
        CompanyNameTextBox.Text = "";
        EmployeeIDTextBox.Text = "";
        EmployeeNameTextBox.Text = "";
        TripThemeTextBox.Text = "";
        TargetDateTextBox.Text = "";
        MemoTextBox.Text = "";
    }

    protected void InsertBtn_Click(object sender, EventArgs e)
    {
        try
        {
            ErrorLab.Text = "";
            CRM_BusinessSchedule r = new CRM_BusinessSchedule()
            {
                TripID = Convert.ToInt32(TripIDTextBox.Text),
                CompanyID = Convert.ToInt32(CompanyIDTextBox.Text),
                CompanyName = CompanyNameTextBox.Text,
                EmployeeID = Convert.ToInt32(EmployeeIDTextBox.Text),
                EmployeeName = EmployeeNameTextBox.Text,
                TripTheme = TripThemeTextBox.Text,
                TargetDate = Convert.ToDateTime(TargetDateTextBox.Text),
                Memo = MemoTextBox.Text
            };

            CRM_BusinessScheduleUtility ru = new CRM_BusinessScheduleUtility();
            ru.Insert(r);
        }
        catch (Exception)
        {
            ErrorLab.Text = "此行程單號已存在";
        }
    }

    protected void UpdateBtn_Click(object sender, EventArgs e)
    {

    }

    protected void SelectBtn_Click(object sender, EventArgs e)
    {

    }
}