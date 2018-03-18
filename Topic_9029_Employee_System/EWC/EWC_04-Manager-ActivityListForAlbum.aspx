<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會活動管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">福委會活動管理</li>
    <li class="breadcrumb-item active">建立相簿</li>
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
                            <asp:HiddenField ID="HiddenField1" runat="server" />
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
                            attr("alt", this.ActivityID + "," + this.Title).
                            attr("formmethod", "post").
                            val("新增相簿").click(
                            function () {
                                //這邊加sweetalert顯示輸入相簿名稱,輸入完記在HiddenField,確認上傳才寫進資料表
                                //atvID = $(this).attr("alt");
                                //swal({
                                //    title: '相簿名稱',
                                //    input: 'text',
                                //    inputPlaceholder: '請輸入相簿名稱',
                                //    showCancelButton: true,
                                //    confirmButtonText: '建立相簿',
                                //    cancelButtonText: '取消',
                                //    inputValidator: function (value) {
                                //        return new Promise(function (resolve, reject) {
                                //            if (value != "") {
                                //                resolve()
                                //            } else {
                                //                reject('請填寫相簿名稱')
                                //            }
                                //        })
                                //    }
                                //}).then(function (result) {
                                //跳到上傳相片頁 相簿名稱:xxxx,活動編號:xxxxx
                                //var str = "相簿名稱:" + result + "," + "活動編號:" + atvID;
                                //$("#MainContentPlaceHolder_HiddenField1").attr("Value", str),
                                //location.href = "EWC_06-Manager-UploadPhoto.aspx?AblumName="+result+"&ActivityID="+atvID;

                                //把活動ID帶到下一頁,方法一用queryString
                                //location.href = "EWC_06-Manager-UploadPhoto.aspx?ActivityID=" + $(this).attr("alt");

                                //把活動ID帶到下一頁,方法二用postback找form取值
                                location.href = "EWC_06-Manager-UploadPhoto.aspx?data=" + $(this).attr("alt");

                            });


                        tb6.append(tb7);
                        trTag.append(tb1).append(tb2).append(tb3).append(tb4).append(tb5).append(tb6);

                        //新增相簿產生出的標籤<input type="button" value="新增相簿" alt="18S24" />

                        $("#th").append(thTag);
                        $("#tb").append(trTag);
                    });
                }
            });
        });
    </script>
</asp:Content>

