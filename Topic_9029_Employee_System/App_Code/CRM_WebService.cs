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
    public List<CRM_BusinessSchedule> BusinessSchedules()
    {
        CRM_BusinessScheduleUtility ru = new CRM_BusinessScheduleUtility();
        List<CRM_BusinessSchedule> rList = ru.GetSchedules();

        return rList;
    }

    [WebMethod]
    public void DeleteSchedule(int id)
    {
        CRM_BusinessScheduleUtility ru = new CRM_BusinessScheduleUtility();
        //int id = Convert.ToInt32(DeleteTextBox.Text);
        ru.Delete(id);
    }
}
