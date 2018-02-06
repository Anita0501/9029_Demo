using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PermissionWithEmployeeId
/// </summary>
public class EmployeePermissionDetail
{
    public string EmployeeId { get; set; }
    public int SiteId { get; set; }
    public string SiteName { get; set; }
    public int MainMenuId { get; set; }
    public string Url { get; set; }
}