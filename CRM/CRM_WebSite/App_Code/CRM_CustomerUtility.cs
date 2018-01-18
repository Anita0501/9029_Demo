using System;
using System.Collections.Generic;
using System.Data;
public class CRM_CustomerUtility
{
    public List<CRM_Customer> GetCustomers()
    {
        DataTable dt = DBHelper.GetDataTable("select * from CRM_Customer", null);

        List<CRM_Customer> rList = new List<CRM_Customer>();

        foreach (DataRow row in dt.Rows)
        {
            CRM_Customer r = new CRM_Customer()
            {
                CompanyID = Convert.ToInt32(row["CompanyID"]),
                CompanyName = row["CompanyName"].ToString(),
                CompanyAddress = row["CompanyAddress"].ToString(),
                CompanyPhone = row["CompanyPhone"].ToString(),
                OfficialWebsite = row["OfficialWebsite"].ToString(),
                ContactPerson = row["ContactPerson"].ToString(),
                CP_Phone = row["CP_Phone"].ToString(),
                CP_Email = row["CP_Email"].ToString(),
                CompanyScale = row["CompanyScale"].ToString(),
                CompanyCategory = row["CompanyCategory"].ToString()
            };
            rList.Add(r);
        }
        return rList;
    }
    public List<CRM_Customer> GetCustomer(int id)
    {
        DataTable dt = DBHelper.GetDataTable("select * from CRM_Customer where CompanyID=@id", new Dictionary<string, object>() {
                { "@id", id } });
        List<CRM_Customer> rList = new List<CRM_Customer>();

        foreach (DataRow row in dt.Rows)
        {
            CRM_Customer r = new CRM_Customer()
            {
                CompanyID = id,
                CompanyName = row["CompanyName"].ToString(),
                CompanyAddress = row["CompanyAddress"].ToString(),
                CompanyPhone = row["CompanyPhone"].ToString(),
                OfficialWebsite = row["OfficialWebsite"].ToString(),
                ContactPerson = row["ContactPerson"].ToString(),
                CP_Phone = row["CP_Phone"].ToString(),
                CP_Email = row["CP_Email"].ToString(),
                CompanyScale = row["CompanyScale"].ToString(),
                CompanyCategory = row["CompanyCategory"].ToString()
            };
            rList.Add(r);
        }
        return rList;

    }


    public void Insert(CRM_Customer r)
    {
        DBHelper.RunTSQL(
            "insert into CRM_Customer values(@id,@name,@addr,@cphone,@web,@cp,@cpphone,@cpemail,@scale,@category)",
                new Dictionary<string, object>() {
                { "@id", r.CompanyID },
                { "@name", r.CompanyName },
                { "@addr", r.CompanyAddress },
                { "@cphone", r.CompanyPhone },
                { "@web", r.OfficialWebsite},
                { "@cp", r.ContactPerson },
                { "@cpphone", r.CP_Phone },
                { "@cpemail", r.CP_Email },
                { "@scale", r.CompanyScale },
                { "@category", r.CompanyCategory }
                });
    }
    public void Update(CRM_Customer r)
    {
        DBHelper.RunTSQL(
            "update CRM_Customer  set CompanyName=@name,CompanyAddress=@addr,CompanyPhone=@cphone,OfficialWebsite=@web,ContactPerson=@cp,CP_Phone=@cpphone,CP_Email=@cpemail,CompanyScale=@scale,CompanyCategory=@category  where CompanyID=@id",
            new Dictionary<string, object>() {
                { "@id", r.CompanyID },
                { "@name", r.CompanyName },
                { "@addr", r.CompanyAddress },
                { "@cphone", r.CompanyPhone },
                { "@web", r.OfficialWebsite},
                { "@cp", r.ContactPerson },
                { "@cpphone", r.CP_Phone},
                { "@cpemail", r.CP_Email },
                { "@scale", r.CompanyScale },
                { "@category", r.CompanyCategory }
                });
    }
    public void Delete(int ID)
    {
        DBHelper.RunTSQL("delete CRM_Customer where CompanyID=@id",
            new Dictionary<string, object> {
                { "@id" , ID }
            });
    }
}