using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _02_AddCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Demobtn_Click(object sender, EventArgs e)
    {
        CompanyIDTextBox.Text = "53212539";
        CompanyNameTextBox.Text = "高思數位網路有限公司";
        CompanyAddressTextBox.Text = "新北市樹林區圳民里俊英街248巷26號";
        CompanyPhoneTextBox.Text = "02-8888-8888";
        OfficialWebsiteTextBox.Text = "https://www.facebook.com/";
        ContactPersonTextBox.Text = "王大明";
        CP_PhoneTextBox.Text = "0912-345-678";
        CP_EmailTextBox.Text = "BigLight@yahoo.com.tw";
    }

    protected void InsertBtn_Click(object sender, EventArgs e)
    {
        CRM_Customer r = new CRM_Customer()
        {
            CompanyID = Convert.ToInt32(CompanyIDTextBox.Text),
            CompanyName = CompanyNameTextBox.Text,
            CompanyAddress = CompanyAddressTextBox.Text,
            CompanyPhone = CompanyPhoneTextBox.Text,
            OfficialWebsite = OfficialWebsiteTextBox.Text,
            ContactPerson = ContactPersonTextBox.Text,
            CP_Phone = CP_PhoneTextBox.Text,
            CP_Email = CP_EmailTextBox.Text,
            CompanyScale = CompanyScaleDropDownList.Text,
            CompanyCategory = CompanyCategoryDropDownList.Text
        };

        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        ru.Insert(r);
    }

    protected void CancelBtn_Click(object sender, EventArgs e)
    {
        CompanyIDTextBox.Text = "";
        CompanyNameTextBox.Text = "";
        CompanyAddressTextBox.Text = "";
        CompanyPhoneTextBox.Text = "";
        OfficialWebsiteTextBox.Text = "";
        ContactPersonTextBox.Text = "";
        CP_PhoneTextBox.Text = "";
        CP_EmailTextBox.Text = "";

    }


    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        CRM_Customer r = new CRM_Customer() { CompanyID = Convert.ToInt32(UCompanyIDTextBox.Text) };
        r.CompanyName = CompanyNameTextBox.Text;
        r.CompanyAddress = CompanyAddressTextBox.Text;
        r.CompanyPhone = CompanyPhoneTextBox.Text;
        r.OfficialWebsite = OfficialWebsiteTextBox.Text;
        r.ContactPerson = ContactPersonTextBox.Text;
        r.CP_Phone = CP_PhoneTextBox.Text;
        r.CP_Email = CP_EmailTextBox.Text;
        r.CompanyScale = CompanyScaleDropDownList.Text;
        r.CompanyCategory = CompanyCategoryDropDownList.Text;

        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        ru.Update(r);
    }


}