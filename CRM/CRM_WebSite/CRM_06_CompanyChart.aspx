<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_06_CompanyChart.aspx.cs" Inherits="CRM_06_CompanyChart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">客戶資料統計</li>
    <li class="breadcrumb-item">客戶公司規模</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="container" style="width:75%; height:500px">
        <canvas id="myChart"></canvas>
    </div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script>
        var ctx = document.getElementById('myChart');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['一月', '二月', '三月'],
                datasets: [{
                    type: 'bar',
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)'
                    ],
                    borderWidth: 1,
                    label: '銷售業績(百萬)',
                    data: [60, 49, 72]
                }, {
                    type: 'line',
                    label: '新開發客戶',
                    data: [25, 13, 30]
                }]
            }
        });
    </script>
</asp:Content>

