<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AMS_06_ViewDepartment.aspx.vb" Inherits="AMS_06_ViewDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="Content/jsgrid.min.css" rel="stylesheet" />
    <link href="Content/jsgrid-theme.min.css" rel="stylesheet" />
    <link href="Content/sweetalert2.min.css" rel="stylesheet" />
    <link href="Content/OnepointStyleSheet.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    檢視部門
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">帳戶管理</li>
    <li class="breadcrumb-item active">檢視部門</li>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="offset-10 col-2">
                    <asp:Button ID="Button1" runat="server" Text="編輯部門" CssClass="btn btn-default" />
                </div>
                <div class="col-12"></div>
                <div class="col-lg-12">
                    <div class="card">
                        <div id="jsGrid"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script src="Scripts/jsgrid.min.js"></script>
    <script src="Scripts/sweetalert2.min.js"></script>
    <script src="Scripts/side-team-member-bio-main.js"></script>
    <script src="Scripts/modernizr.js"></script>
    <script>

        $(function () {
            $("#ViewDepartment").addClass("active");
        });

        $("#jsGrid").jsGrid({
            height: "auto",
            width: "100%",
            sorting: true,
            paging: false,
            autoload: true,
            filtering: false,

            controller: {
                loadData: function (filter) {
                    var data = $.Deferred();
                    $.ajax({
                        async: false,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        url: "api/Department",
                        dataType: "json"
                    }).done(function (response) {
                        data.resolve(response);
                    });
                    return data.promise();
                }
            },
            fields: [
                { name: "DepartmentID", title: "編號", type: "text" },
                { name: "DepartmentName", title: "部門", type: "text" },

            ],
            rowDoubleClick: function (args) {
                var getData = args.item;
                var keys = Object.keys(getData);
                var text = [];

                $.each(keys, function (idx, value) {
                    //text.push(value + " : " + getData[value])
                    text.push(getData[value])
                });

                swal({
                    title: text[1] ,
                    html: '編號:' + text[0] +
                    '<br/>部門:' + text[1] 
                    ,

                    animation: true
                });
            }
        });
    </script>
</asp:Content>

