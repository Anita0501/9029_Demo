using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Photo
/// </summary>
public class EWC_Photo
{
    public EWC_Photo(){ }

    public string PhotoID { get; set; }
    public string AlbumID { get; set; }
    public string FilePath { get; set; }
    public string PhotoDesc { get; set; }
}

public class EWC_PhotoUtility
{
    //public List<EWC_Photo> GetPhoto()
    //{
    //    DataTable dt = EWC_DBHelper.GetDataTable("select * from EWC_Photo ORDER BY AlbumID DESC", null); //呼叫DBHelper的GetDataTable方法,查詢全部資料條件參數給null即可

    //    List<EWC_Photo> aList = new List<EWC_Photo>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

    //    foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
    //    {
    //        EWC_Photo p = new EWC_Photo()
    //        { //dt.Rows是一個陣列
    //            PhotoID = row["PhotoID"].ToString(), //將欄位值(object)轉成EWC_Activity型別
    //            AlbumID = row["AlbumID"].ToString(),
    //            FilePath = row["FilePath"].ToString(),
    //            PhotoDesc = row["PhotoDesc"].ToString(),
    //        };
    //        aList.Add(p);
    //    }
    //    return aList;
    //}

    public List<EWC_Photo> GetPhoto(string ID)
    {
        DataTable dt = EWC_DBHelper.GetDataTable("select * from EWC_Photo where AlbumID=@abid",
            new Dictionary<string, object> {
                { "@abid" , ID }
            }); //呼叫DBHelper的GetDataTable方法,查詢條件參數給相簿ID

        List<EWC_Photo> aList = new List<EWC_Photo>(); //建立EWC_Activity型別的List,之後接GetDataTable回傳的EWC_Activity List

        foreach (DataRow row in dt.Rows) //dt取回是object,要轉型成EWC_Activity型別
        {
            EWC_Photo p = new EWC_Photo()
            { //dt.Rows是一個陣列
                PhotoID = row["PhotoID"].ToString(), //將欄位值(object)轉成EWC_Activity型別
                AlbumID = row["AlbumID"].ToString(),
                FilePath = row["FilePath"].ToString(),
                PhotoDesc = row["PhotoDesc"].ToString(),
            };
            aList.Add(p);
        }
        return aList;
    }

    public void Insert(EWC_Photo p)
    {
        EWC_DBHelper.RunTSQL("insert into EWC_Photo values(@pid ,@abid, @fp, @pd)",
            new Dictionary<string, object> {
                { "@pid" , p.PhotoID } ,
                { "@abid" , p.AlbumID } ,
                { "@fp" , p.FilePath },
                { "@pd" , p.PhotoDesc },
            });
    }

    public void Update(EWC_Photo p)
    {
        EWC_DBHelper.RunTSQL("update EWC_Photo set PhotoDesc=@pd where PhotoID=@pid",
            new Dictionary<string, object> {
                { "@pid" , p.PhotoID } ,
                { "@pd" , p.PhotoDesc }
            });
    }

    //更新相片資訊
    public void Update(string p)
    {
        string[] ary = p.Split(',');

        EWC_DBHelper.RunTSQL("update EWC_Photo set PhotoDesc=@pd where PhotoID=@pid",
            new Dictionary<string, object> {
                { "@pid" , ary[0] } ,
                { "@pd" , ary[1] }
            });
    }

    public void Delete(string ID)
    {
        EWC_DBHelper.RunTSQL("delete EWC_Photo where PhotoID=@pid",
            new Dictionary<string, object> {
                { "@pid" , ID }
            });
    }
}