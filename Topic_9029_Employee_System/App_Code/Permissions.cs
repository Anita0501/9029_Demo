using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Permissions
/// </summary>
public class Permissions
{
    public int RoleId { get; set; }
    public int SiteId { get; set; }
    public bool Enable { get; set; }
    
    public Permissions(int role, int site, bool enable)
    {
        RoleId = role;
        SiteId = site;
        Enable = enable;
    }
}