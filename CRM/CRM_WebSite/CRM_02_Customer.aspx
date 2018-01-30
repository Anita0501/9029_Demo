<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_02_Customer.aspx.cs" Inherits="_02_AddCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
<%--    <link href="Scripts/sweetalert2.min.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">客戶資料管理</li>
    <li class="breadcrumb-item">新增與修改客戶資料</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <div class="container">
        <asp:Label ID="ErrorLab" CssClass="offset-2" Style="color: red" runat="server" Text=""></asp:Label>
        <div class="form-group">
            <asp:Label ID="CompanyID" runat="server" Text="統編" AssociatedControlID="CompanyIDTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="CompanyIDTextBox" runat="server" CssClass="col-4"></asp:TextBox>
            <asp:Button ID="SelectBtn" CssClass="btn btn-sm btn-info col-1" runat="server" Text="查詢" OnClick="SelectBtn_Click" />
        </div>
        <div class="form-group">
            <asp:Label ID="CompanyName" runat="server" Text="公司名稱" AssociatedControlID="CompanyNameTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="CompanyNameTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="CompanyAddress" runat="server" Text="公司地址" AssociatedControlID="CompanyAddressTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="CompanyAddressTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="CompanyPhone" runat="server" Text="公司電話" AssociatedControlID="CompanyPhoneTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="CompanyPhoneTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="OfficialWebsite" runat="server" Text="公司官網" AssociatedControlID="OfficialWebsiteTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="OfficialWebsiteTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="ContactPerson" runat="server" Text="負責窗口" AssociatedControlID="ContactPersonTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="ContactPersonTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="CP_Phone" runat="server" Text="負責窗口電話" AssociatedControlID="CP_PhoneTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="CP_PhoneTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="CP_Email" runat="server" Text="負責窗口E-mail" AssociatedControlID="CP_EmailTextBox" CssClass="col-2"></asp:Label>
            <asp:TextBox ID="CP_EmailTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="CompanyScale" runat="server" Text="公司規模" CssClass="col-2"></asp:Label>
            <asp:DropDownList ID="CompanyScaleDropDownList" runat="server" CssClass="col-4" DataSourceID="CompanyScales" DataTextField="CompanyScale" DataValueField="CompanyScale" AppendDataBoundItems="True">
                <asp:ListItem>未選擇</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="CompanyScales" ConnectionString='<%$ ConnectionStrings:CRMConnectionString1 %>' SelectCommand="SELECT [CompanyScale] FROM [CRM_CompanyScales]"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:Label ID="CompanyCategory" runat="server" Text="產業類別" CssClass="col-2"></asp:Label>
            <asp:DropDownList ID="CompanyCategoryDropDownList" runat="server" CssClass="col-4" DataSourceID="CompanyCategorys" DataTextField="CompanyCategory" DataValueField="CompanyCategory" AppendDataBoundItems="True">
                <asp:ListItem>未選擇</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="CompanyCategorys" ConnectionString='<%$ ConnectionStrings:CRMConnectionString1 %>' SelectCommand="SELECT [CompanyCategory] FROM [CRM_CompanyCategorys]"></asp:SqlDataSource>
        </div>
        <br />
        <div>
            <asp:Button ID="InsertBtn" CssClass="btn btn-info offset-2 col-1" runat="server" Text="新增" OnClick="InsertBtn_Click" />
            <asp:Button ID="UpdateBtn" CssClass="btn btn-info col-1" runat="server" Text="修改" OnClick="UpdateBtn_Click" />
            <asp:Button ID="CancelBtn" CssClass="btn btn-info col-1" runat="server" Text="取消" OnClick="CancelBtn_Click" />
            <asp:Button ID="Demobtn" CssClass="btn btn-default offset-2 col-1" runat="server" Text="Demo" OnClick="Demobtn_Click" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
<%--    <script src="Scripts/sweetalert2.min.js"></script>--%>

<%--    <script>
        $(function () {

            $("#InsertBtn").click(function () {

                swal({
                    title: '確認新增',
                    text: "客戶資料新增成功!",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {
                        $("#__EVENTTARGET").val("Button1");
                        $("#form1").submit();
                    });
            });

        });
    </script>--%>
</asp:Content>

