using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CRM_06_CompanyChart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = DBHelper.GetDataTable("select a.CompanyScale ,b.Id  ,count(a.CompanyScale) as 'Count' from CRM_Customer as a left join CRM_CompanyScales as b on a.CompanyScale = b.CompanyScale group by a.CompanyScale, b.Id", null);

        var CompanyScaleAry = dt.AsEnumerable().Select(r => r["CompanyScale"].ToString()).ToArray();
        var CountAry = dt.AsEnumerable().Select(r => r["Count"].ToString()).ToArray();
        CompanyScaleHiddenField.Value = string.Join(",", CompanyScaleAry);
        CountHiddenField.Value = string.Join(",", CountAry);
    }
}