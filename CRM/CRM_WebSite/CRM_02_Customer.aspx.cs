using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _02_AddCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
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
        CompanyScaleDropDownList.SelectedValue = "未選擇";
        CompanyCategoryDropDownList.SelectedValue = "未選擇";
    }

    protected void InsertBtn_Click(object sender, EventArgs e)
    {
        try
        {
            ErrorLab.Text = "客戶資料新增成功";
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
        catch (Exception)
        {
            ErrorLab.Text = "此客戶資料錯誤";
        }
    }

    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        CRM_Customer r = new CRM_Customer() { CompanyID = Convert.ToInt32(CompanyIDTextBox.Text) };
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
        ErrorLab.Text = "修改客戶資料成功";
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
            CompanyAddressTextBox.Text = rList[0].CompanyAddress;
            CompanyPhoneTextBox.Text = rList[0].CompanyPhone;
            OfficialWebsiteTextBox.Text = rList[0].OfficialWebsite;
            ContactPersonTextBox.Text = rList[0].ContactPerson;
            CP_PhoneTextBox.Text = rList[0].CP_Phone;
            CP_EmailTextBox.Text = rList[0].CP_Email;
            CompanyScaleDropDownList.SelectedValue = rList[0].CompanyScale;
            CompanyCategoryDropDownList.SelectedValue = rList[0].CompanyCategory;
        }
        catch (Exception)
        {
            ErrorLab.Text = "查無此客戶資料";
            CompanyNameTextBox.Text = "";
            CompanyAddressTextBox.Text = "";
            CompanyPhoneTextBox.Text = "";
            OfficialWebsiteTextBox.Text = "";
            ContactPersonTextBox.Text = "";
            CP_PhoneTextBox.Text = "";
            CP_EmailTextBox.Text = "";
            CompanyScaleDropDownList.SelectedValue = "未選擇";
            CompanyCategoryDropDownList.SelectedValue = "未選擇";
        }
    }

}