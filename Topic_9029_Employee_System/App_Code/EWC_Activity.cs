using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EWC_Activity
/// </summary>
public class EWC_Activity
{
    //預設建構式
    public EWC_Activity() { }

    //自訂建構式
    //public EWC_Activity
    //    (
    //    string activityID,
    //    string title,
    //    string startDate,
    //    string endDate,
    //    string startTime,
    //    string endTime,
    //    string activeDate,
    //    string activityDescription,
    //    string activitySchedule,
    //    string charge,
    //    string note
    //    )
    //{
    //    ActivityID = activityID;
    //    Title = title;
    //    StartDate = startDate;
    //    EndDate = endDate;
    //    StartTime = startTime;
    //    EndTime = endTime;
    //    ActiveDate = activeDate;
    //    ActivityDescription = activityDescription;
    //    ActivitySchedule = activitySchedule;
    //    Charge = charge;
    //    Note = note;
    //}
    

    public string ActivityID { get; set; }
    public string Type { get; set; }
    public string Title { get; set; }
    public string Photo { get; set; }
    public string ActivityDescription { get; set; }
    public string ActiveDate { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public string StartTime { get; set; }
    public string EndTime { get; set; }
    public string Location { get; set; }
    public string ActivitySchedule { get; set; }
    public string AllowSignUp { get; set; }
    public string StartSignUpDate { get; set; }
    public string EndSignUpDate { get; set; }
    public string CompanyAmount { get; set; }
    public string Charge { get; set; }
    public string Bus { get; set; }
    public string Note { get; set; }
}

public class EWC_ActivityUtility
{

    //查詢所有活動
    public List<EWC_Activity> GetActivity()
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select * from EWC_Activity ORDER BY StartDate DESC", null); //呼叫DBHelper的GetDataTable方法,查詢全部資料條件參數給null即可

        List<EWC_Activity> aList = new List<EWC_Activity>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            EWC_Activity a = new EWC_Activity()
            { //dt.Rows是一個陣列
                ActivityID = row["ActivityID"].ToString(), //將欄位值(object)轉成EWC_Activity型別
                Type = row["Type"].ToString(),
                Title = row["Title"].ToString(),
                Photo = row["Photo"].ToString(),
                ActivityDescription = row["ActivityDescription"].ToString(),
                ActiveDate = row["ActiveDate"].ToString(),
                StartDate = row["StartDate"].ToString(),
                EndDate = row["EndDate"].ToString(),
                StartTime = row["StartTime"].ToString(),
                EndTime = row["EndTime"].ToString(),
                Location = row["Location"].ToString(),
                ActivitySchedule = row["ActivitySchedule"].ToString(),
                AllowSignUp = row["AllowSignUp"].ToString(),
                StartSignUpDate = row["StartSignUpDate"].ToString(),
                EndSignUpDate = row["EndSignUpDate"].ToString(),
                CompanyAmount = row["CompanyAmount"].ToString(),
                Charge = row["Charge"].ToString(),
                Bus = row["Bus"].ToString(),
                Note = row["Note"].ToString()
            };



            aList.Add(a);
        }

