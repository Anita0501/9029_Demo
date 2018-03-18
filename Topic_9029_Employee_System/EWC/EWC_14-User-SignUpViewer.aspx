<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //Employee testLoginUser = new Employee("A1002", "000", "楊于萱", "PR", 1, 1, "2018/06/07", "2018/10/10", "100", "XXXX@gmail.com", "0910111222", "AAAAAA", new byte[] { 1 }, "2018/10/10", "2018/10/15");
        Employee testLoginUser = Employee.LoginUser();
        Session["EmployeeInfo"] = testLoginUser;
        Employee E = Employee.LoginUser();
        SignUpAtvID_hidden.Value = E.EmployeeID;
        //EmployeeName_hidden.Value = E.EmployeeName;

        //page_load進來就取員工報名的活動清單
        //EWC_SignUpAtvUtility sua = new EWC_SignUpAtvUtility();
        //List<EWC_SignUpAtv> suaList = new List<EWC_SignUpAtv>();

        //suaList = sua.GetSignUpAtv(E.EmployeeID);

        //string atv = "";
        //if (suaList.Count > 0)
        //{
        //    foreach (EWC_SignUpAtv item in suaList)
        //    {
        //        /*atv += item.ActivityID + ","; *///跑迴圈取報名活動編號,組成string,放到隱藏欄位

        //    }

        //    atv = atv.Remove(atv.Length - 1);

        //    SignUpAtvID_hidden.Value = atv;
        //}
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會活動管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
<li class="breadcrumb-item">福委會活動管理</li>
    <li class="breadcrumb-item active">活動報名列表</li>
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

            var userID = $("#MainContentPlaceHolder_SignUpAtvID_hidden").val();

            $.ajax({
                type: 'POST',
                url: 'EWC_WebService.asmx/GetSignedAtvList',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ loginID: userID }),
                success: function (response) {

                    var atvList = response.d;
                    var dataLength = atvList.length;
                    var thTag = $('<tr><th>#</th ><th>活動名稱</th><th>活動類型</th><th>活動日期</th><th>活動時間</th><th>詳細資訊</th></tr>');

                    $(atvList).each(function (i, item) {

                        var trTag = $('<tr>');

                        var tb1 = $('<th>').
                            attr("scope", "row").
                            html(i + 1);

                        

                        //取得atv type轉成文字
                        var Atvtype = this.Type;

                        switch (this.Type) {
                            case "0":
                                Atvtype = "家庭日";
                                break;
                            case "1":
                                Atvtype = "電影";
                                break;
                            case "2":
                                Atvtype = "慶生會";
                                break;
                            case "3":
                                Atvtype = "聚餐";
                                break;
                            case "4":
                                Atvtype = "競賽";
                                break;
                            case "5":
                                Atvtype = "健康檢查";
                                break;
                            case "6":
                                Atvtype = "其他";
                                break;
                        }

                        var tb2 = $('<td>').
                            html(Atvtype);


                        var tb3 = $('<td>').
                            html(this.Title);
                        //var tb3 = $('<td>').
                        //    html(this.StartDate
                        //        );

                        var AtvDate = "";


                        if (this.EndDate == "") {
                            AtvDate = this.StartDate
                        } else {
                            AtvDate = this.StartDate + " ~ " + this.EndDate
                        }

                        var AtvTime = this.StartTime + " ~ " + this.EndTime;

                        var tb4 = $('<td>').
                            html(AtvDate);

                        var tb5 = $('<td>').
                            html(AtvTime);

                        var tb6 = $('<td>');

                        var tb7 = $('<input>').
                            attr("type", "button").
                            attr("alt", this.ActivityID).
                            attr("style", "margin-right:20px").
                            val("詳細資訊").click(
                            function (atvID) {
                                atvID = $(this).attr("alt");
                                location.href = "EWC_03-User-ActivityDetail.aspx?ID=" + atvID;
                            });

                        tb6.append(tb7);
                        trTag.append(tb1).append(tb2).append(tb3).append(tb4).append(tb5).append(tb6);

                        $("#th").append(thTag);
                        $("#tb").append(trTag);

                    });
                }
            });
        });



    </script>
</asp:Content>

