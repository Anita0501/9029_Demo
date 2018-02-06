<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //測試資料
        //string qs = "17S21_636532903502029818,荷比法瑞義12日遊";

        //正式
        string qs = Request.QueryString["Album"];
        List<string> qsl = new List<string>();
        
        foreach (var item in qs.Split(','))
        {
            qsl.Add(item);
        }
        AlbumID.Value=qsl[0];
        AlbumTitle.Value=qsl[1];
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="css/ekko-lightbox.css" rel="stylesheet" />
    <style type="text/css">
        .photo-row {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
            padding-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="photo-row" id="photoStart" style="margin-top:65px;">
                <div style="margin-top:65px;"></div>
                <%--<a href="https://unsplash.it/1200/768.jpg?image=251" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2" data-title="員工旅遊相簿" data-footer="好大的山！">
                    <img src="https://unsplash.it/600.jpg?image=251" class="img-fluid">
                </a>--%>
                <%-- <a href="https://unsplash.it/1200/768.jpg?image=252" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                <img src="https://unsplash.it/600.jpg?image=252" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=253" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                <img src="https://unsplash.it/600.jpg?image=253" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=251" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2" data-title="員工旅遊相簿" data-footer="好大的山！">
                <img src="https://unsplash.it/600.jpg?image=251" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=252" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                <img src="https://unsplash.it/600.jpg?image=252" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=253" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                <img src="https://unsplash.it/600.jpg?image=253" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=251" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2" data-title="員工旅遊相簿" data-footer="好大的山！">
                <img src="https://unsplash.it/600.jpg?image=251" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=252" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                <img src="https://unsplash.it/600.jpg?image=252" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=253" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                <img src="https://unsplash.it/600.jpg?image=253" class="img-fluid">
            </a>--%>
            </div>
            <%--<div class="row">
            <a href="https://unsplash.it/1200/768.jpg?image=254" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4">
                <img src="https://unsplash.it/600.jpg?image=254" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=255" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4">
                <img src="https://unsplash.it/600.jpg?image=255" class="img-fluid">
            </a>
            <a href="https://unsplash.it/1200/768.jpg?image=256" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4">
                <img src="https://unsplash.it/600.jpg?image=256" class="img-fluid">
            </a>
        </div>--%>
           
            <input id="backtoalbum" class="btn btn-primary btn-sm" Style="width: 200px; margin-right: 30px; margin-top:60px;" type="button" value="返回相簿" />
            <asp:HiddenField ID="AlbumID" runat="server" />
            <asp:HiddenField ID="AlbumTitle" runat="server" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/anchor-js/3.2.1/anchor.min.js"></script>

    <script src="js/ekko-lightbox.min.js"></script>

    <script type="text/javascript">
        $(document).on('click', '[data-toggle="lightbox"]', function (event) {
            event.preventDefault();
            $(this).ekkoLightbox();
        });

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

                    $(pList).each(function () {

                        var PhotoPath = this.FilePath.substring(6);
                        var phototg =
                            '<a href="' + PhotoPath + '" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2" data-title="' + $("#MainContentPlaceHolder_AlbumTitle").val() +'" data-footer="'+ this.PhotoDesc+'">'+
                            '<img src= "' + PhotoPath +'" class="img-fluid" >'+
                            '</a >'
                            $("#photoStart").append(phototg);
                    });
                }
            });

            $("#backtoalbum").click(function () {
                location.href = "EWC_05-User-AlbumViewer.aspx";
            });
        });
    </script>
</asp:Content>

