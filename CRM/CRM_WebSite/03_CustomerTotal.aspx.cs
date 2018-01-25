using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _03_Sel_Del_Customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DeleteBtn_Click(object sender, EventArgs e)
    {
        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        int id = Convert.ToInt32(DeleteTextBox.Text);
        ru.Delete(id);
    }
    protected void SelectBtn_Click(object sender, EventArgs e)
    {
        CRM_CustomerUtility ru = new CRM_CustomerUtility();
        List<CRM_Customer> rList = ru.GetCustomers();

        GridView1.DataSource = rList;
        GridView1.DataBind();
    }

}