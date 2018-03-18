using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EWC_Activity
/// </summary>
public class EWC_SignUpEmployee
{
    //預設建構式
    public EWC_SignUpEmployee() { }

    public string ActivityID { get; set; }
    public string EmployeeID { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string Ext { get; set; }
}

public class EWC_SignUpEmployeeUtility
{

    //查詢所有活動
    public List<EWC_SignUpEmployee> GetSignUpEmployee()
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select a.*,b.Email,b.ext from EWC_ActivitySignUpDetail as a join AMS_Employee as b on a.EmployeeID = b.EmployeeID", null); //呼叫DBHelper的GetDataTable方法,查詢全部資料條件參數給null即可

        List<EWC_SignUpEmployee> sList = new List<EWC_SignUpEmployee>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            EWC_SignUpEmployee s = new EWC_SignUpEmployee()
            { //dt.Rows是一個陣列
                ActivityID = row["ActivityID"].ToString(),//將欄位值(object)轉成EWC_SignUp型別
                EmployeeID = row["EmployeeID"].ToString(),
                Name = row["Name"].ToString(),
                Email = row["Email"].ToString(),
                Ext = row["Ext"].ToString(),
            };

            sList.Add(s);
        }

        return sList;
    }

}


public class EWC_SignUpAtv
{
    //預設建構式
    public EWC_SignUpAtv() { }

    public string ActivityID { get; set; }
    public string EmployeeID { get; set; }
    public string Title { get; set; }
    public string Type { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public string StartTime { get; set; }
    public string EndTime { get; set; }
}

public class EWC_SignUpAtvUtility
{
    //查詢所有活動
    public List<EWC_SignUpAtv> GetSignUpAtv(string empid)
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select a.ActivityID,a.EmployeeID,b.Title,b.Type,b.StartDate,b.EndDate,b.StartTime,b.EndTime from EWC_ActivitySignUpDetail as a join EWC_Activity as b on a.ActivityID = b.ActivityID where EmployeeID = @empid", 
            new Dictionary<string, object> {
                { "@empid" , empid }
            });  //呼叫DBHelper的GetDataTable方法,查詢全部資料條件參數給null即可

        List<EWC_SignUpAtv> sList = new List<EWC_SignUpAtv>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            EWC_SignUpAtv s = new EWC_SignUpAtv()
            { //dt.Rows是一個陣列
                ActivityID = row["ActivityID"].ToString(),//將欄位值(object)轉成EWC_SignUp型別
                EmployeeID = row["EmployeeID"].ToString(),
                Title = row["Title"].ToString(),
                Type = row["Type"].ToString(),
                StartDate = row["StartDate"].ToString(),
                EndDate = row["EndDate"].ToString(),
                StartTime = row["StartTime"].ToString(),
                EndTime = row["EndTime"].ToString(),
            };

            sList.Add(s);
        }

        return sList;
    }

}