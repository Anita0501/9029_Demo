<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Employee testLoginUser = new Employee("A1002", "000", "楊于萱", "PR", 1, 1, "2018/06/07", "2018/10/10", "100", "XXXX@gmail.com", "0910111222", "AAAAAA", new byte[] { 1 }, "2018/10/10", "2018/10/15");
        Session["EmployeeInfo"] = testLoginUser;
        Employee E = Employee.LoginUser();
        //EmployeeID_hidden.Value = E.EmployeeID;
        //EmployeeName_hidden.Value = E.EmployeeName;

        //page_load進來就取員工報名的活動清單
        EWC_SignUpUtility su = new EWC_SignUpUtility();
        List<EWC_SignUp> suList = new List<EWC_SignUp>();
        suList = su.GetSignUp(E.EmployeeID);

        string atv = "";
        if (suList.Count > 0)
        {
            foreach (EWC_SignUp item in suList)
            {
                atv += item.ActivityID + ","; //跑迴圈取報名活動編號,組成string,放到隱藏欄位
            }

            atv = atv.Remove(atv.Length - 1);

            SignUpAtvID_hidden.Value = atv;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">福委會管理</li>
    <li class="breadcrumb-item active">檢視活動報名列表</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="tables">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">報名列表</h3>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-sm table-hover">
                                <thead id="th">
                                </thead>
                                <tbody id="tb">
                                    <%--    <tr>
                                        <th>123</th>
                                        <td><input id="Button1" type="button" value="button" /></td>
                                    </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="SignUpAtvID_hidden" runat="server" />
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script>
        $(function () {

            if ($("#MainContentPlaceHolder_SignUpAtvID_hidden").val() != "") {

                var thTag = $('<tr><th>#</th ><th>活動編號</th><th>活動名稱</th><th>活動類型</th><th>活動日期</th><th></th></tr>');

                var userSignedUpList = $("#MainContentPlaceHolder_SignUpAtvID_hidden").val().split(',');

                $(userSignedUpList).each(function (i, item) {

                    var trTag = $('<tr>');

                    var tb1 = $('<th>').
                        attr("scope", "row").
                        html(i + 1);

                    var tb2 = $('<td>').
                        html(userSignedUpList[i]);

                    trTag.append(tb1).append(tb2);

                    $("#th").append(thTag);
                    $("#tb").append(trTag);

                });
            }
            //$.ajax({
            //    type: 'POST',
            //    url: 'EWC_WebService.asmx/GetSignUpList',
            //    dataType: 'json',
            //    contentType: 'application/json; charset=utf-8',
            //    success: function (response) {

            //        var signList = response.d;
            //        var dataLength = signList.length;
            //        var thTag = $('<tr><th>#</th ><th>活動編號</th><th>員工編號</th><th>姓名</th><th>電子信箱</th><th>分機</th></tr>');

            //        $(signList).each(function (i, item) {
            //            var trTag = $('<tr>');

            //            var tb1 = $('<th>').
            //                attr("scope", "row").
            //                html(i + 1);

            //            var tb2 = $('<td>').
            //                html(this.ActivityID);

            //            var tb3 = $('<td>').
            //                html(this.EmployeeID);

            //            var tb4 = $('<td>').
            //                html(this.Name);

            //            trTag.append(tb1).append(tb2).append(tb3).append(tb4);

            //            $("#th").append(thTag);
            //            $("#tb").append(trTag);
            //        });

            //    }
            //});


        });
    </script>
</asp:Content>

