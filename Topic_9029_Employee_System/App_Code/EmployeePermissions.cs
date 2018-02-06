using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// 每位員工與各網頁的權限關係
/// </summary>
public class EmployeePermissions
{
    public string EmployeeId { get; set; }
    public int SiteId { get; set; }
    public bool Enable { get; set; }

    public EmployeePermissions(string empId, int siteId, bool enable)
    {
        EmployeeId = empId;
        SiteId = siteId;
        Enable = enable;
    }
}