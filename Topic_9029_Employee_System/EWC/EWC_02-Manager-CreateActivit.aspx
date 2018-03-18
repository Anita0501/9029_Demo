<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void TestDataBtn_Click(object sender, EventArgs e)
    {

        string rnd = DateTime.Now.Millisecond.ToString();

        AtvIDBox.Text = "18S" + rnd;
        AtvTypeDDL.SelectedIndex = 0;
        //CompanyAmtDDL.SelectedIndex = 0;
        AtvTitleBox.Text = "春遊：武陵賞櫻漫步櫻花林";
        //ActiveDateBox.Text = "2018/02/12";
        AtvSDate.Text = "2018-03-16";
        //AtvEDate.Text = "2018/02/15";
        //AtvSTime.Text = "6:00pm";
        //AtvETime.Text = "10:00pm";
        AtvlocatBox.Text = "集合地點：台北車站東三門";
        AtvNoteBox.Text = "賞櫻注意事項：多一點距離，櫻花會更美。勿攀折花枝，與他人共賞!!";
        AtvDescBox.Text = "希望同仁為公司打拼的同時不忘陪伴家人，因此舉辦家庭日邀請家屬攜手出遊提升家庭活動的參與度，增進家屬對員工工作的了解和參與感。";
        
        //AtvDaysRB_0.Checked = true;
        //SignUpRB_0.Checked = true;

    }

    protected void Save_Click(object sender, EventArgs e)
    {

        string uploadPath_photo = "";
        string uploadPath_schedule = "";

        if (AtvImgFileUpload.HasFile)
        {

            string ext = System.IO.Path.GetExtension(AtvImgFileUpload.FileName).ToLower();

            string fileName = "CardPhoto_" + AtvIDBox.Text + ext;

            uploadPath_photo = "~/EWC/AtvImg/" + fileName;
            AtvImgFileUpload.SaveAs(Server.MapPath(uploadPath_photo));
        }

        if (AtvInfoFileUpload.HasFile)
        {

            string ext = System.IO.Path.GetExtension(AtvInfoFileUpload.FileName).ToLower();

            string fileName = "DetailSchedule_" + AtvIDBox.Text + ext;

            uploadPath_schedule = "~/EWC/AtvImg/" + fileName;
            AtvInfoFileUpload.SaveAs(Server.MapPath(uploadPath_schedule));
        }

        //是否開放報名,判斷RadioButton選取項目並給值
        //如果SignUpRB_1(是)被選了, value就給1, 否則給0
        string RBValue = "";
        bool checkedval = SignUpRB_1.Checked;
        if (checkedval)
        {
            RBValue = "1";
        }
        else
        {
            RBValue = "0";
        }

        //是否提供交通車,判斷RadioButton選取項目並給值
        //如果AtvBusRB_1(是)被選了, value就給1, 否則給0
        string RBValue2 = "";
        bool checkedval2 = AtvBusRB_1.Checked;
        if (checkedval2)
        {
            RBValue2 = "1";
        }
        else
        {
            RBValue2 = "0";
        }

        EWC_Activity a = new EWC_Activity()
        {
            ActivityID = AtvIDBox.Text,
            Type = AtvTypeDDL.SelectedValue,
            Title = AtvTitleBox.Text,
            Photo = uploadPath_photo,
            ActivityDescription = AtvDescBox.Text,
            ActiveDate = ActiveDateBox.Text,
            StartDate = AtvSDate.Text,
            EndDate = AtvEDate.Text,
            StartTime = AtvSTime.Text,
            EndTime = AtvETime.Text,
            Location = AtvlocatBox.Text,
            ActivitySchedule = uploadPath_schedule,
            AllowSignUp = RBValue,
            StartSignUpDate = SignUpSD.Text,
            EndSignUpDate = SignUpED.Text,
            CompanyAmount = CompanyAmtDDL.SelectedValue,
            Charge = AtvChargeBox.Text,
            Bus = RBValue2,
            Note = AtvNoteBox.Text
        };

        EWC_ActivityUtility au = new EWC_ActivityUtility();
        au.Insert(a);

        HiddenField1.Value = "1";

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = "0";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <%--移到masterPage<link href="Content/themes/base/all.css" rel="stylesheet" />--%>
    <link href="css/jquery.timepicker.min.css" rel="stylesheet" />
    <link href="css/Atv_btn.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會活動管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">福委會活動管理</li>
    <li class="breadcrumb-item active">建立活動</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <!-- Form Elements -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">建立</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <asp:Label ID="AtvID" CssClass="col-sm-2 form-control-label" runat="server" Text="活動編號:" AssociatedControlID="AtvIDBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AtvIDBox" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="AtvType" CssClass="col-sm-2 form-control-label" runat="server" Text="活動類型:" AssociatedControlID="AtvTypeDDL"></asp:Label>
                                <div class="col-sm-9 select">
                                    <asp:DropDownList ID="AtvTypeDDL" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="N">請選擇</asp:ListItem>
                                        <asp:ListItem Value="0">家庭日</asp:ListItem>
                                        <asp:ListItem Value="1">電影</asp:ListItem>
                                        <asp:ListItem Value="2">慶生會</asp:ListItem>
                                        <asp:ListItem Value="3">聚餐</asp:ListItem>
                                        <asp:ListItem Value="4">競賽</asp:ListItem>
                                        <asp:ListItem Value="5">健康檢查</asp:ListItem>
                                        <asp:ListItem Value="6">其他</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="AtvTitle" CssClass="col-sm-2 form-control-label" runat="server" Text="活動名稱:" AssociatedControlID="AtvTitleBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AtvTitleBox" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" id="AllowSignUp" class="col-sm-2 form-control-label">開放報名:</label>
                                <div class="col-sm-2 radio-btn">
                                    <div class="i-checks">
                                        <asp:RadioButton ID="SignUpRB_1" runat="server" GroupName="AllowSignUpRB" Text="是" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="SignUpRB_0" runat="server" GroupName="AllowSignUpRB" Text="否" />
                                    </div>
                                </div>
                                <div id="SignUpFeild" class="col-sm-8">
                                    <asp:Label ID="SignUpPeriod" CssClass="col-sm-2 form-control-label" runat="server" Text="報名期間:" AssociatedControlID="SignUpSD"></asp:Label>
                                    <asp:TextBox ID="SignUpSD" CssClass="Date form-control col-sm-4 unblock" runat="server"></asp:TextBox>
                                    <span id="QQ3">~</span>
                                    <asp:TextBox ID="SignUpED" CssClass="Date form-control col-sm-4 unblock" runat="server"></asp:TextBox>
                                </div>
                                <div id="AtcDate" class="col-sm-8">
                                    <asp:Label ID="ActiveDate" CssClass="col-sm-2 form-control-label" runat="server" Text="生效日期:" AssociatedControlID="ActiveDateBox"></asp:Label>
                                    <asp:TextBox ID="ActiveDateBox" CssClass="Date form-control col-sm-8 unblock" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="form-group row">
                                <label for="" id="AtvDays" class="col-sm-2 form-control-label">活動天數:</label>
                                <div class="col-sm-6 radio-btn">
                                    <div class="i-checks">
                                        <asp:RadioButton ID="AtvDaysRB_0" runat="server" GroupName="ActivityDaysRB" Text="單日" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="AtvDaysRB_1" runat="server" GroupName="ActivityDaysRB" Text="多日" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="AtvDate" CssClass="col-sm-2 form-control-label" runat="server" Text="活動日期:" AssociatedControlID="AtvSDate"></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="AtvSDate" CssClass="Date form-control col-sm-4 unblock" runat="server"></asp:TextBox>
                                    <span id="QQ">~</span>
                                    <asp:TextBox ID="AtvEDate" CssClass="Date form-control col-sm-4 unblock" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="AtvTime" CssClass="col-sm-2 form-control-label" runat="server" Text="活動時間:" AssociatedControlID="AtvSTime"></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="AtvSTime" CssClass="Time form-control col-sm-4 unblock" runat="server"></asp:TextBox>
                                    <span id="QQ2">~</span>
                                    <asp:TextBox ID="AtvETime" CssClass="Time form-control col-sm-4 unblock" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="Atvlocat" CssClass="col-sm-2 form-control-label" runat="server" Text="活動地點:" AssociatedControlID="AtvlocatBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AtvlocatBox" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="AtvDesc" CssClass="col-sm-2 form-control-label" runat="server" Text="活動目的:" AssociatedControlID="AtvDescBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AtvDescBox" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="AtvImg" class="col-sm-2 form-control-label" runat="server" Text="活動圖片:" AssociatedControlID="AtvImgFileUpload"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:FileUpload ID="AtvImgFileUpload" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="AtvInfo" class="col-sm-2 form-control-label" runat="server" Text="活動流程:" AssociatedControlID="AtvInfoFileUpload"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:FileUpload ID="AtvInfoFileUpload" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="CompanyAmt" CssClass="col-sm-2 form-control-label" runat="server" Text="可攜人數:" AssociatedControlID="CompanyAmtDDL"></asp:Label>
                                <div class="col-sm-2 select">
                                    <asp:DropDownList ID="CompanyAmtDDL" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">0人</asp:ListItem>
                                        <asp:ListItem Value="1">1人</asp:ListItem>
                                        <asp:ListItem Value="2">2人</asp:ListItem>
                                        <asp:ListItem Value="3">3人</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div id="AtvChargeField" class="col-sm-6">
                                    <asp:Label ID="AtvCharge" CssClass="col-sm-3 form-control-label" runat="server" Text="攜伴費用:" AssociatedControlID="AtvChargeBox"></asp:Label>
                                    <asp:TextBox ID="AtvChargeBox" CssClass="form-control col-sm-4 unblock" runat="server"></asp:TextBox>
                                    /人
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" id="AtvBus" class="col-sm-2 form-control-label">提供交通車:</label>
                                <div class="col-sm-6 radio-btn">
                                    <div class="i-checks">
                                        <asp:RadioButton ID="AtvBusRB_1" runat="server" GroupName="AtvBusRB" Text="是" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="AtvBusRB_0" runat="server" GroupName="AtvBusRB" Text="否" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="AtvNote" CssClass="col-sm-2 form-control-label" runat="server" Text="備註:" AssociatedControlID="AtvNoteBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AtvNoteBox" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="form-group row">
                                <div class="col-sm-8 offset-sm-2">
                                    <asp:Button ID="Save" CssClass="btn btn-primary btn-sm" Style="width: 200px; margin-right: 30px" runat="server" Text="送  出" OnClick="Save_Click" />
                                    <asp:Button ID="Clear" CssClass="btn btn-secondary btn-sm" Style="width: 200px; margin-right: 30px" runat="server" Text="清  除" />
                                    <asp:Button ID="TestDataBtn" CssClass="btn btn-secondary btn-sm" Style="width: 120px;" runat="server" OnClick="TestDataBtn_Click" Text="測試資料" />
                                </div>
                            </div>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <%--移到masterPage<script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="Scripts/jquery.timepicker.min.js"></script>--%>
    <script src="js/jquery.timepicker.min.js"></script>


    <script>
        $(function () {
            $.datepicker.regional['zh-TW'] = {
                dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                prevText: "上月",
                nextText: "次月",
                weekHeader: "週"
            };
            //將預設語系設定為中文
            $.datepicker.setDefaults($.datepicker.regional["zh-TW"]);

            //隱藏報名日期和生效日期
            $('#SignUpFeild').hide();
            $('#AtcDate').hide();


            //開放報名SignUpRB_1(是)為checked就show,否則就hide
            $('input[name="ctl00$MainContentPlaceHolder$AllowSignUpRB"]').change(function () {
                if (this.id == "MainContentPlaceHolder_SignUpRB_1") {
                    $('#SignUpFeild').show();
                    $('#AtcDate').hide();
                }
                else {
                    $('#SignUpFeild').hide();
                    $('#AtcDate').show();
                }
            });


            //隱藏活動日期第2個textbox
            $('#QQ').hide();
            $('#MainContentPlaceHolder_AtvEDate').hide();

            //多日活動AtvDaysRB_1(是)為checked就show,否則就hide
            $('input[name="ctl00$MainContentPlaceHolder$ActivityDaysRB"]').change(function () {
                if (this.id == "MainContentPlaceHolder_AtvDaysRB_1") {
                    $('#QQ').show();
                    $('#MainContentPlaceHolder_AtvEDate').show();
                }
                else {
                    $('#QQ').hide();
                    $('#MainContentPlaceHolder_AtvEDate').hide();

                }
            });


            //隱藏攜伴費用
            $('#AtvChargeField').hide();

            //攜伴人數 > 0 就show,否則就hide
            $('#MainContentPlaceHolder_CompanyAmtDDL').change(function () {
                if (this.selectedIndex == "0") {
                    $('#AtvChargeField').hide();
                }
                else {
                    $('#AtvChargeField').show();
                }
            });

            //活動日期 start date/end date
            $(".Date").datepicker({
                dateFormat: 'yy-mm-dd'
            });

            //活動時間 start time
            $(".Time").timepicker({
                timeFormat: 'h:mm p',
                interval: 30,
                minTime: '12:00am',
                maxTime: '11:30pm',
                defaultTime: '11:30am',
                startTime: '08:00',
                dynamic: false,
                dropdown: true,
                scrollbar: true

            });

            $("#MainContentPlaceHolder_SignUpRB_1").attr("class", "radio-template");
            $("#MainContentPlaceHolder_SignUpRB_0").attr("class", "radio-template");
            $("#MainContentPlaceHolder_AtvDaysRB_1").attr("class", "radio-template");
            $("#MainContentPlaceHolder_AtvDaysRB_0").attr("class", "radio-template");
            $("#MainContentPlaceHolder_AtvBusRB_1").attr("class", "radio-template");
            $("#MainContentPlaceHolder_AtvBusRB_0").attr("class", "radio-template");

            if ($("#MainContentPlaceHolder_HiddenField1").val() == 1) {
                swal({
                    title: '完成',
                    text: '活動新增成功 ! ',
                    type: 'success',
                    confirmButtonText: '好',
                }).then(
                    function () {
                        location.href = "EWC_07-Manager-ActivityListEdit.aspx";
                    });
            };
        });


    </script>
</asp:Content>
