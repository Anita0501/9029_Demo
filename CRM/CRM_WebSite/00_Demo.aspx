<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="00_Demo.aspx.cs" Inherits="Demo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" Runat="Server">
    放自訂CSS的地方
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
    放網頁標題
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" Runat="Server">
    <%--SITE MAP 範例--%>
        <li class="breadcrumb-item">帳戶管理</li>
    <li class="breadcrumb-item active">新增使用者</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    寫你們的全部的東西
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" Runat="Server">
    放JS的地方
</asp:Content>

