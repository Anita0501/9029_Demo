<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_04_BusinessSchedule.aspx.cs" Inherits="BusinessSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <%--    <link href="../Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Content/themes/base/datepicker.css" rel="stylesheet" />--%>
    <%--    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>

    <style>
        .abc {
            vertical-align: text-top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">業務行程管理</li>
    <li class="breadcrumb-item">新增業務行程資料</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <div class="container">
        <asp:Label ID="ErrorLab" CssClass="offset-2" Style="color: red" runat="server" Text=""></asp:Label>
        <%--        <div class="form-group">
            <asp:Label ID="TripID" runat="server" Text="行程單號" AssociatedControlID="TripIDTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="TripIDTextBox" runat="server" CssClass="col-4"></asp:TextBox>
            <asp:Label ID="TripIDErrorLab" Style="color: red" runat="server" Text=""></asp:Label>
        </div>--%>
        <div class="form-group">
            <asp:Label ID="CompanyID" runat="server" Text="統編" AssociatedControlID="CompanyIDTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="CompanyIDTextBox" runat="server" CssClass="col-4"></asp:TextBox>
            <asp:Button ID="SelectBtn" CssClass="btn btn-sm btn-info col-1" runat="server" Text="查詢" OnClick="SelectBtn_Click" />
        </div>
        <div class="form-group">
            <asp:Label ID="CompanyName" runat="server" Text="公司名稱" AssociatedControlID="CompanyNameTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="CompanyNameTextBox" runat="server" CssClass="col-4" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="EmployeeID" runat="server" Text="員工編號" AssociatedControlID="EmployeeIDTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="EmployeeIDTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="EmployeeName" runat="server" Text="員工名稱" AssociatedControlID="EmployeeNameTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="EmployeeNameTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="TripTheme" runat="server" Text="行程主題" AssociatedControlID="TripThemeTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="TripThemeTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="TargetDate" runat="server" Text="預約日期" AssociatedControlID="TargetDateTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="TargetDateTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="Memo" runat="server" Text="備註欄" AssociatedControlID="MemoTextBox" CssClass="col-2 "></asp:Label>
            <asp:TextBox ID="MemoTextBox" runat="server" CssClass="col-4 abc" TextMode="MultiLine" Style="height: 80px"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Button ID="InsertBtn" CssClass="btn btn-info offset-2 col-1" runat="server" Text="新增" OnClick="InsertBtn_Click" />
            <%--        <asp:Button ID="UpdateBtn" CssClass="btn btn-info col-1" runat="server" Text="修改" OnClick="UpdateBtn_Click" />--%>
            <asp:Button ID="CancelBtn" CssClass="btn btn-info col-1" runat="server" Text="取消" OnClick="CancelBtn_Click" />
            <asp:Button ID="Demobtn" CssClass="btn btn-default offset-3 col-1" runat="server" Text="Demo" OnClick="Demobtn_Click" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <%--    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>--%>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
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
            //套用到表單
            $(function () {
                $("#MainContentPlaceHolder_TargetDateTextBox").datepicker({ dateFormat: 'yy/mm/dd' });
            });
        });
    </script>
</asp:Content>

