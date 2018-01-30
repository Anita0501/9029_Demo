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
        CRM_Customer r = new CRM_Customer() { CompanyID = Convert.ToInt32(CompanyID.Text) };
        //r.CompanyName = CompanyName.Text;
        //r.CompanyAddress = CompanyAddress.Text;
        //r.CompanyPhone = CompanyPhone.Text;
        //r.OfficialWebsite = OfficialWebsite.Text;
        //r.ContactPerson = ContactPerson.Text;
        //r.CP_Phone = CP_Phone.Text;
        //r.CP_Email = CP_Email.Text;
        //r.CompanyScale = CompanyScale.Text;
        //r.CompanyCategory = CompanyCategory.Text;

        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        ru.Update(r);
    }
}