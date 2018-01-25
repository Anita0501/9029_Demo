<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="03_CustomerTotal.aspx.cs" Inherits="_03_Sel_Del_Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">客戶資料管理</li>
    <li class="breadcrumb-item">查詢與刪除客戶資料</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="container">
        <asp:label id="DeleteLab" runat="server" text="公司統編:"></asp:label>
        <asp:textbox id="DeleteTextBox" runat="server"></asp:textbox>
        <asp:button id="DeleteBtn" runat="server" text="刪除" onclick="DeleteBtn_Click" />
    </div>

    <div class="container">
        <%--        <asp:Label ID="SelectLab" runat="server" Text="公司統編:"></asp:Label>
        <asp:TextBox ID="SelectTextBox" runat="server"></asp:TextBox>--%>
        <asp:button id="SelectBtn" runat="server" text="查詢" onclick="SelectBtn_Click" />
    </div>
    <hr />
    <div>
        <asp:gridview id="GridView1" runat="server">
        </asp:gridview>
    </div>
    <br />

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
</asp:Content>

