<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="03_CustomerTotal.aspx.cs" Inherits="_03_Sel_Del_Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">客戶資料管理</li>
    <li class="breadcrumb-item">查詢與刪除客戶資料</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <div class="container">
        <asp:Label ID="DeleteLab" runat="server" Text="公司統編:"></asp:Label>
        <asp:TextBox ID="DeleteTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="DeleteBtn" runat="server" Text="刪除" OnClick="DeleteBtn_Click" />
    </div>
    <hr />
    <div class="container">
        <table id="CustomerTable" class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th style="width:10%">統編</th>
                    <th style="width:20%">公司名稱</th>
                    <th style="width:13%">公司電話</th>
                    <th style="width:12%">負責窗口</th>
                    <th style="width:15%">負責窗口電話</th>
                    <th style="width:15%">公司規模</th>
                    <th style="width:15%">產業類別</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

    <script>
        $(function () {
            $.ajax({
                type: "POST",
                url: "CRM_WebService.asmx/Customers",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var datatableVariable = $("#CustomerTable").DataTable({
                        data: response.d,
                        bDeferRander: true,
                        columns: [
                        { 'data': 'CompanyID' },
                        { 'data': 'CompanyName' },
                        { 'data': 'CompanyPhone' },
                        { 'data': 'ContactPerson' },
                        { 'data': 'CP_Phone' },
                        { 'data': 'CompanyScale' },
                        { 'data': 'CompanyCategory' }
                        ],
                        "language": {
                            "sProcessing": "處理中...",
                            "sLengthMenu": "顯示 _MENU_ 項結果",
                            "sZeroRecords": "沒有匹配結果",
                            "sInfo": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                            "sInfoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                            "sInfoFiltered": "(從 _MAX_ 項結果過濾)",
                            "sInfoPostFix": "",
                            "sSearch": "搜索:",
                            "sUrl": "",
                            "oPaginate": {
                                "sFirst": "首頁",
                                "sPrevious": "上頁",
                                "sNext": "下頁",
                                "sLast": "尾頁"
                            }
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>

