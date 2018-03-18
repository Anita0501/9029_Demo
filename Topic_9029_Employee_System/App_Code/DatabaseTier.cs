using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class DatabaseTier
{
    public DataTable GetDepartmentDataFromDatabase()
    {
        string str = "select departmentId, departmentName from AMS_department";
        return SQLHelperQuery(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString, str);
    }

    public DataTable GetPermissionsDataFromDatabase()
    {
        string cmd = "select RoleID, SiteId, Enable from AMS_Permissions";
        return SQLHelperQuery(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString, cmd);
    }

    //Role
    public DataTable GetRoleDataFromDatabase()
    {
        string str = "select RoleId, roleName from AMS_Role";
        return SQLHelperQuery(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString, str);
    }
    //sub
    public DataTable GetSubFromDatabase()
    {
        string str = "select SiteId,MainId, SiteName, url from AMS_SubMenu";
        return SQLHelperQuery(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString, str);
    }

    //Employee
    public DataTable GetEmployeesFromDatabase()
    {
        string str = "select EmployeeID,Password,Name,JobTitle,RoleID,departmentID," +
        "DutyDate,Birthday,EXT,Email,PhoneNumber,Address,Image," +
        "StartDate, EndDate from [AMS_Employee] ";
        return SQLHelperQuery(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString, str);
    }
    //新增員工資料到DB
    public void InsertEmployee(Employee emp)
    {
        string str = "insert into [AMS_Employee] values(@EmployeeID,@Password,@Name,@JobTitle,@RoleID,@departmentID,@DutyDate," +
            "@Birthday,@EXT,@Email,@PhoneNumber,@Address,@Image,@StartDate,@EndDate)";

        DatabaseTier dt = new DatabaseTier();
        dt.SQLHelperNonQuery(str, new Dictionary<string, object>() {
            { "@EmployeeID" , emp.EmployeeID },
            { "@Password", emp.Password } ,
            { "@Name", emp.EmployeeName },
            { "@JobTitle", emp.JobTitle},
            { "@RoleID", emp.RoleID},
            { "@departmentID", emp.DepatmentID},
            { "@DutyDate", emp.DutyDate},
            { "@Birthday", emp.Birthday},
            { "@EXT", emp.EXT},
            { "@Email", emp.Email},
            { "@PhoneNumber", emp.Cellphone},
            { "@Address", emp.Address},
            { "@Image", emp.ImageBytes},
            { "@StartDate", emp.StartDate},
            { "@EndDate", emp.EndDate }
        });
    }
    //修改員工資料到DB
    public void UpdateEmployee(Employee emp)
    {
        string str = "update [AMS_Employee] set Name=@Name,JobTitle=@JobTitle,RoleID=@RoleID,departmentID=@departmentID,DutyDate=@DutyDate," +
            "Birthday=@Birthday,EXT=@EXT,Email=@Email,PhoneNumber=@PhoneNumber,Address=@Address,Password=@Password," +
            "Image=@Image, StartDate=@StartDate,EndDate=@EndDate where EmployeeID=@EmployeeID;";
        DatabaseTier dt = new DatabaseTier();
        dt.SQLHelperNonQuery(str, new Dictionary<string, object>() {
            { "@Name", emp.EmployeeName },
            { "@JobTitle", emp.JobTitle},
            { "@RoleID", emp.RoleID},
            { "@departmentID", emp.DepatmentID},
            { "@DutyDate", emp.DutyDate},
            { "@Birthday", emp.Birthday},
            { "@EXT", emp.EXT},
            { "@Email", emp.Email},
            { "@PhoneNumber", emp.Cellphone},
            { "@Address", emp.Address},
            { "@EmployeeID", emp.EmployeeID },
            { "@Password", emp.Password },
            { "@Image",emp.ImageBytes },
            { "@StartDate", emp.StartDate},
            { "@EndDate", emp.EndDate}
        });
    }

    //取得員工的權限清單
    public DataTable GetEmployeePermission()
    {
        string str = "select EmployeeID, SiteId, Enable from AMS_EmployeePermission";
        return SQLHelperQuery(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString, str);
    }

    //新增員工個別權限至DB
    public void InsertEmployeePermission(EmployeePermissions employeePermission)
    {
        string str = "insert into [AMS_EmployeePermission] values(@EmployeeID,@SiteId,@Enable)";

        DatabaseTier dt = new DatabaseTier();
        dt.SQLHelperNonQuery(str, new Dictionary<string, object>() {
            { "@EmployeeID" , employeePermission.EmployeeId },
            { "@SiteId", employeePermission.SiteId } ,
            { "@Enable", employeePermission.Enable },
        });

    }

    //connect to sqlServer
    private void SQLHelperNonQuery(string cmdStr, Dictionary<string, object> data)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["employeesDatabase"].ConnectionString);

        SqlCommand cmd = new SqlCommand(cmdStr, cn);
        foreach (KeyValuePair<string, object> item in data)
        {
            cmd.Parameters.AddWithValue(item.Key, item.Value);
        }
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    private DataTable SQLHelperQuery(string cnStr, string cmdStr)
    {
        //SqlConnection cn = new SqlConnection(cnStr);

        SqlDataAdapter da = new SqlDataAdapter(cmdStr, cnStr);
        DataTable dataTable = new DataTable();
        da.Fill(dataTable);
        return dataTable;
    }
}