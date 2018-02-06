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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div id="albumStart" class="row row-thumbnail-padding">
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
                            '<a href="EWC_09-User-PhotoViewer.aspx?Album=' + qs + '">' +
                            //'<a href="'+ toPhotoViewPath +'">' +
                            '<img src="' + PhotoPath + '" style="width: 100%">' +
                            '<div class="caption">' +
                            '<p></p>' +
                            '</div>' +
                            '</a>' +
                            '<a><b><font class="aTitle" size="4" alt="' + this.AlbumTitle + '">' + this.AlbumTitle + '</font></b></a> <br />' +
                            '<a class="aDesc" style="color:gray" alt="' + this.AlbumDesc + '">' + this.AlbumDesc + '</a> <br />' +
                            //'<input type="button" alt="' + this.AlbumID + '" class="AlbumEdit btn btn-outline-success albumBTN" value="編輯" />' +
                            //'<input type="button" alt="' + this.AlbumID + '" class="AlbumDelete btn btn-outline-danger albumBTN" value="刪除" />' +
                            '</div>' +
                            '</div >';

                        $("#albumStart").append(albumtg);
                    });


                    $(".AlbumEdit").on("click", function () {
                        var abID = $(this).attr("alt");
                        var abTitle = $(".aTitle").attr("alt");
                        var abDesc = $(".aDesc").attr("alt");

                        Album = abID + "," + abTitle + "," + abDesc;
                        location.href = "EWC_10-Manager-EditAlbum.aspx?Album=" + Album;
                    });

                    $(".AlbumDelete").on("click", function () {
                        var abID = $(this).attr("alt");
                        var abTitle = $(".aTitle").attr("alt");
                        var abDesc = $(".aDesc").attr("alt");

                        Album = abID + "," + abTitle + "," + abDesc;
                        location.href = "EWC_11-Manager-DeleteAlbum.aspx?Album=" + Album;
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



