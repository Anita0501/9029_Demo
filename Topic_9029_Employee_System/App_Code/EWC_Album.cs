using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EWC_Album
/// </summary>
public class EWC_Album
{
    public EWC_Album(){ }

    public string AlbumID { get; set; }
    public string ActivityID { get; set; }
    public string AlbumTitle { get; set; }
    public string AlbumDesc { get; set; }
    public string DefaultPhoto { get; set; }
}

public class EWC_AlbumUtility
{
    public List<EWC_Album> GetAlbum()
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select a.*, b.StartDate from EWC_Album as a join EWC_Activity as b on a.ActivityID = b.ActivityID order by StartDate DESC ", null); //呼叫DBHelper的GetDataTable方法,查詢全部資料條件參數給null即可

        List<EWC_Album> aList = new List<EWC_Album>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            EWC_Album a = new EWC_Album()
            { //dt.Rows是一個陣列
                AlbumID = row["AlbumID"].ToString(), //將欄位值(object)轉成EWC_Activity型別
                ActivityID = row["ActivityID"].ToString(),
                AlbumTitle = row["AlbumTitle"].ToString(),
                AlbumDesc = row["AlbumDesc"].ToString(),
                DefaultPhoto = row["DefaultPhoto"].ToString(),
            };
            aList.Add(a);
        }
        return aList;
    }

    public void Insert(EWC_Album a)
    {
        EWC_DBHelper.RunTSQL("insert into EWC_Album values(@abid ,@atid, @abtitle, @abdesc, @df)",
            new Dictionary<string, object> {
                { "@abid" , a.AlbumID } ,
                { "@atid" , a.ActivityID } ,
                { "@abtitle" , a.AlbumTitle },
                { "@abdesc" , a.AlbumDesc },
                { "@df" , a.DefaultPhoto }
            });
    }

    public void Update(string a)
    {
        string [] ary = a.Split(',');
        
        EWC_DBHelper.RunTSQL("update EWC_Album set AlbumTitle=@abt,AlbumDesc=@abdesc where AlbumID=@abid",
            new Dictionary<string, object> {
                { "@abid" , ary[0]} ,
                { "@abt" , ary[1]} ,
                { "@abdesc" , ary[2] }
            });
    }

    public void UpdateDefaultPhoto(string AlbumID, string DefaultPhoto )
    {
        EWC_DBHelper.RunTSQL("update EWC_Album set DefaultPhoto=@df where AlbumID=@abid",
            new Dictionary<string, object> {
                { "@abid" , AlbumID } ,
                { "@df" , DefaultPhoto }
            });
    }


    public void Delete(string ID)
    {
        EWC_DBHelper.RunTSQL("delete EWC_Album where AlbumID=@abid",
            new Dictionary<string, object> {
                { "@abid" , ID }
            });
    }
}