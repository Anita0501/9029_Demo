using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CRM_BusinessSchedule
/// </summary>
public class CRM_BusinessSchedule
{
    public int TripID { get; set; }
    public int CompanyID { get; set; }
    public string CompanyName { get; set; }
    public int EmployeeID { get; set; }
    public string EmployeeName { get; set; }
    public string TripTheme { get; set; }
    public DateTime TargetDate { get; set; }
    public string Memo { get; set; }
}
public class CRM_BusinessSchedule_Visit
{
    public DateTime VisitDate { get; set; }
    public string Itinerary { get; set; }
}

