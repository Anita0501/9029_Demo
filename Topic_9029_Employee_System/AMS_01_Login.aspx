<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMS_01_Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="Content/style.default.css">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="Content/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <link href="Content/LoginStyleSheet.css" rel="stylesheet" />

    <!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="Scripts/front.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="page login-page">
                <div class="container d-flex align-items-center">
                    <div class="form-holder has-shadow">
                        <div class="row">
                            <!-- Logo & Information Panel-->
                            <!--左邊大大歡迎字體-->
                            <div class="col-lg-6">
                                <div class="info d-flex align-items-center">
                                    <div class="content">
                                        <div class="logo">
                                            <h1>Dashboard</h1>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Form Panel    -->
                            <div class="col-lg-6 bg-white">
                                <div class="form d-flex align-items-center">
                                    <div class="content">
                                        <%--<form id="login-form" method="post">--%>
                                        <div class="form-group">
                                            <asp:TextBox ID="EmpIDTextBox" runat="server" CssClass="input-material"></asp:TextBox>
                                            <asp:Label ID="Label1" runat="server" Text="員工編號" AssociatedControlID="EmpIDTextBox" class="label-material"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="input-material" TextMode="Password"></asp:TextBox>
                                            <asp:Label ID="Label2" runat="server" Text="密碼" AssociatedControlID="PasswordTextBox" class="label-material"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="VerificationCodeTextBox" runat="server" CssClass="input-material"></asp:TextBox>
                                            <asp:Label ID="Label3" runat="server" Text="驗證碼" AssociatedControlID="VerificationCodeTextBox" class="label-material"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:ImageButton ID="VerificationCodeButton" runat="server" BorderStyle="None" OnClick="VerificationCodeButton_Click" />
                                        </div>
                                        <div id="warningMessage" class="form-group">

                                            <asp:Label ID="WarningLabel" runat="server" Text="" CssClass="warning"></asp:Label>

                                        </div>
                                        <asp:Button ID="LoginButton" runat="server" Text="登入" CssClass="btn btn-dark" OnClick="LoginButton_Click"></asp:Button>
                                        <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                                        <%--</form>--%>

                                        <asp:Button ID="demoLogin" runat="server" Text="管理者" CssClass="btn btn-dark" OnClick="demoLogin_Click" />
                                        <asp:Button ID="demoLogin2" runat="server" Text="一般使用者" CssClass="btn btn-dark" OnClick="demoLogin2_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="copyrights text-center">
                    <%--<p>Design by <a href="https://bootstrapious.com/admin-templates" class="external">Bootstrapious</a></p>--%>
                    <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                </div>
            </div>

        </div>
    </form>
</body>
</html>
