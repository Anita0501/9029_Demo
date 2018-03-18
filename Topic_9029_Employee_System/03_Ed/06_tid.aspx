<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="06_tid.aspx.cs" Inherits="Demo" EnableEventValidation="false" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <%--放自訂CSS的地方--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    <%--放網頁標題--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <%--SITE MAP 範例--%>
    <li class="breadcrumb-item">資產器材租借管理</li>
    <li class="breadcrumb-item active">器材新增表</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <%--寫你們的全部的東西--%>

    <div style="width: 40%;">
        <canvas id="myChart"></canvas>
    </div>
    <div id="myToolTip" style="position: absolute">
        <p></p>
    </div>

    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

   
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <%--放JS的地方--%>
<%--    <link href="Content/themes/base/all.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>--%>
    <script src="/Scripts/Chart.js"></script>
    <script src="/Scripts/utils.js"></script>


    <script>
        $(function () {
            $("#MainContentPlaceHolder_PurchaseDate").datepicker({ dateFormat: "yy/mm/dd" });
        });
        $(function () {
            $("#MainContentPlaceHolder_UseLife").datepicker({ dateFormat: "yy/mm/dd" });
        });

        var ctx = document.getElementById("myChart");
        var myChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ["3C產品", "周邊器材", "五金工具", "活動設備"],
                datasets: [{
                    label: '上課人數',
                    data: GetRandomNumbers(4),
                    backgroundColor: GetColors(4),
                }]
            },

            options: {
                tooltips: {
                    enabled: false,
                    mode: 'index',
                    position: 'nearest',
                    custom: function (tooltip) {
                        var customTip = document.getElementById('myToolTip');
                        if (tooltip.opacity === 0) {
                            customTip.style.opacity = 0;
                            return;
                        }
                        customTip.innerHTML = "<h1>" + tooltip.body[0].lines[0] + "筆</h1>";
                        customTip.style.opacity = 1;
                        customTip.style.left = tooltip.caretX + 'px';
                        customTip.style.top = tooltip.caretY + 'px';
                    }
                }
            }
        });
    </script>
</asp:Content>
