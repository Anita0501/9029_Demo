using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BusinessLogic
/// </summary>
public class BusinessLogic
{
    public List<Department> GetDepartmentData()
    {
        List<Department> departmentList = new List<Department>();
        DatabaseTier dt = new DatabaseTier();
        DataTable dataTable = dt.GetDepartmentDataFromDatabase();
        foreach (DataRow item in dataTable.Rows)
        {
            departmentList.Add(new Department((int)item[0], item[1].ToString()));
        }
        return departmentList;
    }

    public List<Permissions> GetPermissionsData()
    {
        List<Permissions> list = new List<Permissions>();
        DatabaseTier dt = new DatabaseTier();
        DataTable dataTable = dt.GetPermissionsDataFromDatabase();
        foreach (DataRow item in dataTable.Rows)
        {
            list.Add(new Permissions((int)item[0], (int)item[1], (bool)item[2]));
        }
        return list;
    }

    public List<Role> GetRoleData()
    {
        List<Role> list = new List<Role>();
        DatabaseTier dt = new DatabaseTier();
        DataTable dataTable = dt.GetRoleDataFromDatabase();
        foreach (DataRow item in dataTable.Rows)
        {
            list.Add(new Role((int)item[0], item[1].ToString()));
        }
        return list;
    }

    public List<Sub> GetSub()
    {
        List<Sub> list = new List<Sub>();
        DatabaseTier dt = new DatabaseTier();
        DataTable dataTable = dt.GetSubFromDatabase();
        foreach (DataRow item in dataTable.Rows)
        {
            list.Add(new Sub((int)item[0], (int)item[1], item[2].ToString(), item[3].ToString()));
        }
        return list;
    }

    //employees
    public Employee CreateEmpInfo(List<string> tmpList, byte[] image)
    {
        Employee emp = new Employee()
        {
            EmployeeID = tmpList[0],
            EmployeeName = tmpList[1],
            DepatmentID = int.Parse(tmpList[2]),
            JobTitle = tmpList[3],
            RoleID = int.Parse(tmpList[4]),
            DutyDate = tmpList[5],
            Birthday = tmpList[6],
            EXT = tmpList[7],
            Cellphone = tmpList[8],
            Address = tmpList[9],
            Email = tmpList[10],
            Password = tmpList[11],
            StartDate = tmpList[12],
            EndDate = tmpList[13],
            ImageBytes = image
        };
        return emp;
    }
    public List<Employee> GetEmployeeList()
    {
        DatabaseTier dt = new DatabaseTier();
        DataTable dataTable = dt.GetEmployeesFromDatabase();
        List<Employee> empList = new List<Employee>();
        foreach (DataRow item in dataTable.Rows)
        {
            empList.Add(new Employee(
                item[0].ToString(), item[1].ToString(), item[2].ToString(), item[3].ToString(), (int)item[4], (int)item[5],
                DateTime.Parse(item[6].ToString()).ToShortDateString(), DateTime.Parse(item[7].ToString()).ToShortDateString(),
                item[8].ToString(), item[9].ToString(), item[10].ToString(), item[11].ToString(),
                (byte[])item[12], DateTime.Parse(item[13].ToString()).ToShortDateString(), DateTime.Parse(item[14].ToString()).ToShortDateString()));
        }
        return empList;
    }

    //新增employeePermission的物件
    public void InsertEmployeePermission(EmployeePermissions empPermission)
    {
        DatabaseTier dt = new DatabaseTier();
        dt.InsertEmployeePermission(empPermission);
    }
    //取得employeePermission的物件LIST
    public List<EmployeePermissions> GetEmployeePermissionList()
    {
        DatabaseTier dt = new DatabaseTier();
        DataTable dataTable = dt.GetEmployeePermission();
        List<EmployeePermissions> empPermissionList = new List<EmployeePermissions>();
        foreach (DataRow item in dataTable.Rows)
        {
            empPermissionList.Add(new EmployeePermissions(item[0].ToString(), (int)item[1], (bool)item[2]));

        }
        return empPermissionList;
    }

    public void InsertEmployee(Employee emp)
    {
        DatabaseTier dt = new DatabaseTier();
        dt.InsertEmployee(emp);
    }
    public void UpdateEmployee(Employee emp)
    {
        DatabaseTier dt = new DatabaseTier();
        dt.UpdateEmployee(emp);
    }
    public bool IsEmployeeLoginSuccess(string empId, string password, out Employee empInfo)
    {
        BusinessLogic businessLogic = new BusinessLogic();
        List<Employee> empList = businessLogic.GetEmployeeList();
        Employee result = empList.SingleOrDefault(e => e.EmployeeID == empId && e.Password == password);
        empInfo = result;
        if (result != null)
            return true;

        return false;
    }
}