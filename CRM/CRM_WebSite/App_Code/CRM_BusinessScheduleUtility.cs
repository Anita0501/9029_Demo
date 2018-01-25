using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CRM_BusinessScheduleUtility
/// </summary>
public class CRM_BusinessScheduleUtility
{
    public List<CRM_BusinessSchedule> GetSchedules()
    {
        DataTable dt = DBHelper.GetDataTable("select * from CRM_BusinessSchedule", null);

        List<CRM_BusinessSchedule> rList = new List<CRM_BusinessSchedule>();

        foreach (DataRow row in dt.Rows)
        {
            CRM_BusinessSchedule r = new CRM_BusinessSchedule()
            {
                TripID = Convert.ToInt32(row["TripID"]),
                CompanyID = Convert.ToInt32(row["CompanyID"]),
                CompanyName = row["CompanyName"].ToString(),
                EmployeeID = Convert.ToInt32(row["EmployeeID"]),
                EmployeeName = row["EmployeeName"].ToString(),
                TripTheme = row["TripTheme"].ToString(),
                TargetDate = Convert.ToDateTime(row["TargetDate"]),
                Memo = row["Memo"].ToString(),
            };
            rList.Add(r);
        }
        return rList;
    }

    public List<CRM_BusinessSchedule> GetSchedule(int id)
    {
        DataTable dt = DBHelper.GetDataTable("select * from CRM_BusinessSchedule where TripID=@id", new Dictionary<string, object>() {
                { "@id", id } });
        List<CRM_BusinessSchedule> rList = new List<CRM_BusinessSchedule>();

        foreach (DataRow row in dt.Rows)
        {
            CRM_BusinessSchedule r = new CRM_BusinessSchedule()
            {
                TripID = id,
                CompanyID = Convert.ToInt32(row["CompanyID"]),
                CompanyName = row["CompanyName"].ToString(),
                EmployeeID = Convert.ToInt32(row["EmployeeID"]),
                EmployeeName = row["EmployeeName"].ToString(),
                TripTheme = row["TripTheme"].ToString(),
                TargetDate = Convert.ToDateTime(row["TargetDate"]),
                Memo = row["Memo"].ToString(),
            };
            rList.Add(r);
        }
        return rList;
    }


    public void Insert(CRM_BusinessSchedule r)
    {
        DBHelper.RunTSQL(
            "insert into CRM_BusinessSchedule values(@id,@cpid,@cpname,@empid,@empname,@trip,@target,@memo)",
                new Dictionary<string, object>() {
                    { "@id", r.TripID },
                    { "@cpid", r.CompanyID },
                    { "@cpname", r.CompanyName },
                    { "@empid", r.EmployeeID },
                    { "@empname", r.EmployeeName},
                    { "@trip", r.TripTheme },
                    { "@target", r.TargetDate },
                    { "@memo", r.Memo }
                });
    }
    public void Update(CRM_BusinessSchedule r)
    {
        DBHelper.RunTSQL(
            "update CRM_BusinessSchedule  set CompanyID=@cpid,CompanyName=@cpname,EmployeeID=@empname,EmployeeName=@empname,TripTheme=@trip,TargetDate=@target,Memo=@memo  where TripID=@id",
            new Dictionary<string, object>() {
                    { "@id", r.TripID },
                    { "@cpid", r.CompanyID },
                    { "@cpname", r.CompanyName },
                    { "@empid", r.EmployeeID },
                    { "@empname", r.EmployeeName},
                    { "@trip", r.TripTheme },
                    { "@target", r.TargetDate },
                    { "@memo", r.Memo }
                });
    }
    public void Delete(int id)
    {
        DBHelper.RunTSQL("delete CRM_BusinessSchedule where TripID=@id",
            new Dictionary<string, object> {
                { "@id" , id }
            });
    }

}