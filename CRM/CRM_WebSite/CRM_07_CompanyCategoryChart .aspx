<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_07_CompanyCategoryChart .aspx.cs" Inherits="CRM_06_CompanyChart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="Scripts/utils.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">客戶資料統計</li>
    <li class="breadcrumb-item">客戶產業類別統計圖</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <asp:Button ID="ExcelBtn" runat="server" Text="匯出列表" CssClass="btn btn-info" OnClick="ExcelBtn_Click" />
    <asp:Label ID="MsgLab" runat="server" Text=""></asp:Label>
    <div class="container" style="width: 75%">
        <canvas id="myChart"></canvas>
    </div>
    <div id="myToolTip" style="position: absolute">
        <p></p>
    </div>
    <asp:HiddenField ID="CompanyCategoryHiddenField" runat="server" />
    <asp:HiddenField ID="CountHiddenField" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <%--    <script>
        var ctx = document.getElementById("myChart");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: document.getElementById("MainContentPlaceHolder_CompanyScaleHiddenField").value.split(","),
                datasets: [{
                    label: '客戶公司規模',
                    data: document.getElementById("MainContentPlaceHolder_CountHiddenField").value.split(","),
                    borderWidth: 1,
                    backgroundColor: GetRandomColors(5)
                }]
            }
        });
    </script>--%>
    <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: 'polarArea',
            data: {
                labels: document.getElementById("MainContentPlaceHolder_CompanyCategoryHiddenField").value.split(","),
                datasets: [{
                    labels: '客戶產業類別',
                    data: document.getElementById("MainContentPlaceHolder_CountHiddenField").value.split(","),
                    backgroundColor:
                    [
                        'rgba(255, 99, 132,0.5)',
                        'rgba(255, 159, 64,0.5)',
                        'rgba(255, 205, 86,0.5)',
                        'rgba(75, 192, 192,0.5)',
                        'rgba(54, 162, 235,0.5)',
                        'rgba(153, 102, 255,0.5)',
                        'rgba(231,233,237,0.5)'
                    ],
                    //fontSize: 10
                }]
            },
            //scaleShowLine: true,
            scaleOverride: false,
            options: {
                title: {
                    display: true,
                    text: '客戶產業類別統計圖',
                    fontSize: 40,
                    fontStyle: 'bold'
                },
                legend: {
                    display: true,
                    position: 'right',
                    labels: {
                        fontSize: 20,
                        fontStyle: 'bold'
                    }
                },
                hover: {
                    mode: 'label',
                    animationDuration: 500
                },
                tooltips: {
                    mode: 'index',
                    bodyFontSize: 20,
                }

            },

        });
    </script>
</asp:Content>

