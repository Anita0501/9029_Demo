<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    List<string> qsl = new List<string>();
    string rnd = DateTime.Now.Ticks.ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        //測試資料
        //string qs = "17S21,106年8月慶生會";

        //正式
        string qs = Request.QueryString["data"];
        is_selected_photo.Value = "0";
        is_enter_album_info.Value = "0";


        foreach (var item in qs.Split(','))
        {
            qsl.Add(item);
        }
        AtvName_LB.Text = qsl[1];

    }

    protected void Upload_BTN_Click1(object sender, EventArgs e)
    {
        string uploadPath_albumPhoto = "";
        //string today = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Date.ToString();
        DateTime currentTime = System.DateTime.Now;

        string year = currentTime.Year.ToString();
        string month = currentTime.Month.ToString();
        string day = currentTime.Day.ToString();
        string today = year + month + day;



        if (AlbName_Box.Text != "" && AlbDesc_Box.Text != "")
        {
            //寫進Album資料表
            EWC_Album ab = new EWC_Album()
            {
                //AlbumID = qsl[0] + "_" + today,
                AlbumID = qsl[0] + "_" + rnd,
                ActivityID = qsl[0],
                AlbumTitle = AlbName_Box.Text,
                AlbumDesc = AlbDesc_Box.Text,
                DefaultPhoto = "",
            };

            EWC_AlbumUtility abu = new EWC_AlbumUtility();
            abu.Insert(ab);
        }
        else
        {
            is_enter_album_info.Value = "1";
        }



        if (Album_PhotoUpload.HasFile)
        {

            bool isAddFirstPhoto = false;

            foreach (HttpPostedFile uploadedPhoto in Album_PhotoUpload.PostedFiles)
            {
                //取附檔名
                string ext = System.IO.Path.GetExtension(Album_PhotoUpload.FileName).ToLower();

                //建一個變數放時間毫秒做檔名用
                //string rnd = DateTime.Now.Millisecond.ToString();
                string rnd2 = DateTime.Now.Ticks.ToString();

                //檔名=Atv_活動ID+時間變數+副檔名
                string fileName = "Atv_" + qsl[0] + rnd2 + ext;
                //string fileName = "Atv_" + atv_id + "_" + rnd +  ext;

                //上傳路徑
                uploadPath_albumPhoto = "~/EWC/Album/" + fileName;

                //上傳到server
                uploadedPhoto.SaveAs(HttpContext.Current.Server.MapPath(uploadPath_albumPhoto));
                Label1.Text += String.Format("{0}<br />", uploadedPhoto.FileName);

                //寫進Photo資料表
                EWC_Photo pt = new EWC_Photo()
                {
                    PhotoID = qsl[0] + "_" + rnd + DateTime.Now.Millisecond.ToString(),
                    AlbumID = qsl[0] + "_" + rnd,
                    FilePath = uploadPath_albumPhoto,
                    PhotoDesc = "",
                };

                EWC_PhotoUtility ptu = new EWC_PhotoUtility();
                ptu.Insert(pt);

                if (isAddFirstPhoto == false)
                {
                    EWC_AlbumUtility abu = new EWC_AlbumUtility();
                    abu.UpdateDefaultPhoto(qsl[0] + "_" + rnd, uploadPath_albumPhoto);
                    isAddFirstPhoto = true;
                }
            }


            //QueryString帶AlbumID,AlbumTitle,AlbumeDescription
            string Album = qsl[0] + "_" + rnd + "," + AlbName_Box.Text +","+ AlbDesc_Box.Text;
            Response.Redirect("EWC_10-Manager-EditAlbum.aspx?Album="+ Album);

            //Response.Redirect("EWC_10-Manager-EditAlbum.aspx");
            //location.href = "EWC_08-Manager-EditActivit.aspx?ActivityID=" + atvID;
        }
        else
        {
            is_selected_photo.Value = "1";
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
    <li class="breadcrumb-item active">上傳照片</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="tables">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">上傳</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label">活動名稱:</label>
                                <asp:Label ID="AtvName_LB" CssClass="col-sm-5 form-control-label" Style="text-align: left" runat="server"></asp:Label>
                            </div>
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
                            <div class="form-group row">
                                <label id="AtvImgFileUpload_LB" class="col-sm-2 form-control-label">選擇照片:</label>
                                <div class="col-sm-9">
                                    <asp:FileUpload ID="Album_PhotoUpload" CssClass="form-control" runat="server" AllowMultiple="True" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label id="empty" class="col-sm-2 form-control-label"></label>
                                <div class="col-sm-9">
                                    <asp:Button ID="Upload_BTN" CssClass="btn btn-secondary btn-sm" Style="width: 120px;" runat="server" Text="開始上傳" OnClick="Upload_BTN_Click1" />
                                </div>
                            </div>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <asp:HiddenField ID="is_selected_photo" runat="server" />
                            <asp:HiddenField ID="is_enter_album_info" runat="server" />
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
            if ($("#MainContentPlaceHolder_is_selected_photo").val() == 1) {
                swal({
                    title: '請選擇檔案',
                    //text: '活動新增成功 ! ',
                    type: 'error',
                    confirmButtonText: '好',
                })
            };
            if ($("#MainContentPlaceHolder_is_enter_album_info").val() == 1) {
                swal({
                    title: '請輸入相簿名稱及說明',
                    //text: '活動新增成功 ! ',
                    type: 'error',
                    confirmButtonText: '好',
                })
            };
        });
    </script>
</asp:Content>

