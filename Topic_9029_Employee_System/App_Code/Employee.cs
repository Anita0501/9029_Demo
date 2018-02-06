using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    public string EmployeeID { get; set; }
    public string Password { get; set; }
    public string EmployeeName { get; set; }
    public string JobTitle { get; set; }
    public int RoleID { get; set; }
    public int DepatmentID { get; set; }
    public string DutyDate { get; set; }
    public string Birthday { get; set; }
    public string EXT { get; set; }
    public string Email { get; set; }
    public string Cellphone { get; set; }
    public string Address { get; set; }
    public byte[] ImageBytes { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }


    public Employee(string employeeID, string password, string employeeName, string jobTitle, int roleID,
        int depatmentID, string dutyDate, string birthday, string ext, string email,
        string cellphone, string address, byte[] image, string startDate, string endDate)
    {
        EmployeeID = employeeID;
        Password = password;
        EmployeeName = employeeName;
        JobTitle = jobTitle;
        RoleID = roleID;
        DepatmentID = depatmentID;
        DutyDate = dutyDate;
        Birthday = birthday;
        EXT = ext;
        Email = email;
        Cellphone = cellphone;
        Address = address;
        ImageBytes = image;
        StartDate = startDate;
        EndDate = endDate;
    }
    public Employee() { }

    public static Employee LoginUser()
    {
        if (HttpContext.Current.Session["EmployeeInfo"] == null)
        {
            HttpContext.Current.Response.Redirect("~/" + ConfigurationManager.AppSettings["LoginPage"]);
        }
        return HttpContext.Current.Session["EmployeeInfo"] as Employee;
    }
}