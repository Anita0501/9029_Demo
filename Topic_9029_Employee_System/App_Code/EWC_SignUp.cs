using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EWC_Activity
/// </summary>
public class EWC_SignUp
{
    //預設建構式
    public EWC_SignUp() { }

    public string ActivitySignUpDetailID { get; set; }
    public string ActivityID { get; set; }
    public string EmployeeID { get; set; }
    public string Name { get; set; }
    public string IsEmployee { get; set; }
    public string TourBus { get; set; }
}

public class EWC_SignUpUtility
{

    //查詢所有活動
    public List<EWC_SignUp> GetSignUp()
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select * from EWC_ActivitySignUpDetail ORDER BY ActivityID DESC", null); //呼叫DBHelper的GetDataTable方法,查詢全部資料條件參數給null即可

        List<EWC_SignUp> sList = new List<EWC_SignUp>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            EWC_SignUp s = new EWC_SignUp()
            { //dt.Rows是一個陣列
                ActivitySignUpDetailID = row["ActivitySignUpDetailID"].ToString(), //將欄位值(object)轉成EWC_SignUp型別
                ActivityID = row["ActivityID"].ToString(),
                EmployeeID = row["EmployeeID"].ToString(),
                Name = row["Name"].ToString(),
                IsEmployee = row["IsEmployee"].ToString(),
                TourBus = row["TourBus"].ToString(),
            };

            sList.Add(s);
        }

        return sList;
    }

    //查詢單一活動
    public List<EWC_SignUp> GetSignUp(string ID)
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select * from EWC_ActivitySignUpDetail where EmployeeID=@eid",
            new Dictionary<string, object> {
                { "@eid" , ID }
            }); //呼叫DBHelper的GetDataTable方法,查詢條件參數給活動ID

        List<EWC_SignUp> sList = new List<EWC_SignUp>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            EWC_SignUp s = new EWC_SignUp()
            { //dt.Rows是一個陣列
                ActivitySignUpDetailID = row["ActivitySignUpDetailID"].ToString(), //將欄位值(object)轉成EWC_SignUp型別
                ActivityID = row["ActivityID"].ToString(),
                EmployeeID = row["EmployeeID"].ToString(),
                Name = row["Name"].ToString(),
                IsEmployee = row["IsEmployee"].ToString(),
                TourBus = row["TourBus"].ToString(),
            };

            sList.Add(s);
        }

        return sList;
    }

    //查詢單一活動
    public EWC_SignUp GetSignUp2(string ID)
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select * from EWC_ActivitySignUpDetail where ActivityID=@atvid",
            new Dictionary<string, object> {
                { "@atvid" , ID }
            }); //呼叫DBHelper的GetDataTable方法,查詢條件參數給活動ID

        EWC_SignUp signUp = new EWC_SignUp(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            signUp = new EWC_SignUp()
            { //dt.Rows是一個陣列
                ActivitySignUpDetailID = row["ActivitySignUpDetailID"].ToString(), //將欄位值(object)轉成EWC_SignUp型別
                ActivityID = row["ActivityID"].ToString(),
                EmployeeID = row["EmployeeID"].ToString(),
                Name = row["Name"].ToString(),
                IsEmployee = row["IsEmployee"].ToString(),
                TourBus = row["TourBus"].ToString(),
            };

            //aList.Add(a);
        }

        return signUp;
    }


    public void Insert(EWC_SignUp s)
    {
        EWC_DBHelper.RunTSQL("insert into EWC_ActivitySignUpDetail values(@suid ,@aid, @eid, @name, @ise , @tb)",
            new Dictionary<string, object> {
                { "@suid" , s.ActivitySignUpDetailID } ,
                { "@aid" , s.ActivityID } ,
                { "@eid" , s.EmployeeID },
                { "@name" , s.Name },
                { "@ise" , s.IsEmployee } ,
                { "@tb" , s.TourBus } 
            });
    }

    //public void Update(EWC_SignUp s)
    //{
    //    EWC_DBHelper.RunTSQL("update EWC_ActivitySignUpDetail set Name=@name where ActivityID=@id",
    //        new Dictionary<string, object> {
    //            { "@id" , a.ActivityID } ,
    //            { "@name" , a.Name }
    //        });
    //}

    public void Delete(string ID)
    {
        EWC_DBHelper.RunTSQL("delete EWC_ActivitySignUpDetail where EmployeeID=@eid",
            new Dictionary<string, object> {
                { "@eid" , ID }
            });
    }
}