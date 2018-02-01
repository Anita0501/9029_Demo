using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class CRM_Customer
{
    public int CompanyID { get; set; }
    public string CompanyName { get; set; }
    public string CompanyAddress { get; set; }
    public string CompanyPhone { get; set; }
    public string OfficialWebsite { get; set; }
    public string ContactPerson { get; set; }
    public string CP_Phone { get; set; }
    public string CP_Email { get; set; }
    public string CompanyScale { get; set; }
    public string CompanyCategory { get; set; }
}

public class CompanyScales
{
    public string CompanyScale { get; set; }
    public string Count { get; set; }
}

//public class CompanyCategory
//{
//    public string Category0 = "請選擇產業類別";
//    public string Category1 = "軟體及網路相關業";
//    public string Category2 = "電信及通訊相關業";
//    public string Category3 = "電腦及消費性電子製造業";
//    public string Category4 = "光電及光學相關業";
//    public string Category5 = "電子零組件相關業";
//    public string Category6 = "半導體業";
//}
