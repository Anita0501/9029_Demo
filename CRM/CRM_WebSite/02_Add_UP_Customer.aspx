<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="02_Add_UP_Customer.aspx.cs" Inherits="_02_AddCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">客戶資料管理</li>
    <li class="breadcrumb-item active">新增與修改客戶資料</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <div>
        <div>
            <asp:Label ID="CompanyID" runat="server" Text="統編" AssociatedControlID="CompanyIDTextBox"></asp:Label>
            <asp:TextBox ID="CompanyIDTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="CompanyName" runat="server" Text="公司名稱" AssociatedControlID="CompanyNameTextBox"></asp:Label>
            <asp:TextBox ID="CompanyNameTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="CompanyAddress" runat="server" Text="公司地址" AssociatedControlID="CompanyAddressTextBox"></asp:Label>
            <asp:TextBox ID="CompanyAddressTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="CompanyPhone" runat="server" Text="公司電話" AssociatedControlID="CompanyPhoneTextBox"></asp:Label>
            <asp:TextBox ID="CompanyPhoneTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="OfficialWebsite" runat="server" Text="公司官網" AssociatedControlID="OfficialWebsiteTextBox"></asp:Label>
            <asp:TextBox ID="OfficialWebsiteTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="ContactPerson" runat="server" Text="負責窗口" AssociatedControlID="ContactPersonTextBox"></asp:Label>
            <asp:TextBox ID="ContactPersonTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="CP_Phone" runat="server" Text="負責窗口電話" AssociatedControlID="CP_PhoneTextBox"></asp:Label>
            <asp:TextBox ID="CP_PhoneTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="CP_Email" runat="server" Text="負責窗口E-mail" AssociatedControlID="CP_EmailTextBox"></asp:Label>
            <asp:TextBox ID="CP_EmailTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <%--專題第三階段需要欄位--%>
            <asp:Label ID="CompanyScale" runat="server" Text="公司規模"></asp:Label>
            <asp:DropDownList ID="CompanyScaleDropDownList" runat="server">
                <asp:ListItem>請選擇公司規模</asp:ListItem>
                <asp:ListItem>100萬以下</asp:ListItem>
                <asp:ListItem>101萬-500萬</asp:ListItem>
                <asp:ListItem>501萬-1000萬</asp:ListItem>
                <asp:ListItem>1001萬-3000萬</asp:ListItem>
                <asp:ListItem>3001萬-5000萬</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="CompanyCategory" runat="server" Text="產業類別"></asp:Label>
            <asp:DropDownList ID="CompanyCategoryDropDownList" runat="server">
                <asp:ListItem>請選擇產業類別</asp:ListItem>
                <asp:ListItem>軟體及網路相關業</asp:ListItem>
                <asp:ListItem>電信及通訊相關業</asp:ListItem>
                <asp:ListItem>電腦及消費性電子製造業</asp:ListItem>
                <asp:ListItem>光電及光學相關業</asp:ListItem>
                <asp:ListItem>電子零組件相關業</asp:ListItem>
                <asp:ListItem>半導體業</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <asp:Button ID="InsertBtn" runat="server" Text="新增" OnClick="InsertBtn_Click" />
        <asp:Button ID="CancelBtn" runat="server" Text="取消" OnClick="CancelBtn_Click" />
        <asp:Button ID="Demobtn" runat="server" Text="DemoData" OnClick="Demobtn_Click" />
    </div>
    <hr />
    <br />
    <br />
    <div>
        <div>

            <asp:Label ID="UCompanyID" runat="server" Text="統編:"></asp:Label>
            <asp:TextBox ID="UCompanyIDTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="UCompanyName" runat="server" Text="公司名稱" AssociatedControlID="CompanyNameTextBox"></asp:Label>
            <asp:TextBox ID="UCompanyNameTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="UCompanyAddress" runat="server" Text="公司地址" AssociatedControlID="CompanyAddressTextBox"></asp:Label>
            <asp:TextBox ID="UCompanyAddressTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="UCompanyPhone" runat="server" Text="公司電話" AssociatedControlID="CompanyPhoneTextBox"></asp:Label>
            <asp:TextBox ID="UCompanyPhoneTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="UOfficialWebsite" runat="server" Text="公司官網" AssociatedControlID="OfficialWebsiteTextBox"></asp:Label>
            <asp:TextBox ID="UOfficialWebsiteTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="UContactPerson" runat="server" Text="負責窗口" AssociatedControlID="ContactPersonTextBox"></asp:Label>
            <asp:TextBox ID="UContactPersonTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="UCP_Phone" runat="server" Text="負責窗口電話" AssociatedControlID="CP_PhoneTextBox"></asp:Label>
            <asp:TextBox ID="UCP_PhoneTextBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="UCP_Email" runat="server" Text="負責窗口E-mail" AssociatedControlID="CP_EmailTextBox"></asp:Label>
            <asp:TextBox ID="UCP_EmailTextBox" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="UpdateBtn" runat="server" Text="修改" OnClick="UpdateBtn_Click" />
    </div>

    <hr />
    <br />

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
</asp:Content>

