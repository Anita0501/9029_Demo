<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //正式
        string qs = Request.QueryString["ID"];

        //測試資料
        //string qs = "18S915";

        atvID.Value = qs;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="css/Atv_btn.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .content-inner {
            background-image: url("img/MyInvitation.jpeg") !important;
            background-size: auto 100vh;
        }

        .outDiv {
            position: absolute;
            left: 50%;
            bottom: 0;
        }

        .secondDiv {
            position: relative;
            left: -50%;
            height: 70vh;
            width: 80vw;
            overflow: auto;
        }

        .inDiv {
            /*border:5px solid lightgray;*/
            width: 100%;
            position: absolute;
            /*padding: 20px;*/
        }

        img {
            width: 100%;
        }

        .title {
            font-size: 20px;
            padding: 5px;
        }

        .col-centered {
            float: none;
            margin: 0 auto;
        }

        .aaa {
            /*border: 5px solid lightgray;*/
            font-size: 20px;
            color: darkslategrey;
            /*font-size: xx-large;*/
            padding: 5px;
            text-align: center !important;
            position: relative;
            top: 90px;
            /*right: 28%;*/
        }

        .content-font {
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <%--    <div class="container">
        <div class="row">
            <article id="content">
                <div class="atv-dtail-title" id="Title">
                    <a>HTML5 UP! 免費 HTML5 + CSS3 響應式設計網頁模版下載</a>
                    用hiddenfield拿資料
                </div>
                <div class="atv-dtail-content" id="Content">
                    <a>還記得去年底找到一個很棒的 HTML5 網站模版下載網站 Templated，真的是網站開發者的好朋友，至少我們不用從無到有、從頭到尾來打造一個網站，而是直接就現有的樣版去做修改或調整，讓建置網站難度降低許多，也減少花費的時間和開支。</a>
                    用hiddenfield拿資料
                    <a></a>
                </div>

            </article>
        </div>
    </div>--%>
    <div class="aaa col-12">
        <h2 id="title" style="font-weight: bold; color: #006374; font-size: 2rem;"></h2>
    </div>
    <div class="outDiv">
        <%--<i class="fa fa-window-close fa-2x" style="position:relative; left:40%;" aria-hidden="true"></i>--%>
        
        <div class="secondDiv content-font">
            <div class="inDiv">
                <div class="container">
                    <div class="row">
                        <div class="col-sm text-center">
                        </div>
                    </div>
                    <asp:HiddenField ID="atvID" runat="server" />
                    <div class="row">
                        <%-- <div class="col-sm">
                            臺北市體育總會田徑協會本著推展臺北市觀光發展為理念，以運動結合觀光推展具有臺灣特色的路跑活動，自2015年起連續兩年辦理「早安台北半程馬拉松暨城市邀請賽」，為鼓勵全民運動風氣，在臺北市最美麗的河濱公園大佳河濱公園舉辦全民皆可參加的路跑活動。
                        </div>--%>
                        <div id="Description" class="col-sm">
                        </div>
                    </div>
                    <div class="row">
                        <div id="atvimage" class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-centered">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-3 text-right">
                            活動日期：
                        </div>
                        <%-- <div class="col-5 text-left">
                            2018-06-03
                        </div>--%>
                        <div id="atvsd" class="col-5 text-left">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-3 text-right">
                            活動時間：
                        </div>
                        <%--<div class="col-5 text-left">
                            05:00AM ~ 12:00AM
                        </div>--%>
                        <div id="atvtime" class="col-5 text-left">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-3 text-right">
                            活動地點：
                        </div>
                        <%--<div class="col-5 text-left">
                            臺北市大佳河濱公園八號水門(巨蛋廣場)
                        </div>--%>
                        <div id="location" class="col-5 text-left">
                        </div>
                    </div>

                    <div id="signuplb" class="row">
                        <div class="col-3 text-right">
                            報名期間：
                        </div>
                        <%--<div class="col-6 text-left">
                            2018-02-02 ~ 2018-03-31
                        </div>--%>
                        <div id="signUpdt" class="col-6 text-left">
                        </div>
                    </div>

                    <div id="schedulelb" class="row">
                        <div class="col-3 text-right">
                            活動流程：
                        </div>
                    </div>

                    <div class="row">
                        <div id="schedule" class="col-12 col-sm-11 col-md-10 col-lg-9 col-xl-8 col-centered">
                            <%--<img id="schedule" src="image2.png">--%>
                        </div>
                    </div>

                    <div id="notelb" class="row">
                        <div class="col-3">
                            備註：
                        </div>
                    </div>

                    <%--<div class="row">
                        <div class="col-12">
                            1. 成績證明：完跑立即發給，請務必現場領取，如未領取恕不補寄。(若遇大風大雨、停電、當機、路斷線等意外，完賽證書改由完賽一週後，於大會網路下載自行列印。)成績於賽後一週內公佈於網站。請同仁索取成績證明，依據成績證明頒發獎項。
獎金：第一名：2000元、第二名1500元、第三名1000元。<br />
                            2. 雨備方案：若因颱風來襲或天災，將以活動官網平台公告活動延期或停辦資訊為準。<br />
                            <br />
                            更多詳細資訊請上官方網站查看。 https://lohasnet.tw/Taipei20180311/
                        </div>
                    </div>--%>
                    <div class="row">
                        <div id="note" class="col-12">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <br>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <br>
                        </div>
                    </div>
                </div>
                <!-- end container -->
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script>
        $(function () {
            var atvID = $("#MainContentPlaceHolder_atvID").val();

            $.ajax({
                type: 'POST',
                url: 'EWC_WebService.asmx/GetActivityList2',
                dataType: 'json',
                data: JSON.stringify({ id: atvID }),
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var atv = response.d;

                    //標題放到對應div
                    $("#title").text(atv.Title);

                    //活動描述放到對應div
                    $("#Description").text(atv.ActivityDescription);

                    //若有照片就產生img標籤,並且append到對應div
                    if (atv.Photo != "") {
                        var PhotoPath = atv.Photo.substring(6);

                        var imgtg = $('<img>').
                            attr("src", PhotoPath).
                            attr("height", "240");
                        $("#atvimage").append(imgtg);
                    }

                    //活動若為單日, 則顯示一個日期, 多日顯示兩個日期
                    var ad = "";
                    if (atv.EndDate == "") {
                        ad = atv.StartDate;
                    } else {
                        ad = atv.StartDate + "~" + atv.EndDate;
                    }
                    $("#atvsd").text(ad);

                    //活動時間放到對應div
                    $("#atvtime").text(atv.StartTime + " ~ " + atv.EndTime);

                    //活動地點放到對應div
                    $("#location").text(atv.Location);

                    //開放報名就顯示報名期間,若不開放報名就隱藏對應div
                    if (atv.AllowSignUp == "1") {
                        var sudt = atv.StartSignUpDate + " ~ " + atv.EndSignUpDate;
                        $("#signUpdt").text(sudt);
                    } else {
                        $("#signuplb").hide();
                    }

                    //若有流程照片就產生img標籤,並且append到對應div,若無則隱藏對應div
                    if (atv.ActivitySchedule != "") {
                        var PhotoPath = atv.ActivitySchedule.substring(6);

                        var imgtg = $('<img>').
                            //attr("style", "vertical-align:middle").
                            attr("src", PhotoPath).
                            attr("height", "500");
                        $("#schedule").append(imgtg);
                    } else {
                        $("#schedulelb").hide();
                    }

                    //若有備註則顯示在對應div,若無則隱藏對應div
                    if (atv.Note != "") {
                        $("#note").text(atv.Note);
                    } else {
                        $("#notelb").hide();
                    }
                }
            });
        });
    </script>
</asp:Content>

