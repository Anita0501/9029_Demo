<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AMS_08_ResetEmployeePassword.aspx.cs" Inherits="AMS_08_ResetEmployeePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="Content/OnepointStyleSheet.css" rel="stylesheet" />
    <link href="Content/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    帳戶管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">帳戶管理</li>
    <li class="breadcrumb-item active">重設員工密碼</li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">修改密碼</h3>
                        </div>
                        <div class="card-body">

                            <div class="form-group row">
                                <asp:Label ID="Label2" runat="server" Text="員工編號" CssClass="col-sm-3 deep-font-colour form-control-label" AssociatedControlID="EmpIdTextBox"></asp:Label>
                                <div class="col-4">
                                    <asp:TextBox ID="EmpIdTextBox" runat="server" CssClass="form-control col-12"></asp:TextBox>

                                </div>
                                <asp:Button ID="ShowButton" runat="server" class="btn btn-info" Text="查詢員工" OnClick="ShowButton_Click" />
                            </div>

                            <asp:Label ID="empInfoLabel" runat="server" Text="" CssClass="offset-3"></asp:Label>

                            <div class="form-group row">
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-4 offset-sm-3">
                                    <asp:Button ID="SubmitButton" runat="server" class="col-3 btn btn-primary" Text="修改密碼" OnClick="SubmitButton_Click" />


                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script src="Scripts/sweetalert2.min.js"></script>
    <script>

        function changeSuccess() {
            swal({
                title: '修改完成!',
                text: '',
                type: 'success',
                confirmButtonText: '確定'
            }).then(function () {
                location.href = "AMS_08_ResetEmployeePassword.aspx";
            });
        }

    </script>


</asp:Content>

