<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AMS_07_NoPermissions.aspx.vb" Inherits="AMS_07_NoPermissions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="Content/sweetalert2.min.css" rel="stylesheet" />
    <link href="Content/OnepointStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    權限不足
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script src="Scripts/sweetalert2.min.js"></script>
    <script>
        var url;
        $(function () {
            url = ($("#urlHiddenField").val()).split(",");
        });

        swal({
            title: 'Oops!!!權限不足',
            type: 'warning',
            confirmButtonText: '確定'
        }).then(function () {
            location.href = url[2];
        });


    </script>
</asp:Content>

