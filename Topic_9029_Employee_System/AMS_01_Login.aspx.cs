using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    public string code;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["EmployeeInfo"] = null;
        if (!Page.IsPostBack)
        {
            CreateVerificationCode();
        }
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        BusinessLogic bl = new BusinessLogic();
        Employee emp;
        //登入成功
        if (bl.IsEmployeeLoginSuccess(EmpIDTextBox.Text, PasswordTextBox.Text, out emp))
        {
            //取得驗證碼
            code = Session["code"] as string;
            //驗證碼輸入成功
            if (VerificationCodeTextBox.Text == code)
            {
                Session["EmployeeInfo"] = emp;

                FormsAuthentication.RedirectFromLoginPage(emp.EmployeeName, false);
                //如果他是 第一次登入||密碼過期 就要到更換密碼的頁面
                if (emp.StartDate == emp.EndDate || DateTime.Parse(emp.EndDate)<= DateTime.Now)
                {
                    Response.Redirect("~/" + ConfigurationManager.AppSettings["ChangePasswordPage"]);
                    return;
                }
                //如果不是第一次登入就到個人頁面
                Response.Redirect("~/" + ConfigurationManager.AppSettings["ProfilePage"]);
            }
            //驗證碼輸入失敗
            else
            {
                WarningLabel.Text = "<i class=\"fa fa-exclamation - triangle warning\" aria-hidden=\"true\"></i>驗證碼輸入錯誤" +
                    "<i class=\"fa fa-exclamation - triangle warning\" aria-hidden=\"true\"></i>";
            }
        }
        //帳號密碼比對失敗
        else
        {
            EmpIDTextBox.Text = "";
            PasswordTextBox.Text = "";
            WarningLabel.Text = "<i class=\"fa fa-exclamation - triangle warning\" aria-hidden=\"true\"></i>登入失敗" +
                "<i class=\"fa fa-exclamation - triangle warning\" aria-hidden=\"true\"></i>";
        }
    }

    protected void VerificationCodeButton_Click(object sender, ImageClickEventArgs e)
    {
        CreateVerificationCode();
    }

    public void CreateVerificationCode()
    {
        MemoryStream stream = new MemoryStream();
        Random random = new Random();
        code = (random.Next(0, 9999)).ToString("D4");
        Bitmap bitmap = new Bitmap(80, 25);
        //FontStyle:字的型態 GraphicsUnit:單位
        Font font = new Font("Arial", 25, FontStyle.Regular, GraphicsUnit.Pixel);
        Graphics graphics = Graphics.FromImage(bitmap);
        //graphics = Graphics.FromImage(bitmap);
        graphics.Clear(Color.FromArgb(random.Next(200,240), random.Next(200,240), random.Next(200,240)));
        graphics.SmoothingMode = SmoothingMode.AntiAlias;
        graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
        //畫上文字
        //random顏色
        graphics.DrawString(code, font, new SolidBrush(Color.FromArgb(random.Next(150), random.Next(150), random.Next(150))), 8, 0);

        //一支筆
        Pen pen = new Pen(Color.FromArgb(random.Next(50, 100), random.Next(50, 100), random.Next(50, 100)));


        for (int i = 0; i < 10; i++)
        {
            int x = random.Next(0, 50);
            int y = random.Next(0, 15);
            int width = random.Next(10, 70);
            int height = random.Next(10, 30);
            int startAngle = random.Next(0, 15);
            int sweepAngle = random.Next(40, 80);
            graphics.DrawArc(pen, x, y, width, height, startAngle, sweepAngle);
        }

        graphics.Flush();
        graphics.Dispose();

        bitmap.Save(stream, ImageFormat.Jpeg);

        byte[] byteArray = stream.GetBuffer();
        string base64String = Convert.ToBase64String(byteArray, 0, byteArray.Length);
        VerificationCodeButton.ImageUrl = "data:image/png;base64," + base64String;
        Session["code"] = code;
    }

    protected void demoLogin_Click(object sender, EventArgs e)
    {
        BusinessLogic bl = new BusinessLogic();
        Employee employee = bl.GetEmployeeList().Single(emp => emp.EmployeeID == "A1001");
        Session["EmployeeInfo"] = employee;
        if (employee.StartDate == employee.EndDate)
        {
            Response.Redirect("~/" + ConfigurationManager.AppSettings["ChangePasswordPage"]);
            return;
        }
        Response.Redirect("~/" + ConfigurationManager.AppSettings["ProfilePage"]);
    }

    protected void demoLogin2_Click(object sender, EventArgs e)
    {
        BusinessLogic bl = new BusinessLogic();
        Employee employee = bl.GetEmployeeList().Single(emp => emp.EmployeeID == "N1010");
        Session["EmployeeInfo"] = employee;
        if (employee.StartDate == employee.EndDate)
        {
            Response.Redirect("~/" + ConfigurationManager.AppSettings["ChangePasswordPage"]);
            return;
        }
        Response.Redirect("~/" + ConfigurationManager.AppSettings["ProfilePage"]);
    }
}