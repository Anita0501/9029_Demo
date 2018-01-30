using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CRM_BusinessSchedule
/// </summary>
public class CRM_BusinessSchedule
{
    //public int TripID { get; set; }
    public int CompanyID { get; set; }
    public string CompanyName { get; set; }
    public string EmployeeID { get; set; }
    public string EmployeeName { get; set; }
    public string TripTheme { get; set; }
    public string TargetDate { get; set; }
    public string Memo { get; set; }
}
//public class CRM_BusinessSchedule_Visit : CRM_BusinessSchedule
//{
//    public DateTime VisitDate { get; set; }
//    public string Itinerary { get; set; }

//    //List<CRM_BusinessSchedule_Visit> fff = new List<CRM_BusinessSchedule_Visit>
//    //    {
//    //         new CRM_BusinessSchedule_Visit{f}
//    //    };
//}



