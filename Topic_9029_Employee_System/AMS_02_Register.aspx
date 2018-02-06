<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AMS_02_Register.aspx.cs" Inherits="Register" %>


<asp:Content ID="Content3" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="Content/nice-select.css" rel="stylesheet" />
    <link href="Content/datedropper.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <link href="Content/OnepointStyleSheet.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    新增使用者
</asp:Content>

<asp:Content ID="SiteMapContent" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="server">
    <li class="breadcrumb-item">帳戶管理</li>
    <li class="breadcrumb-item active">新增使用者</li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">員工基本資訊</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <asp:Label ID="Label1" runat="server" Text="員工編號" CssClass="col-sm-2 form-control-label" AssociatedControlID="EmpIDTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="EmpIDTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:Label ID="EmpIdWarningLabel" runat="server" Text="" CssClass="hide"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="員工編號不可空白" ControlToValidate="EmpIDTextBox" CssClass="warning small-font"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label2" runat="server" Text="員工姓名" CssClass="col-sm-2 form-control-label" AssociatedControlID="EmpNameTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="EmpNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="姓名不可空白" ControlToValidate="EmpNameTextBox" CssClass="warning small-font"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label3" runat="server" Text="部門" CssClass="col-sm-2 form-control-label" AssociatedControlID="DepatmentDropDownList"></asp:Label>
                                <div class="col-sm-9 select ">
                                    <asp:DropDownList ID="DepatmentDropDownList" runat="server" CssClass="form-control nice-select wide">
                                        <asp:ListItem Text="請選擇部門" Value="0">
                                        </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="請選擇部門" InitialValue="0" ControlToValidate="DepatmentDropDownList" CssClass="warning small-font"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label4" runat="server" Text="職稱" CssClass="col-sm-2 form-control-label" AssociatedControlID="JobTitleTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="JobTitleTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="職稱不可空白" ControlToValidate="JobTitleTextBox" CssClass="warning small-font"></asp:RequiredFieldValidator>

                                </div>

                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label5" runat="server" Text="角色" CssClass="col-sm-2 form-control-label" AssociatedControlID="RoleDropDownList"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="RoleDropDownList" runat="server" CssClass="form-control nice-select wide">
                                        <asp:ListItem Text="請選擇權限角色" Value="0">
                                        </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="請選擇權限角色" InitialValue="0" ControlToValidate="RoleDropDownList" CssClass="warning small-font"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label10" runat="server" Text="分機" CssClass="col-sm-2 form-control-label" AssociatedControlID="ExtTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="ExtTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="分機不可空白" ControlToValidate="ExtTextBox" CssClass="warning small-font"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="DutyDateLabel" runat="server" Text="到職日期" CssClass="col-sm-2 form-control-label" AssociatedControlID="DutyDate"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="DutyDate" runat="server" CssClass="form-control" data-lang="zh" data-format="Y/m/d" data-min-year="1950"
                                        data-large-mode="true" data-large-default="true" data-modal="true" data-theme="vanilla"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="到職日期不可空白" ControlToValidate="DutyDate" CssClass="warning small-font"></asp:RequiredFieldValidator>

                                </div>
                            </div>


                            <div class="form-group row">
                                <asp:Label ID="Label6" runat="server" Text="生日" CssClass="col-sm-2 form-control-label" AssociatedControlID="Birthday"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="Birthday" runat="server" CssClass="form-control" data-lang="zh" data-format="Y/m/d" data-min-year="1950"
                                        data-large-mode="true" data-large-default="true" data-modal="true" data-theme="vanilla"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="生日不可空白" ControlToValidate="Birthday" CssClass="warning small-font"></asp:RequiredFieldValidator>

                                </div>
                            </div>


                            <div class="form-group row">
                                <asp:Label ID="Label7" runat="server" Text="手機號碼" CssClass="col-sm-2 form-control-label" AssociatedControlID="CellphoneTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="CellphoneTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="手機號碼不可空白" ControlToValidate="CellphoneTextBox" CssClass="warning small-font"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label11" runat="server" Text="現居地址" CssClass="col-sm-2 form-control-label" AssociatedControlID="AddressTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="地址不可空白" ControlToValidate="AddressTextBox" CssClass="warning small-font"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label9" runat="server" Text="電子信箱" CssClass="col-sm-2 form-control-label" AssociatedControlID="EmailTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="電子信箱不可空白" ControlToValidate="EmailTextBox" CssClass="warning small-font"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="Label8" runat="server" Text="大頭照" CssClass="col-sm-2 form-control-label" AssociatedControlID="IconFileUpload"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:FileUpload ID="IconFileUpload" runat="server" />
                                    <asp:Label ID="FileUpLoadWaenLabel" runat="server" Text="" CssClass="hide"></asp:Label>
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="form-group row">
                                <div class="col-sm-4 offset-sm-3">
                                    <asp:Button ID="SubmitButton" runat="server" class="btn btn-primary" Text="新增" OnClick="SubmitButton_Click" />

                                    <asp:Button ID="CancelButton" runat="server" class="btn btn-secondary" Text="取消" OnClick="CancelButton_Click" ValidationGroup="not-submit" />
                                    <input id="ClearButton" type="reset" value="全部清除" class="btn btn-danger" />
                                    <input id="DemoButton" type="button" value="Demo" class="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="JavaScriptContent" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="server">
    <script src="Scripts/OnepointJavaScript.js"></script>
    <script src="Scripts/jquery.nice-select.min.js"></script>
    <script src="Scripts/datedropper.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').niceSelect();
            $("#AddUser").addClass("active");
            $("#MainContentPlaceHolder_IconFileUpload").addClass("btn").addClass("btn-sm");

            $("#DemoButton").click(function () {
                $("#MainContentPlaceHolder_EmpIDTextBox").val("N1130");
                $("#MainContentPlaceHolder_EmpNameTextBox").val("林怡君");
                $("#MainContentPlaceHolder_JobTitleTextBox").val("企劃專員");
                $("#MainContentPlaceHolder_ExtTextBox").val("116");
                $("#MainContentPlaceHolder_CellphoneTextBox").val("0928081255");
                $("#MainContentPlaceHolder_AddressTextBox").val("台北市中山區民生東路三段75號");
                $("#MainContentPlaceHolder_EmailTextBox").val("PigIsBest@gmail.com");
            });
        });

        $("#MainContentPlaceHolder_DutyDate").dateDropper();
        $("#MainContentPlaceHolder_Birthday").dateDropper();

        var empInfo = $("#EmployeeHiddenField").val().split(',');
        var apiUrl = "api/PermissionsByEmployeeId/" + empInfo[0];

        var registerUrl;
        $.ajax({
            async: false,
            type: "GET",
            contentType: "application/json; charset=utf-8",
            url: apiUrl,
            dataType: "json"
        }).done(function (response) {
            for (var i = 0; i < response.length; i++) {
                if (response[i].SiteId == 102) {
                    registerUrl = response[i].Url;
                    break;
                }
            }
        });

        function changeSuccess() {
            swal({
                title: '新增成功',
                text: '新增成功',
                type: 'success',
                confirmButtonText: '確定'
            }).then(function () {
                location.href = registerUrl;
            });
        }
        function changeFailed() {
            swal({
                title: 'Oops',
                text: '員工編號已存在',
                type: 'error',
                confirmButtonText: '確定'
            });
        }

        function insertFailed_file() {
            swal({
                title: 'Oops',
                text: '請上傳照片',
                type: 'error',
                confirmButtonText: '確定'
            });
        }

    </script>
</asp:Content>