        return aList;
    }

    //查詢單一活動
    public List<EWC_Activity> GetActivity(string ID)
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select * from EWC_Activity where ActivityID=@atvid",
            new Dictionary<string, object> {
                { "@atvid" , ID }
            }); //呼叫DBHelper的GetDataTable方法,查詢條件參數給活動ID

        List<EWC_Activity> aList = new List<EWC_Activity>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            EWC_Activity a = new EWC_Activity()
            { //dt.Rows是一個陣列
                ActivityID = row["ActivityID"].ToString(), //將欄位值(object)轉成EWC_Activity型別
                Type = row["Type"].ToString(),
                Title = row["Title"].ToString(),
                Photo = row["Photo"].ToString(),
                ActivityDescription = row["ActivityDescription"].ToString(),
                ActiveDate = row["ActiveDate"].ToString(),
                StartDate = row["StartDate"].ToString(),
                EndDate = row["EndDate"].ToString(),
                StartTime = row["StartTime"].ToString(),
                EndTime = row["EndTime"].ToString(),
                Location = row["Location"].ToString(),
                ActivitySchedule = row["ActivitySchedule"].ToString(),
                AllowSignUp = row["AllowSignUp"].ToString(),
                StartSignUpDate = row["StartSignUpDate"].ToString(),
                EndSignUpDate = row["EndSignUpDate"].ToString(),
                CompanyAmount = row["CompanyAmount"].ToString(),
                Charge = row["Charge"].ToString(),
                Bus = row["Bus"].ToString(),
                Note = row["Note"].ToString()
            };

            aList.Add(a);
        }

        return aList;
    }

    //查詢單一活動
    public EWC_Activity GetActivity2(string ID)
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select * from EWC_Activity where ActivityID=@atvid",
            new Dictionary<string, object> {
                { "@atvid" , ID }
            }); //呼叫DBHelper的GetDataTable方法,查詢條件參數給活動ID

        EWC_Activity atv = new EWC_Activity(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            atv = new EWC_Activity()
            { //dt.Rows是一個陣列
                ActivityID = row["ActivityID"].ToString(), //將欄位值(object)轉成EWC_Activity型別
                Type = row["Type"].ToString(),
                Title = row["Title"].ToString(),
                Photo = row["Photo"].ToString(),
                ActivityDescription = row["ActivityDescription"].ToString(),
                ActiveDate = row["ActiveDate"].ToString(),
                StartDate = row["StartDate"].ToString(),
                EndDate = row["EndDate"].ToString(),
                StartTime = row["StartTime"].ToString(),
                EndTime = row["EndTime"].ToString(),
                Location = row["Location"].ToString(),
                ActivitySchedule = row["ActivitySchedule"].ToString(),
                AllowSignUp = row["AllowSignUp"].ToString(),
                StartSignUpDate = row["StartSignUpDate"].ToString(),
                EndSignUpDate = row["EndSignUpDate"].ToString(),
                CompanyAmount = row["CompanyAmount"].ToString(),
                Charge = row["Charge"].ToString(),
                Bus = row["Bus"].ToString(),
                Note = row["Note"].ToString()
            };

            //aList.Add(a);
        }

        return atv;
    }


    public void Insert(EWC_Activity a)
    {
        EWC_DBHelper.RunTSQL("insert into EWC_Activity values(@id ,@type, @title, @photo, @desc , @ad , @sd , @ed , @st , @et , @locat , @sche , @as , @ssd , @esd , @ca , @charge , @bus , @note)",
            new Dictionary<string, object> {
                { "@id" , a.ActivityID } ,
                { "@type" , a.Type } ,
                { "@title" , a.Title },
                { "@photo" , a.Photo },
                { "@desc" , a.ActivityDescription } ,
                { "@ad" , a.ActiveDate } ,
                { "@sd" , a.StartDate } ,
                { "@ed" , a.EndDate },
                { "@st" , a.StartTime } ,
                { "@et" , a.EndTime },
                { "@locat" , a.Location },
                { "@sche" , a.ActivitySchedule },
                { "@as" , a.AllowSignUp },
                { "@ssd" , a.StartSignUpDate },
                { "@esd" , a.EndSignUpDate },
                { "@ca" , a.CompanyAmount },
                { "@charge" , a.Charge } ,
                { "@bus" , a.Bus } ,
                { "@note" , a.Note }

            });
    }

    //    if (a.note == "")
    //	{
    //        DBNull.Value
    //}else
    //a.note
    public void Update(EWC_Activity a)
    {
        EWC_DBHelper.RunTSQL("update EWC_Activity set Type=@type, Title=@title, Photo=@photo, ActivityDescription=@desc , ActiveDate=@ad , StartDate=@sd , EndDate=@ed , StartTime=@st , EndTime=@et , Location=@locat , ActivitySchedule=@sche , AllowSignUp=@as , StartSignUpDate=@ssd , EndSignUpDate=@esd , CompanyAmount=@ca , Charge=@charge , Bus=@bus , Note=@note where ActivityID=@id",
            new Dictionary<string, object> {
                { "@id" , a.ActivityID } ,
                { "@type" , a.Type } ,
                { "@title" , a.Title },
                { "@photo" , a.Photo },
                { "@desc" , a.ActivityDescription } ,
                { "@ad" , a.ActiveDate } ,
                { "@sd" , a.StartDate } ,
                { "@ed" , a.EndDate },
                { "@st" , a.StartTime } ,
                { "@et" , a.EndTime },
                { "@locat" , a.Location },
                { "@sche" , a.ActivitySchedule },
                { "@as" , a.AllowSignUp },
                { "@ssd" , a.StartSignUpDate },
                { "@esd" , a.EndSignUpDate },
                { "@ca" , a.CompanyAmount },
                { "@charge" , a.Charge } ,
                { "@bus" , a.Bus } ,
                { "@note" , a.Note }
            });
    }
    public void Delete(string ID)
    {
        EWC_DBHelper.RunTSQL("delete EWC_Activity where ActivityID=@id",
            new Dictionary<string, object> {
                { "@id" , ID }
            });
    }
}