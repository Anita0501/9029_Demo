<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        //測試資料
        //string qs = "17S21_636531845615897332,123,123";
        //string qs2 = "1";

        //正式
        string qs = Request.QueryString["Album"];
        string qs2 = Request.QueryString["admin"];

        List<string> qsl = new List<string>();

        foreach (var item in qs.Split(','))
        {
            qsl.Add(item);
        }
        AlbumID.Value = qsl[0];
        AlbumTitle.Value = qsl[1];
        AlbumDesc.Value = qsl[2];

        AlbName_LB2.Text = qsl[1];
        AlbDesc_LB2.Text = qsl[2];

        admin.Value = qs2;
    }


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="css/font-awesome.css" rel="stylesheet" />
    <style>
        .align-mid {
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會活動管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">福委會活動管理</li>
    <li class="breadcrumb-item active">活動相簿</li>
    <li class="breadcrumb-item active">刪除相簿</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="tables">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">刪除</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label id="AlbName_LB" class="col-sm-2 form-control-label">相簿名稱:</label>
                                <div class="col-sm-9">
                                    <asp:Label ID="AlbName_LB2" CssClass="col-sm-5 form-control-label" Style="text-align: left" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label id="AlbDesc_LB" class="col-sm-2 form-control-label">相簿描述:</label>
                                <div class="col-sm-9">
                                    <asp:Label ID="AlbDesc_LB2" CssClass="col-sm-8 form-control-label" Style="text-align: left" runat="server" Text=""></asp:Label>
                                    <input id="DeleteAlbum" class="btn btn-primary btn-sm" type="button" style="width: 200px; float:right;"  value="刪 除 相 簿" />
                                </div>
                            </div>
                            
                            <div class="line"  style="width: 100%; height: 1px; border-bottom: 1px dashed #eee; margin: 30px 0;"></div>
                            <table class="table table-striped table-sm table-hover" style="width:940px;margin-left:110px;margin-top:40px";>
                                <thead id="th">
                                </thead>
                                <tbody id="tb">
                                        <%--<tr>
                                        <th>123</th>
                                        <td><input id="Button1" type="button" value="button" /></td>
                                            <th>123</th>
                                        <td><input id="Button2" type="button" value="button" /></td>
                                    </tr>--%>
                                </tbody>
                               
                            </table>
                            <div class="line"  style="width: 100%; height: 1px; border-bottom: 1px dashed #eee; margin: 30px 0;"></div>
                            <div class="form-group row">
                                <div class="col-sm-8 offset-sm-5">
                                    <%--<input id="Save" class="btn btn-primary btn-sm" type="button" style="width: 200px; margin-right: 30px"  value="儲  存" />--%>
                                    <input id="Cancel" class="btn btn-secondary btn-sm" type="button" style="width: 200px; margin-right: 30px"  value="取  消" />
                                    
                                    <%--<asp:Button ID="Save" CssClass="btn btn-primary btn-sm" Style="width: 200px; margin-right: 30px" runat="server" Text="送  出" />--%>
                                    <%--<asp:Button ID="Clear" CssClass="btn btn-secondary btn-sm" Style="width: 200px; margin-right: 30px" runat="server" Text="清  除" />--%>
                                    <%--<asp:Button ID="TestDataBtn" CssClass="btn btn-secondary btn-sm" Style="width: 120px;" runat="server" Text="測試資料" />--%>
                                </div>
                            </div>
                            <asp:HiddenField ID="AlbumID" runat="server" />
                            <asp:HiddenField ID="AlbumTitle" runat="server" />
                            <asp:HiddenField ID="AlbumDesc" runat="server" />
                            <asp:HiddenField ID="admin" runat="server" />
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
                    //var thTag = $('<tr><th>#</th ><th>相片</th><th>相片說明</th>');

                    $(pList).each(function (i, item) {
                        //if ((i + 1) % 2 != 0) {
                        //    var trTag = $('<tr>');
                        //}

                        var trTag = $('<tr>');

                        var tb1 = $('<td>').
                            attr("scope", "row").
                            attr("width", "80px").
                            attr("style", "vertical-align:middle").
                            html(i + 1);

                        var tb2 = $('<td>').
                            attr("style", "vertical-align:middle").
                            attr("width", "300px");

                        var PhotoPath = this.FilePath.substring(6);

                        var tb3 = $('<img>').
                            attr("style", "vertical-align:middle; height:240px; width:360px;").
                            attr("src", PhotoPath);

                        tb2.append(tb3);

                        var tb4 = $('<td>').
                            attr("style", "vertical-align:middle");

                        //<i class="fa fa-trash-o" aria-hidden="true"></i>

                        var tb6 = $('<i>').
                            attr("class", "fa fa-trash-o fa-2x");

                        var tb5 = $('<a>').
                            attr("alt", this.PhotoID).
                            html(tb6).click(
                            function (pID) {
                                //這邊加sweetalert顯示輸入相簿名稱,輸入完記在HiddenField,確認上傳才寫進資料表
                                pID = $(this).attr("alt");
                                swal({
                                    title: '確認?',
                                    text: '相片即將被刪除!',
                                    type: 'warning',
                                    confirmButtonText: '確認',
                                    cancelButtonText: '取消',
                                    showCancelButton: 'true',
                                }).then(
                                    //刪除活動alert選確認就用ajax呼叫web service call刪除方法
                                    function (value) {
                                        $.ajax({
                                            type: 'POST',
                                            url: 'EWC_WebService.asmx/DeletePhoto',
                                            data: JSON.stringify({ id: pID }),
                                            dataType: 'json',
                                            contentType: 'application/json; charset=utf-8',
                                            success:
                                            function (response) {
                                                swal({
                                                    title: '完成!',
                                                    text: '相片已經刪除',
                                                    type: 'success',
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
                                                text: '相片未被刪除',
                                                type: 'error',
                                                confirmButtonText: '好'
                                            })
                                        }
                                    }
                                    );

                            });

                        tb4.append(tb5);

                        //$("#th").append(thTag);

                        //if ((i + 1) % 2 != 0) {
                        //    $("#tb").append(tb1).append(tb2).append(tb4);
                        //} else {
                        //    trTag.append(tb1).append(tb2).append(tb4);
                        //    $("#tb").append(trTag);
                        //}

                        trTag.append(tb1).append(tb2).append(tb4);
                        $("#tb").append(trTag);
                    });
                }
            });

            $("#DeleteAlbum").click(function (atvID) {
                //這邊加sweetalert顯示輸入相簿名稱,輸入完記在HiddenField,確認上傳才寫進資料表
                atvID = $("#MainContentPlaceHolder_AlbumID").val();
                swal({
                    title: '確認?',
                    text: '相簿即將被刪除!',
                    type: 'warning',
                    confirmButtonText: '確認',
                    cancelButtonText: '取消',
                    showCancelButton: 'true',
                }).then(
                    //刪除活動alert選確認就用ajax呼叫web service call刪除方法
                    function (value) {
                        $.ajax({
                            type: 'POST',
                            url: 'EWC_WebService.asmx/DeleteAlbum',
                            data: JSON.stringify({ id: atvID }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success:
                            function (response) {
                                swal({
                                    title: '完成!',
                                    text: '相簿已經刪除',
                                    type: 'success',
                                    confirmButtonText: '好'
                                }).then(
                                    function () {
                                        location.href = "EWC_12-Manager-AlbumViewer.aspx";
                                    });
                            }
                        });
                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal({
                                title: '取消',
                                text: '相簿未被刪除',
                                type: 'error',
                                confirmButtonText: '好'
                            })
                        }
                    }
                    );

            });

            var admin = $("#MainContentPlaceHolder_admin").val(); 
            $("#Cancel").click(function () {
                if (admin == "1") {
                    location.href = "EWC_12-Manager-AlbumViewer.aspx";
                } else {
                    location.href = "EWC_05-User-AlbumViewer.aspx";
                }
            });
        });
    </script>
</asp:Content>

