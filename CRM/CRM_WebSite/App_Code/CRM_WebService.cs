using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for CRM_WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class CRM_WebService : System.Web.Services.WebService
{

    public CRM_WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public List<CRM_Customer> Customers()
    {
        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        List<CRM_Customer> rList = ru.GetCustomers();

        return rList;
    }

    [WebMethod]
    public void Delete (int id)
    {
        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        //int id = Convert.ToInt32(DeleteTextBox.Text);
        ru.Delete(id);
    }

    [WebMethod]
    public void Update(int id)
    {
        //CRM_Customer r = new CRM_Customer() { CompanyID = Convert.ToInt32() };
        //r.CompanyName = ;
        //r.CompanyAddress = ;
        //r.CompanyPhone = ;
        //r.OfficialWebsite = ;
        //r.ContactPerson = ;
        //r.CP_Phone = ;
        //r.CP_Email = ;
        //r.CompanyScale = ;
        //r.CompanyCategory = ;

        //CRM_CustomerUtility ru = new CRM_CustomerUtility();
        //ru.Update(r);
    }
}
