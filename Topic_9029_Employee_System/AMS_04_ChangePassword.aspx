<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AMS_04_ChangePassword.aspx.cs" Inherits="AMS_04_FirstLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <%--<link href="Content/sweetalert2.min.css" rel="stylesheet" />--%>
    <link href="Content/OnepointStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    帳戶管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">帳戶管理</li>
    <li class="breadcrumb-item active">修改個人密碼</li>
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
                                <asp:Label ID="Hint" runat="server" Text="" CssClass="offset-3 warning form-control-label"></asp:Label>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="Label1" runat="server" Text="員工編號" CssClass="col-sm-3 deep-font-colour form-control-label" AssociatedControlID="EmpIDTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="EmpIDTextBox" runat="server" Enabled="false" CssClass="form-control col-8"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label2" runat="server" Text="員工姓名" CssClass="col-sm-3 deep-font-colour form-control-label" AssociatedControlID="EmpNameTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="EmpNameTextBox" runat="server" Enabled="false" CssClass="form-control col-8"></asp:TextBox>
                                </div>
                            </div>

                            <br />
                            <div class="form-group row">
                                <asp:Label ID="Label5" runat="server" Text="輸入舊密碼" CssClass="col-sm-3 deep-font-colour form-control-label" AssociatedControlID="OPasswordTextBox" ></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="OPasswordTextBox" runat="server" CssClass="form-control col-8" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="OPasswordTextBox" ErrorMessage="必填欄位" CssClass="warning small-font"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="Label4" runat="server" Text="輸入密碼" CssClass="col-sm-3 deep-font-colour form-control-label" AssociatedControlID="PasswordTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control col-8" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="必填欄位" CssClass="warning small-font"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="Label3" runat="server" Text="再次輸入密碼" CssClass="col-sm-3 deep-font-colour form-control-label" AssociatedControlID="PasswordTextBox2"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="PasswordTextBox2" runat="server" CssClass="form-control col-8" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox2" ErrorMessage="必填欄位" CssClass="warning small-font"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                         
                            <div class="form-group row">
                                <div class="offset-3 col-sm-9">
                                    <asp:Label ID="warningLable" runat="server" Text="" CssClass="warning"></asp:Label>
                                </div>
                            </div>

                            <div class="line"></div>
                            <div class="form-group row">
                                <div class="col-sm-4 offset-sm-3">
                                    <asp:Button ID="SubmitButton" runat="server" class="col-3 btn btn-primary" Text="確認" OnClick="SubmitButton_Click" />
                                    <input id="ClearButton" type="reset" value="全部清除" class="offset-1 col-4 btn btn-danger" />
                                    <asp:Button ID="DemoButton" runat="server" class="col-3 btn btn-info" Text="Demo" />
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
    <%--<script src="Scripts/sweetalert2.min.js"></script>--%>
    <script>

        var url;
        $(function () {
            $("#ChangePersonalPW").addClass("active");
            loginUrl = $("#urlHiddenField").val();
        });
        function changeSuccess() {
            swal({
                title: '修改完成!請重新登入',
                text: '請再次登入',
                type: 'success',
                confirmButtonText: '確定'
            }).then(function () {
                location.href = loginUrl;
            });
        }
        function changeFailed() {
            swal({
                title: 'Oops',
                text: '修改失敗',
                type: 'error',
                confirmButtonText: '確定'
            });
        }

    </script>
</asp:Content>

