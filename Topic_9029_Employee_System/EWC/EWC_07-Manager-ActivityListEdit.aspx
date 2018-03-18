<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("aaaaa");
        //EWC_ActivityUtility au = new EWC_ActivityUtility();
        //List<EWC_Activity> aList = new List<EWC_Activity>(au.GetActivity());
        ////foreach (EWC_Activity item in aList)
        ////{
        ////    Response.Write(item.ActivityID.ToString() + "," + item.Title.ToString());
        //TextBox1.Text = aList[6].ActivityID;
        //TextBox2.Text = aList[6].Title;
        ////}
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會活動管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">福委會活動管理</li>
    <li class="breadcrumb-item active">編輯活動</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="tables">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">活動列表</h3>
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
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script>
        $(function () {

            $.ajax({
                type: 'POST',
                url: 'EWC_WebService.asmx/GetActivityList',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var atvList = response.d;
                    var dataLength = atvList.length;
                    var thTag = $('<tr><th>#</th ><th>活動編號</th><th>活動名稱</th><th>活動類型</th><th>活動日期</th><th></th></tr>');

                    $(atvList).each(function (i, item) {
                        var trTag = $('<tr>');

                        var tb1 = $('<th>').
                            attr("scope", "row").
                            html(i + 1);

                        var tb2 = $('<td>').
                            html(this.ActivityID);

                        var tb3 = $('<td>').
                            html(this.Title);

                        //活動類型判斷value換成文字---------------------------
                        var Atvtype = "";

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
                        //---------------------------------------------------

                        var tb4 = $('<td>').
                            html(Atvtype);

                        //活動日期 判斷一天就只顯示一個日期---------------------
                        var Atvdate = "";

                        if (this.EndDate == "") {
                            Atvdate = this.StartDate;
                        } else
                            Atvdate = this.StartDate + " ~ " + this.EndDate;
                        //----------------------------------------------------

                        var tb5 = $('<td>').
                            html(Atvdate);

                        var tb6 = $('<td>');

                        var tb7 = $('<input>').
                            attr("type", "button").
                            attr("alt", this.ActivityID).
                            attr("style", "margin-right:20px").
                            val("編輯活動").click(
                            function (atvID) {
                                atvID = $(this).attr("alt");
                                location.href = "EWC_08-Manager-EditActivit.aspx?ActivityID=" + atvID;
                            });

                        var tb8 = $('<input>').
                            attr("type", "button").
                            attr("alt", this.ActivityID).
                            val("刪除活動").click(
                            function (atvID) {
                                //這邊加sweetalert顯示輸入相簿名稱,輸入完記在HiddenField,確認上傳才寫進資料表
                                atvID = $(this).attr("alt");
                                swal({
                                    title: '確認?',
                                    text: '活動即將被刪除!',
                                    type: 'warning',
                                    confirmButtonText: '確認',
                                    cancelButtonText: '取消',
                                    showCancelButton: 'true',
                                }).then(
                                    //刪除活動alert選確認就用ajax呼叫web service call刪除方法
                                    function (value) {
                                        $.ajax({
                                            type: 'POST',
                                            url: 'EWC_WebService.asmx/DeleteActivity',
                                            data: JSON.stringify({ id: atvID }),
                                            dataType: 'json',
                                            contentType: 'application/json; charset=utf-8',
                                            success:
                                            function (response) {
                                                swal({
                                                    title:'完成!',
                                                    text:'活動已經刪除',
                                                    type:'success',
                                                    confirmButtonText: '好'
                                                }).then(
                                                    function () {
                                                    location.reload();
                                                });
                                            }
                                        });
                                    },
                                    function (dismiss) {
                                        if (dismiss === 'cancel') {
                                            swal({
                                                title: '取消',
                                                text: '活動未被刪除',
                                                type: 'error',
                                                confirmButtonText: '好'
                                            })
                                        }
                                    }
                                );

                            });

                        tb6.append(tb7).append(tb8);
                        trTag.append(tb1).append(tb2).append(tb3).append(tb4).append(tb5).append(tb6);

                        $("#th").append(thTag);
                        $("#tb").append(trTag);
                    });

                }
            });


        });
    </script>
</asp:Content>

