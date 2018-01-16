<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="03_Sel_Del_Customer.aspx.cs" Inherits="_03_Sel_Del_Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
        <div>
        <asp:Label ID="DeleteLab" runat="server" Text="公司統編:"></asp:Label>
        <asp:TextBox ID="DeleteTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="DeleteBtn" runat="server" Text="刪除" OnClick="DeleteBtn_Click" />
    </div>
    <hr />

        <div>
<%--        <asp:Label ID="SelectLab" runat="server" Text="公司統編:"></asp:Label>
        <asp:TextBox ID="SelectTextBox" runat="server"></asp:TextBox>--%>
        <asp:Button ID="SelectBtn" runat="server" Text="查詢" OnClick="SelectBtn_Click" />
    </div>
    <hr />
    <div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </div>
    <br />

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" Runat="Server">
</asp:Content>

