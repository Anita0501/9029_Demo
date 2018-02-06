using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Role
/// </summary>
public class Role
{
    public int RoleId { get; set; }
    public string RoleName { get; set; }
    public Role(int id, string name)
    {
        RoleId = id;
        RoleName = name;
    }
}