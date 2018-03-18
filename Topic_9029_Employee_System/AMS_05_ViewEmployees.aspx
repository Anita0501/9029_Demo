<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AMS_05_ViewEmployees.aspx.cs" Inherits="AMS_05_ViewEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="Content/jsgrid.min.css" rel="stylesheet" />
    <link href="Content/jsgrid-theme.min.css" rel="stylesheet" />
    <link href="Content/sweetalert2.min.css" rel="stylesheet" />
    <%--    <link href="Content/side-team-member-bio-style.css" rel="stylesheet" />
    <link href="Content/side-team-member-bio-reset.css" rel="stylesheet" />--%>
    <link href="/Content/MasterStyleSheet.css" rel="stylesheet" />
    <link href="Content/OnepointStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    帳戶管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">帳戶管理</li>
    <li class="breadcrumb-item active">檢視員工資料</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">員工資訊</h3>
                            <asp:Button ID="Button1" runat="server" Text="匯出Excel" CssClass="offset-10 btn btn-info" OnClick="Button1_Click" />
                        </div>

                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="EmployeeID">

                            <EditItemTemplate>
                                <tr class="col-lg-12">

                                    <td>
                                        <asp:Label Text='<%# Eval("EmployeeID") %>' runat="server" ID="EmployeeIDLabel1" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" Style="width: 50px;" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("JobTitle") %>' runat="server" ID="JobTitleTextBox" Style="width: 50px;" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("RoleName") %>' runat="server" ID="RoleIDTextBox" Style="width: 80px;" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("DepartmentName") %>' runat="server" ID="DepartmentIDTextBox" Style="width: 50px;" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("DutyDate") %>' runat="server" ID="DutyDateTextBox" Style="width: 80px;" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("Ext") %>' runat="server" ID="ExtTextBox" Style="width: 40px;" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /></td>
                                    <td>
                                        <asp:Button runat="server" CommandName="Update" Text="更新" ID="UpdateButton" CssClass="btn btn-sm" OnClick="UpdateButton_Click" />
                                        <asp:Button runat="server" CommandName="Cancel" Text="取消" ID="CancelButton" CssClass="btn btn-sm" OnClick="CancelButton_Click" />
                                    </td>
                                </tr>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <tr>

                                    <td>
                                        <asp:Label Text='<%# Eval("EmployeeID") %>' runat="server" ID="EmployeeIDLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("JobTitle") %>' runat="server" ID="JobTitleLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("RoleName") %>' runat="server" ID="RoleIDLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("DepartmentName") %>' runat="server" ID="DepartmentIDLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# DateTime.Parse((Eval("DutyDate").ToString())).ToShortDateString() %>' runat="server" ID="DutyDateLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Ext") %>' runat="server" ID="ExtLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>
                                    <td>

                                        <asp:Button runat="server" CommandName="Edit" Text="編輯" ID="EditButton" CssClass="btn btn-sm" OnClick="EditButton_Click" />
                                        <asp:Button runat="server" CommandName="Delete" Text="刪除" ID="DeleteButton" CssClass="btn btn-sm" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table>
                                    <table runat="server" id="itemPlaceholderContainer" class="table table-striped table-hover col-12">
                                        <tr runat="server">

                                            <th runat="server">員工編號</th>
                                            <th runat="server">姓名</th>
                                            <th runat="server">職稱</th>
                                            <th runat="server">角色</th>
                                            <th runat="server">部門</th>
                                            <th runat="server">到職日期</th>
                                            <th runat="server">分機</th>
                                            <th runat="server">信箱</th>
                                            <th runat="server"></th>
                                        </tr>
                                        <tr runat="server" id="itemPlaceholder"></tr>
                                    </table>
                                    <tr runat="server">
                                        <td runat="server">
                                            <asp:DataPager runat="server" ID="DataPager1">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-sm"></asp:NextPreviousPagerField>
                                                    <asp:NumericPagerField></asp:NumericPagerField>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-sm"></asp:NextPreviousPagerField>
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Button runat="server" CommandName="Delete" Text="刪除" ID="DeleteButton" CssClass="btn btn-sm" OnClick="DeleteButton_Click" />
                                        <asp:Button runat="server" CommandName="Edit" Text="編輯" ID="EditButton" CssClass="btn btn-sm" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Eval("EmployeeID") %>' runat="server" ID="EmployeeIDLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("JobTitle") %>' runat="server" ID="JobTitleLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("RoleID") %>' runat="server" ID="RoleIDLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("DepartmentID") %>' runat="server" ID="DepartmentIDLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("DutyDate") %>' runat="server" ID="DutyDateLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Ext") %>' runat="server" ID="ExtLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:employeesDatabase %>' DeleteCommand="DELETE FROM [AMS_Employee] WHERE [EmployeeID] = @EmployeeID; DELETE FROM [AMS_EmployeePermission] WHERE [EmployeeID] = @EmployeeID;DELETE FROM [SEP_Friend] WHERE [EmployeeID] = @EmployeeID;DELETE FROM [SEP_Friend] WHERE [friends] = @EmployeeID;DELETE FROM [SEP_Article] WHERE [EmployeeID] = @EmployeeID;DELETE FROM [SEP_inviteFriend] WHERE [InviterId] = @EmployeeID;DELETE FROM [SEP_inviteFriend] WHERE [Invited] = @EmployeeID;" InsertCommand="INSERT INTO [AMS_Employee] ([EmployeeID], [Name], [JobTitle], [RoleID], [DepartmentID], [DutyDate], [Ext], [Email]) VALUES (@EmployeeID, @Name, @JobTitle, @RoleID, @DepartmentID, @DutyDate, @Ext, @Email)" SelectCommand="SELECT [EmployeeID], [Name], [JobTitle], r.RoleName, d.departmentName, [DutyDate], [Ext], [Email]  FROM [AMS_Employee] as e join [AMS_Department] as d on e.DepartmentID = d.departmentId join [AMS_Role] as r on e.RoleID = r.RoleId" UpdateCommand="UPDATE [AMS_Employee] SET [Name] = @Name, [JobTitle] = @JobTitle, [DutyDate] = @DutyDate, [Ext] = @Ext, [Email] = @Email WHERE [EmployeeID] = @EmployeeID">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeID" Type="String"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="JobTitle" Type="String"></asp:Parameter>
            <asp:Parameter Name="RoleID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="DepartmentID" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="DutyDate"></asp:Parameter>
            <asp:Parameter Name="Ext" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="JobTitle" Type="String"></asp:Parameter>
            <asp:Parameter Name="RoleID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="DepartmentID" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="DutyDate"></asp:Parameter>
            <asp:Parameter Name="Ext" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmployeeID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script src="Scripts/jsgrid.min.js"></script>
    <script src="Scripts/sweetalert2.min.js"></script>
    <script src="Scripts/side-team-member-bio-main.js"></script>
    <script src="Scripts/modernizr.js"></script>
    <script>


        $(function () {
            $("#ViewEmployees").addClass("active");
            $("#ainContentPlaceHolder_ListView1_itemPlaceholderContainer").addClass("table").addClass("table-striped").addClass("table-hover");
        });


        function changeSuccess() {
            swal({
                title: '修改成功',
                text: '修改成功',
                type: 'success',
                confirmButtonText: '確定'
            }).then(function () {
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

        function IsDelete() {
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    swal(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                    )
                }
            })
        }


    </script>
</asp:Content>

