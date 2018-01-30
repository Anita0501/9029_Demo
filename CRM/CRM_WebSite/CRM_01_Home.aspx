<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_01_Home.aspx.cs" Inherits="_01_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">CRM System</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="container">
        <ul>
            <li>
                <asp:HyperLink ID="Customer" runat="server" NavigateUrl="~/02_Customer.aspx">客戶資料管理</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="CustomerTotal" runat="server" NavigateUrl="~/03_CustomerTotal.aspx">客戶資料列表</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="BusinessSchedule" runat="server" NavigateUrl="~/04_BusinessSchedule.aspx">業務行程管理</asp:HyperLink>
            </li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
</asp:Content>

