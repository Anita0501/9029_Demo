<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //Employee testLoginUser = new Employee("A1002", "000", "楊于萱", "PR", 1, 1, "2018/06/07", "2018/10/10", "100", "XXXX@gmail.com", "0910111222", "AAAAAA", new byte[] { 1 }, "2018/10/10", "2018/10/15");
        Employee testLoginUser = Employee.LoginUser();
        Session["EmployeeInfo"] = testLoginUser;
        Employee E = Employee.LoginUser();
        //EmployeeID_hidden.Value = E.EmployeeID;
        //EmployeeName_hidden.Value = E.EmployeeName;

        //page_load進來就取員工報名的活動清單
        EWC_SignUpUtility su = new EWC_SignUpUtility();
        List<EWC_SignUp> suList = new List<EWC_SignUp>();
        suList = su.GetSignUp(E.EmployeeID);

        string atv = "";
        if (suList.Count > 0)
        {
            foreach (EWC_SignUp item in suList)
            {
                atv += item.ActivityID + ","; //跑迴圈取報名活動編號,組成string,放到隱藏欄位
            }

            atv = atv.Remove(atv.Length - 1);

            SignUpAtvID_hidden.Value = atv;
        }
        EmployeeID_hidden.Value = E.EmployeeID;
        EmployeeName_hidden.Value = E.EmployeeName;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <%--timeLine css--%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/font-awesome.css" rel="stylesheet" />
    <%--<link href="css/droid+serif.css" rel="stylesheet" />--%>


    <%--<link rel="stylesheet" href="css/reset.css">--%>

    <!-- CSS reset -->
    <link rel="stylesheet" href="css/style.css">

    <%--自訂btn CSS--%>
    <link href="css/Atv_btn.css" rel="stylesheet" />

    <!-- Resource style -->
    <%--<script src="js/modernizr.js"></script>--%>


    <!-- Modernizr -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    福委會活動管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">福委會活動管理</li>
    <li class="breadcrumb-item active">活動列表</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div id="TL-funcColumn">
    </div>
    <section id="cd-timeline" class="cd-container">
    </section>
    <asp:HiddenField ID="EmployeeID_hidden" runat="server" Value="" />
    <asp:HiddenField ID="EmployeeName_hidden" runat="server" Value="" />
    <asp:HiddenField ID="SignUpAtvID_hidden" runat="server" Value="" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <!-- Resource jQuery -->

    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
    <%--<script src="js/main.js"></script>--%>
    <%--<script src="../js/main.js"></script>--%>

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

                    $(atvList).each(function () {
                        var atvStatus = "";
                        var signupbtndisplay;
                        var atvdate = this.StartDate;
                        var atvimgdisplay = "";
                        var atvimgurl = "";
                        var emp_Id = $("#MainContentPlaceHolder_EmployeeID_hidden").val();
                        //var atvenddate,

                        //取今天日期,變數today
                        var d = new Date();
                        var month = d.getMonth() + 1;
                        var day = d.getDate();
                        var PhotoPath = this.Photo.substring(1);


                        var output = d.getFullYear() + '/' +
                            (month < 10 ? '0' : '') + month + '/' +
                            (day < 10 ? '0' : '') + day;

                        //Response取出的日期欄位轉成日期格式
                        var today = new Date(Date.parse(output));

                        var activedate = new Date(Date.parse(this.ActiveDate.replace(/-/g, "/")));

                        var atvstartdate = new Date(Date.parse(this.StartDate.replace(/-/g, "/")));

                        //如果活動結束日不是空值,就將字串轉日期放進變數atvenddate
                        if (this.EndDate != "") {
                            var atvenddate = new Date(Date.parse(this.EndDate.replace(/-/g, "/")));
                        } else {
                            var atvenddate = "";
                        }

                        //如果開放報名為1(開放),就將字串轉日期放進變數atvstartsignupdate/atvendsignupdate
                        if (this.AllowSignUp == "1") {
                            var atvstartsignupdate = new Date(Date.parse(this.StartSignUpDate.replace(/-/g, "/")));
                            var atvendsignupdate = new Date(Date.parse(this.EndSignUpDate.replace(/-/g, "/")));
                        } else {
                            var atvstartsignupdate = "";
                            var atvendsignupdate = "";
                        }

                        //判斷要不要顯示卡片
                        if (this.AllowSignUp == "0") { //不用報名
                            if (today.getTime() < activedate.getTime()) {
                                return;
                            }
                        } else { //1要報名
                            if (today.getTime() < atvstartsignupdate.getTime()) {
                                return;
                            }
                        }



                        //判斷活動類型
                        var Atvtype = "";

                        switch (this.Type) {
                            case "0":
                                Atvtype = "family";
                                break;
                            case "1":
                                Atvtype = "movies";
                                break;
                            case "2":
                                Atvtype = "birthday";
                                break;
                            case "3":
                                Atvtype = "dinner";
                                break;
                            case "4":
                                Atvtype = "competition";
                                break;
                            case "5":
                                Atvtype = "health";
                                break;
                            case "6":
                                Atvtype = "other";
                                break;
                        }

                        var ps = today.getTime() > atvstartdate.getTime();
                        var ns = today.getTime() === atvstartdate.getTime();

                        var pe;
                        var ne;

                        if (atvenddate != "") {
                            pe = today.getTime() >= atvstartdate.getTime() && today.getTime() <= atvenddate.getTime();
                            ne = today.getTime() > atvenddate.getTime();
                        }

                        //判斷活動狀態 pre/now/past today.getTime() === atvstartdate.getTime()
                        if (atvenddate == "" ? ps : pe) {
                            atvStatus = "past";
                            signupbtndisplay = "hidden";
                            //} else if (today.getTime() === atvstartdate.getTime() || today.getTime() === atvenddate.getTime()) {
                        } else if (atvenddate == "" ? ns : ne) {
                            atvStatus = "now";
                        } else {
                            atvStatus = "pre";
                        }

                        //判斷是否需要顯示報名按鈕
                        if (this.AllowSignUp == "0") {  //不用報名就隱藏報名btn
                            signupbtndisplay = "hidden";
                        } else {  //需要報名
                            if (today.getTime() >= atvstartsignupdate.getTime() && today.getTime() <= atvendsignupdate.getTime()) {
                                signupbtndisplay = ""; //報名期間就顯示
                            } else {
                                signupbtndisplay = "hidden"; //不在報名期間就hidden
                            }
                        }

                        //有活動縮圖就顯示
                        if (this.Photo == "") {
                            atvimgdisplay = "hidden";
                        }
                        // else {
                        //    atvimgurl = this.Photo;
                        //}
                        var atvdd = "";
                        if (this.EndDate == "") {
                            atvdd = this.StartDate;
                        } else {
                            atvdd = this.StartDate + " ~ " + this.EndDate;
                        }

                        var atvcontent = '<i class="fa fa-calendar fa-fw" aria-hidden="true"></i>&nbsp;日期&nbsp;:&nbsp;&nbsp;' + atvdd + "<br>" +
                            '<i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>&nbsp;時間&nbsp;:&nbsp;&nbsp;' + this.StartTime + " ~ " + this.EndTime + "<br>" +
                            '<i class="fa fa-map-marker fa-fw" aria-hidden="true"></i>&nbsp;地點&nbsp;:&nbsp;&nbsp;' + this.Location + "<br>";


                        var timelineblockTag =
                            '<div class="cd-timeline-block"><div class="cd-timeline-img cd-all ' + atvStatus + '-icon-shadow-color">' +
                            '<img src= "img/' + atvStatus + '-cd-icon-' + Atvtype + '.png" alt="' + Atvtype + '" >' +
                            '</div >' +
                            '<div class="cd-timeline-content ' + atvStatus + '-triangle-color">' +
                            '<div class="cd-timeline-content-title ' + atvStatus + '-title-color">' +
                            '<h2>' + this.Title + '</h2>' +
                            '</div>' +
                            '<p>' +
                            '<img ' + atvimgdisplay + ' src="' + PhotoPath + '" class="AtvImg" />' +
                            atvcontent +
                            '</p>' +
                            '<a href="EWC_03-User-ActivityDetail.aspx?ID=' + this.ActivityID + '" class="detailbtn col-sm-offset-8 col-sm-2 btn btn-sm orange" style="margin-left: 15px; text-align: center">詳細資訊</a>' +
                            //'<a href="EWC_03-User-ActivityDetail.aspx?ID=' + this.ActivityID + '">' + info + '</a>' +
                            '<a ' + signupbtndisplay + ' alt="' + this.ActivityID + '" href="#p1" class="SignUpbtn atvsignin col-sm-2 btn btn-sm green" style="margin-left: 15px; text-align: center">報名活動</a>' +
                            '<span class="cd-date">' + atvdate + '</span>' +
                            '</div>' +
                            '</div >';

                        $("#cd-timeline").append(timelineblockTag);
                    });

                    $(".SignUpbtn").click(function (atvID) {

                        atvID = $(this).attr("alt");

                        //隱藏欄位取已報名的AtvID, 用split拆字串變成陣列
                        var signedUpAtv = $("#MainContentPlaceHolder_SignUpAtvID_hidden").val().split(',');

                        //迴圈判斷AtvID陣列中,有無目前點選報名的AtvID
                        for (var i = 0; i < signedUpAtv.length; i++) {

                            if (atvID == signedUpAtv[i]) { //有就跳swal
                                swal({
                                    title: '你已經報名囉!',
                                    type: 'warning',
                                    confirmButtonText: '好',
                                });
                                return;
                            }
                        }

                        var signUpData = atvID + "," + $("#MainContentPlaceHolder_EmployeeID_hidden").val() + "," + $("#MainContentPlaceHolder_EmployeeName_hidden").val();
                        swal({
                            title: '確認報名活動?',
                            type: 'warning',
                            confirmButtonText: '確認',
                            cancelButtonText: '取消',
                            showCancelButton: 'true',
                        }).then(
                            //報名活動alert選確認就用ajax呼叫web service call insert signUpActivity
                            function (value) {
                                $.ajax({
                                    type: 'POST',
                                    url: 'EWC_WebService.asmx/InsertSignUp',
                                    data: JSON.stringify({ s: signUpData }),
                                    dataType: 'json',
                                    contentType: 'application/json; charset=utf-8',
                                    success:
                                    function (response) {
                                        swal({
                                            title: '完成!',
                                            text: '報名成功!',
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
                                        text: '沒有報名活動',
                                        type: 'error',
                                        confirmButtonText: '好'
                                    })
                                }
                            }
                            );

                    });
                }
            });
        });

    </script>
</asp:Content>

