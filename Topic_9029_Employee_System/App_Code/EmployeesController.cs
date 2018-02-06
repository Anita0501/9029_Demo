using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class EmployeesController : ApiController
{
    // GET api/Employees
    public IEnumerable<Employee> Get()
    {
        BusinessLogic bl = new BusinessLogic();
        return bl.GetEmployeeList();
    }

    //取得部門
    [Route("api/Department")]
    public IEnumerable<Department> GetDepartment()
    {
        BusinessLogic bl = new BusinessLogic();
        return bl.GetDepartmentData();
    }

    //取得角色
    [Route("api/Role")]
    public IEnumerable<Role> GetRole()
    {
        BusinessLogic bl = new BusinessLogic();
        return bl.GetRoleData();
    }

    //取得權限(依角色編號)
    [Route("api/Permissions/{role}")]
    public IEnumerable<Permissions> GetPermissions(int role)
    {
        BusinessLogic bl = new BusinessLogic();
        List<Permissions> list = (bl.GetPermissionsData()).Where(p => p.RoleId == role).ToList();
        return list;
    }

    //取得權限(依員工編號)
    [Route("api/PermissionsByEmployeeId/{employeeId}")]
    public IEnumerable<EmployeePermissionDetail> GetPermissionsByEmployeeId(string employeeId)
    {
        BusinessLogic bl = new BusinessLogic();
        //準備回傳的LIST
        List<EmployeePermissionDetail> employeePermissionDetailList = new List<EmployeePermissionDetail>();
        //取得該員工的權限清單
        List<EmployeePermissions> list = bl.GetEmployeePermissionList().Where(e => e.EmployeeId == employeeId && e.Enable == true).ToList();
        //取得網頁的資訊
        List<Sub> subList = bl.GetSub().ToList();
        foreach (var item in list)
        {
            Sub tmpSub = subList.Single(s => s.SiteId == item.SiteId);
            employeePermissionDetailList.Add(new EmployeePermissionDetail()
            {
                EmployeeId = employeeId,
                SiteId = tmpSub.SiteId,
                SiteName = tmpSub.SiteName,
                MainMenuId = tmpSub.MainId,
                Url = tmpSub.Url
            });
        }
        return employeePermissionDetailList;
    }

    //取得權限
    [Route("api/Permissions")]
    public IEnumerable<Permissions> GetPermissions()
    {
        BusinessLogic bl = new BusinessLogic();
        return bl.GetPermissionsData();
    }

    //取得登入的使用者 不work
    [Route("api/LoginUser")]
    public Employee GetLoginUser()
    {
        Employee employee = Employee.LoginUser();
        return Employee.LoginUser();
    }

    //取得角色在各網頁的權限
    [Route("api/RolePermissionsWithSite")]
    public IEnumerable<Sub> GetRolePermissionsWithSite(int roleId)
    {
        //回傳的list
        List<Sub> list = new List<Sub>();
        //取得角色擁有權限的網頁編號
        BusinessLogic businessLogic = new BusinessLogic();
        List<int> siteIdList = (businessLogic.GetPermissionsData()).Where(p => p.RoleId == roleId && p.Enable == true).Select(a => a.SiteId).ToList();
        List<Sub> allSite = businessLogic.GetSub();
        foreach (var item in siteIdList)
        {
            Sub tmpSub = allSite.Single(s => s.SiteId == item);
            list.Add(tmpSub);
        }
        return list;
    }


    // GET api/<controller>/5
    public string Get(int id)
    {
        return "value";
    }

    // POST api/<controller>
    public void Post([FromBody]string value)
    {
    }

    // PUT api/<controller>/5
    public void Put(int id, [FromBody]string value)
    {
    }

    // DELETE api/<controller>/5
    public void Delete(int id)
    {
    }
}
