<%@ WebService Language="C#" Class="WebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using System.Linq;


[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    //拿活動清單
    [WebMethod]
    public List<EWC_Activity> GetActivityList()
    {
        List<EWC_Activity> aList = new List<EWC_Activity>();
        EWC_ActivityUtility au = new EWC_ActivityUtility();
        aList = au.GetActivity();
        return aList;
    }

    //拿單一活動清單
    [WebMethod]
    public EWC_Activity GetActivityList2(string id)
    {
        EWC_Activity atv = new EWC_Activity();
        EWC_ActivityUtility au = new EWC_ActivityUtility();
        atv = au.GetActivity2(id);
        return atv;
    }


    //刪除活動
    [WebMethod]
    public void DeleteActivity(string id)
    {
        EWC_Activity aActivity = new EWC_Activity();
        EWC_ActivityUtility au = new EWC_ActivityUtility();
        au.Delete(id);
    }

    //拿相簿清單
    [WebMethod]
    public List<EWC_Album> GetAlbumList()
    {
        List<EWC_Album> abList = new List<EWC_Album>();
        EWC_AlbumUtility abu = new EWC_AlbumUtility();
        abList = abu.GetAlbum();
        return abList;
    }

    //更新相簿+相片
    [WebMethod]
    public void UpdateAlbum(string ap)
    {
        string[] apsplit = ap.Split(',');

        string abdata = apsplit[0] + "," + apsplit[1] + "," + apsplit[2];

        //更新相簿
        EWC_AlbumUtility au = new EWC_AlbumUtility();
        au.Update(abdata);


        List<string> photodata = new List<string>();

        for (int i = 3; i < apsplit.Length; i += 2)
        {
            photodata.Add(apsplit[i] + "," + apsplit[i + 1]);
        }

        //更新相片
        EWC_PhotoUtility pu = new EWC_PhotoUtility();

        //photodat數量等於要更新的相片數量, List<string>裡的都是photoID,photoDesc
        foreach (var item in photodata)
        {
            pu.Update(item);
        }


        //string albumUpdateDate =

        //List < EWC_Album > abList = new List<EWC_Album>();
        //EWC_AlbumUtility abu = new EWC_AlbumUtility();
        //abList = abu.Update();
        //return abList;
    }

    //刪除相簿
    [WebMethod]
    public void DeleteAlbum(string id)
    {
        EWC_Album aAlbum = new EWC_Album();
        EWC_AlbumUtility abu = new EWC_AlbumUtility();
        abu.Delete(id);
    }

    //拿相片清單
    [WebMethod]
    public List<EWC_Photo> GetPhotoList(string id)
    {
        List<EWC_Photo> pList = new List<EWC_Photo>();
        EWC_PhotoUtility pu = new EWC_PhotoUtility();
        pList = pu.GetPhoto(id);
        return pList;
    }

    //刪除相片
    [WebMethod]
    public void DeletePhoto(string id)
    {
        EWC_Photo aPhoto = new EWC_Photo();
        EWC_PhotoUtility pu = new EWC_PhotoUtility();
        pu.Delete(id);
    }

    //寫入報名資料
    [WebMethod]
    public void InsertSignUp(string s) //ajax呼叫時帶一個字串內容包含(atvID,employeeID,employeeName)
    {
        string[] signUpSplit = s.Split(',');

        string signUpID = signUpSplit[0] + "_" + DateTime.Now.Millisecond.ToString();

        EWC_SignUp aSignUp = new EWC_SignUp()
        {
            ActivitySignUpDetailID = signUpID,
            ActivityID = signUpSplit[0],
            EmployeeID = signUpSplit[1],
            Name = signUpSplit[2],
            IsEmployee = "0",
            TourBus = "0"
        };

        EWC_SignUpUtility su = new EWC_SignUpUtility();
        su.Insert(aSignUp);
    }

    //拿所有報名資料
    [WebMethod]
    public List<EWC_SignUp> GetSignUpList() //ajax呼叫時帶一個字串內容包含(atvID,employeeID,employeeName)
    {
        List<EWC_SignUp> sList = new List<EWC_SignUp>();
        EWC_SignUpUtility su = new EWC_SignUpUtility();
        sList = su.GetSignUp();
        return sList;

    }

    //拿user signup list with employee detail
    [WebMethod]
    public List<EWC_SignUpEmployee> GetSignedEmpList()
    {
        List<EWC_SignUpEmployee> sList = new List<EWC_SignUpEmployee>();
        EWC_SignUpEmployeeUtility su = new EWC_SignUpEmployeeUtility();
        sList = su.GetSignUpEmployee();
        return sList;
    }

    //拿login user signup list with activity detail
    [WebMethod]
    public List<EWC_SignUpAtv> GetSignedAtvList(string loginID)
    {
        List<EWC_SignUpAtv> sList = new List<EWC_SignUpAtv>();
        EWC_SignUpAtvUtility su = new EWC_SignUpAtvUtility();
        sList = su.GetSignUpAtv(loginID);
        return sList;
    }

    ////拿login user signup list with activity detail
    //[WebMethod]
    //public List<EWC_SignUpAtv> GetSignedAtvList()
    //{
    //    List<EWC_SignUpAtv> sList = new List<EWC_SignUpAtv>();
    //    EWC_SignUpAtvUtility su = new EWC_SignUpAtvUtility();
    //    sList = su.GetSignUpAtv();
    //    return sList;
    //}

}