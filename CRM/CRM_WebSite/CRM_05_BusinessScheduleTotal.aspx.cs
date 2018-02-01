using System;
using System.Collections.Generic;
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
}