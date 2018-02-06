<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        //測試資料
        //string qs = "17S21_636532903502029818,荷比法瑞義12日遊,測試相簿說明";

        //正式
        string qs = Request.QueryString["Album"];
        List<string> qsl = new List<string>();

        foreach (var item in qs.Split(','))
        {
            qsl.Add(item);
        }
        AlbumID.Value = qsl[0];
        AlbumTitle.Value = qsl[1];
        AlbumDesc.Value = qsl[2];

        AlbName_Box.Text = qsl[1];
        AlbDesc_Box.Text = qsl[2];
    }


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <style>
        .align-mid {
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">福委會管理</li>
    <li class="breadcrumb-item active">編輯相簿</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="tables">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">編輯</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label id="AlbName_LB" class="col-sm-2 form-control-label">相簿名稱:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AlbName_Box" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label id="AlbDesc_LB" class="col-sm-2 form-control-label">相簿描述:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AlbDesc_Box" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="line"  style="width: 100%; height: 1px; border-bottom: 1px dashed #eee; margin: 30px 0;"></div>
                            <table class="table table-striped table-sm table-hover" style="width:940px;position: relative;left: 22%;">
                                <thead id="th">
                                </thead>
                                <tbody id="tb">
                                    <%--    <tr>
                                        <th>123</th>
                                        <td><input id="Button1" type="button" value="button" /></td>
                                    </tr>--%>
                                </tbody>
                               
                            </table>
                            <div class="line"  style="width: 100%; height: 1px; border-bottom: 1px dashed #eee; margin: 30px 0;"></div>
                            <div class="form-group row">
                                <div class="col-sm-8 offset-sm-4">
                                    <input id="Save" class="btn btn-primary btn-sm" type="button" style="width: 200px; margin-right: 30px"  value="儲  存" />
                                    <input id="Cancel" class="btn btn-secondary btn-sm" type="button" style="width: 200px; margin-right: 30px"  value="取  消" />
                                    
                                    <%--<asp:Button ID="Save" CssClass="btn btn-primary btn-sm" Style="width: 200px; margin-right: 30px" runat="server" Text="送  出" />--%>
                                    <%--<asp:Button ID="Clear" CssClass="btn btn-secondary btn-sm" Style="width: 200px; margin-right: 30px" runat="server" Text="清  除" />--%>
                                    <%--<asp:Button ID="TestDataBtn" CssClass="btn btn-secondary btn-sm" Style="width: 120px;" runat="server" Text="測試資料" />--%>
                                </div>
                            </div>
                            <asp:HiddenField ID="AlbumID" runat="server" />
                            <asp:HiddenField ID="AlbumTitle" runat="server" />
                            <asp:HiddenField ID="AlbumDesc" runat="server" />
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
            var albumID = $("#MainContentPlaceHolder_AlbumID").val();

            $.ajax({
                type: 'POST',
                url: 'EWC_WebService.asmx/GetPhotoList',
                dataType: 'json',
                data: JSON.stringify({ id: albumID }),
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var pList = response.d;
                    var dataLength = pList.length;
                    var thTag = $('<tr><th>#</th ><th>相片</th><th>相片說明</th>');
                    var pid = "";
                    var pdesc = "";

                    $(pList).each(function (i, item) {
                        var trTag = $('<tr>');

                        var tb1 = $('<th>').
                            attr("scope", "row").
                            attr("width", "80px").
                            attr("style", "vertical-align:middle").
                            html(i + 1);

                        var tb2 = $('<td>').
                            attr("style", "vertical-align:middle").
                            attr("width", "300px");

                        var PhotoPath = this.FilePath.substring(6);

                        var tb3 = $('<img>').
                            attr("style", "vertical-align:middle").
                            attr("src", PhotoPath).
                            attr("height", "150").
                            attr("width", "180");

                        tb2.append(tb3);

                        var tb4 = $('<td>').
                            attr("style", "vertical-align:middle");

                        var tb5 = $('<textarea>').
                            attr("rows", "4").
                            attr("cols", "50").
                            attr("alt", this.PhotoID).
                            attr("placeholder", "請輸入相片描述").
                            attr("style", "max-width:700px;max-height:100px;width:500px;height:100px;margin:5px;resize: none;").
                            html(this.PhotoDesc);

                        tb4.append(tb5);

                        trTag.append(tb1).append(tb2).append(tb4);

                        $("#th").append(thTag);
                        $("#tb").append(trTag);
                    });
                }
            });

            $("#Cancel").click(function () {
                location.href = "EWC_05-User-AlbumViewer.aspx";
            });



            $("#Save").click(function () {
                var abID = $("#MainContentPlaceHolder_AlbumID").val();
                var abname = $("#MainContentPlaceHolder_AlbName_Box").val();
                var abdesc = $("#MainContentPlaceHolder_AlbDesc_Box").val();

                var albumdata = abID + "," + abname + "," + abdesc + ",";
                var updata = albumdata;
                $("textarea").each(function () {
                    updata += $(this).attr("alt") + "," + $(this).val() + ",";
                });

                updata = updata.substring(0, updata.length - 1);

                $.ajax({
                    type: 'POST',
                    url: 'EWC_WebService.asmx/UpdateAlbum',
                    dataType: 'json',
                    data: JSON.stringify({ ap: updata }),
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {
                        swal({
                            title: '儲存成功!',
                            type: 'success',
                            confirmButtonText: '好'
                        }).then(
                            function () {
                                location.reload();
                            });
                        //var pList = response.d;
                        //var dataLength = pList.length;
                        //var thTag = $('<tr><th>#</th ><th>相片</th><th>相片說明</th>');

                        //$(pList).each(function (i, item) {
                        //    var trTag = $('<tr>');

                        //    var tb1 = $('<th>').
                        //        attr("scope", "row").
                        //        attr("width", "80px").
                        //        attr("style", "vertical-align:middle").
                        //        html(i + 1);

                        //});
                    }
                });

            });
        });
    </script>
</asp:Content>

