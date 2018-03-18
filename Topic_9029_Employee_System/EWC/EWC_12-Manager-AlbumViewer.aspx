<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <style>
        .row-thumbnail-padding {
            padding: 30px;
            padding-left: 100px;
            padding-right: 100px;
        }

        .thumbnail-padding {
            padding: 10px;
        }

        .albumBTN {
            margin: 7px;
            padding-left: 14px;
            padding-top: 1px;
            padding-bottom: 1px;
            padding-right: 14px;
            position: relative;
            left: 52%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會活動管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
     <li class="breadcrumb-item">福委會活動管理</li>
    <li class="breadcrumb-item active">活動相簿</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div id="albumStart" class="row row-thumbnail-padding">
        <%--<div class="col-md-3">
            <div class="img-thumbnail thumbnail-padding">
                <a href="~/EWC/Album/Atv_17S21636531794581828223.jpg">
                    <img src="Album/Atv_17S21636531794581828223.jpg" style="width: 100%">
                    <div class="caption">
                        <p></p>
                    </div>
                </a>
                <a>123PhotoInfo</a><br />
                <input id="Button1" type="button" value="編輯" />
                <input id="Button2" type="button" value="刪除" />
            </div>
        </div>--%>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script>
        $(function () {

            $.ajax({
                type: 'POST',
                url: 'EWC_WebService.asmx/GetAlbumList',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    var abList = response.d;

                    $(abList).each(function () {

                        var PhotoPath = this.DefaultPhoto.substring(6);
                        var qs = this.AlbumID + "," + this.AlbumTitle;
                        //var toPhotoViewPath ='EWC_09-User-PhotoViewer.aspx?Album=123456';
                        var albumtg = '<div class="col-md-3">' +
                            '<div class="img-thumbnail thumbnail-padding">' +
                            '<a href="EWC_09-User-PhotoViewer.aspx?Album=' + qs + '&admin='+ 1 +'">' +
                            //'<a href="'+ toPhotoViewPath +'">' +
                            '<img src="' + PhotoPath + '" style="width: 100%">' +
                            '<div class="caption">' +
                            '<p></p>' +
                            '</div>' +
                            '</a>' +
                            '<a><b><font class="aTitle" size="4" alt="' + this.AlbumTitle + '">' + this.AlbumTitle + '</font></b></a> <br />' +
                            '<a class="aDesc" style="color:gray" alt="' + this.AlbumDesc + '">' + this.AlbumDesc + '</a> <br />' +
                            '<input type="button" alt="' + this.AlbumID + '" class="AlbumEdit btn btn-outline-success albumBTN" value="編輯" />' +
                            '<input type="button" alt="' + this.AlbumID + '" class="AlbumDelete btn btn-outline-danger albumBTN" value="刪除" />' +
                            '</div>' +
                            '</div >';

                        $("#albumStart").append(albumtg);
                    });


                    $(".AlbumEdit").on("click", function () {
                        var abID = $(this).attr("alt");
                        var abTitle = $(this).parent().find(".aTitle").attr("alt"); //this是這個btn, 往上找.parent()父標籤,再往下找.find()這個父標籤裡面的.("aTitle")title標籤,再找他的alt
                        var abDesc = $(this).parent().find(".aDesc").attr("alt");

                        Album = abID + "," + abTitle + "," + abDesc;
                        location.href = "EWC_10-Manager-EditAlbum.aspx?Album=" + Album +"&admin="+1;
                    });

                    $(".AlbumDelete").on("click", function () {
                        var abID = $(this).attr("alt");
                        var abTitle = $(this).parent().find(".aTitle").attr("alt"); //this是這個btn, 往上找.parent()父標籤,再往下找.find()這個父標籤裡面的.("aTitle")title標籤,再找他的alt
                        var abDesc = $(this).parent().find(".aDesc").attr("alt");

                        Album = abID + "," + abTitle + "," + abDesc;
                        location.href = "EWC_11-Manager-DeleteAlbum.aspx?Album=" + Album + "&admin=" + 1;
                    });
                }
            });


        });




        //$("#AlbumEdit").click(function (abID) {
        //    abID = $(this).attr("alt");
        //    location.href = "EWC_10-Manager-EditAlbum.aspx?Album=" + abID;
        //});
        //$("#AlbumDelete").click();
    </script>
</asp:Content>



