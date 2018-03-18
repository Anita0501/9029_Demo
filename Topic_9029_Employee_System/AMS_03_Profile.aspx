<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AMS_03_Profile.aspx.cs" Inherits="_03_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="Content/sweetalert2.min.css" rel="stylesheet" />
    <link href="/Content/MasterStyleSheet.css" rel="stylesheet" />
    <link href="Content/OnepointStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    個人資訊
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">帳戶管理</li>
    <li class="breadcrumb-item active">個人資訊</li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">個人基本資訊</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <asp:Button ID="EditButton" runat="server" Text="編輯個人資訊" CssClass="col-sm-2 offset-sm-9 btn btn-info" OnClick="EditButton_Click" />
                            </div>

                            <div class="form-group row">
                                <div class="offset-2 col-sm-9">
                                    <asp:Image ID="EmpImage" runat="server" Height="250px" Width="250px" />
                                </div>
                            </div>

                            <div class="form-group row" id="ImageUpload">
                                <asp:Label ID="ImageLabel" runat="server" Text="更換照片" CssClass="col-sm-2 deep-font-colour form-control-label hide" AssociatedControlID="FileUpload1"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="hide" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label1" runat="server" Text="員工編號" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="EmpIDTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="EmpIDTextBox" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label2" runat="server" Text="員工姓名" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="EmpNameTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="EmpNameTextBox" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label3" runat="server" Text="部門" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="DepatmentDropDownList"></asp:Label>
                                <div class="col-sm-9 select ">
                                    <asp:DropDownList ID="DepatmentDropDownList" runat="server" CssClass="form-control nice-select wide" Enabled="false">
                                        <asp:ListItem Text="請選擇部門" Value="0">
                                        </asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label4" runat="server" Text="職稱" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="JobTitleTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="JobTitleTextBox" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label5" runat="server" Text="角色" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="PermissionsDropDownList"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="PermissionsDropDownList" runat="server" CssClass="form-control nice-select wide" Enabled="false">
                                        <asp:ListItem Text="請選擇權限角色" Value="0">
                                        </asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label10" runat="server" Text="分機" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="ExtTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="ExtTextBox" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-group row">
                                <asp:Label ID="DutyDateLabel" runat="server" Text="到職日期" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="DutyDate"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="DutyDate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-group row">
                                <asp:Label ID="Label6" runat="server" Text="生日" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="Birthday"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="Birthday" runat="server" CssClass="form-control" data-lang="zh" data-format="Y/m/d" data-min-year="1950"
                                        data-large-mode="true" data-large-default="true" data-modal="true" data-theme="vanilla" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label7" runat="server" Text="手機號碼" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="CellphoneTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="CellphoneTextBox" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label11" runat="server" Text="現居地址" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="AddressTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="Label9" runat="server" Text="電子信箱" CssClass="col-sm-2 deep-font-colour form-control-label" AssociatedControlID="EmailTextBox"></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="form-group row" id="ButtonGroup">
                                <asp:Button ID="SubmitButton" runat="server" Text="確定" CssClass="hide" OnClick="SubmitButton_Click" />
                                <asp:Button ID="CancelButton" runat="server" Text="取消" CssClass="hide" OnClick="CancelButton_Click" />
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-4 offset-sm-3">
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

        var empInfo = ($("#EmployeeHiddenField").val()).split(",");
        var apiUrl = "api/PermissionsByEmployeeId/" + empInfo[0];

        $(document).ready(function () {
            $("#Profile").addClass("active");
            //url = ($("#urlHiddenField").val()).split(",");
        });

        var siteArray;
        $.ajax({
            async: false,
            type: "GET",
            contentType: "application/json; charset=utf-8",
            url: apiUrl,
            dataType: "json"
        }).done(function (response) {
            siteArray = response;
        });

        var profileUrl;
        for (var i = 0; i < siteArray.length; i++) {
            if (siteArray[i].SiteId == 101) {
                profileUrl = siteArray[i].Url;
                break;
            }
        }

        function changeSuccess() {
            swal({
                title: '修改完成!',
                text: '',
                type: 'success',
                confirmButtonText: '確定'
            }).then(function () {
                location.href = profileUrl;
            });
        }
        function changeFailed() {
            swal({
                title: 'Oops',
                text: '修改失敗',
                type: 'error',
                confirmButtonText: '確定'
            }).then(function () {
                location.href = profileUrl;
            });
        }
    </script>

</asp:Content>



