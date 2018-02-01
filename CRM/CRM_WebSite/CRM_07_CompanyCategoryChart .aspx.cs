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
        DataTable dt = DBHelper.GetDataTable("select a.CompanyCategory ,b.Id  ,count(a.CompanyCategory) as 'Count' from CRM_Customer as a left join CRM_CompanyCategorys as b on a.CompanyCategory = b.CompanyCategory group by a.CompanyCategory, b.Id", null);

        var CompanyScaleAry = dt.AsEnumerable().Select(r => r["CompanyCategory"].ToString()).ToArray();
        var CountAry = dt.AsEnumerable().Select(r => r["Count"].ToString()).ToArray();
        CompanyCategoryHiddenField.Value = string.Join(",", CompanyScaleAry);
        CountHiddenField.Value = string.Join(",", CountAry);
    }
}