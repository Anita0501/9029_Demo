<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="13_remand.aspx.cs" Inherits="Demo" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <%--放自訂CSS的地方--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    <%--放網頁標題--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <%--SITE MAP 範例--%>
    <li class="breadcrumb-item">資產器材租借管理</li>
    <li class="breadcrumb-item active">器材歸還</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <%--寫你們的全部的東西<br />--%>
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
            <tr style="">
                <%--<th ><%# Eval("Id") %></th>--%>

                <th scope="row"><%# Eval("EquipmentName") %></th>
                <td><%# Eval("UserName") %></td>
                <td><%# Eval("Unit") %></td>
                <td><%# Eval("BorrowStartDate") %></td>
                <td><%# Eval("BorrowEndDate") %></td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("EquipmentID","~/03_Ed/14_remand2.aspx?id={0}") %>'>
                        <asp:Image ID="Image1" ImageUrl="~/img/testIcon.png" AlternateText="" Width="20px" Height="15px" BorderWidth="0" runat="server" />
                    </asp:HyperLink>
                </td>
                <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                <%--<td><%# Eval("Note") %>'</td>--%>
                <%--<td><%# Eval("EquipmentID") %></td>--%>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <section class="tables">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                                        <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"><i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">器材歸還</h3>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-hover" id="itemPlaceholderContainer" runat="server">
                                        <thead>
                                            <tr>
                                                <%--欄位開頭--%>
                                                <%--<th>#</th>--%>
                                                <th>器材名稱</th>
                                                <th>借用人</th>
                                                <th>借用部門</th>
                                                <th>借用日期</th>
                                                <th>預計歸還日期</th>
                                                <th>歸還</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id="itemPlaceholder">
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesDatabase %>" DeleteCommand="DELETE FROM [Borrow] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Borrow] ([Id], [UserName], [Unit], [BorrowStartDate], [BorrowEndDate], [Audit], [Note], [EquipmentID]) VALUES (@Id, @UserName, @Unit, @BorrowStartDate, @BorrowEndDate, @Audit, @Note, @EquipmentID)" SelectCommand="SELECT * FROM [Borrow]" UpdateCommand="UPDATE [Borrow] SET [UserName] = @UserName, [Unit] = @Unit, [BorrowStartDate] = @BorrowStartDate, [BorrowEndDate] = @BorrowEndDate, [Audit] = @Audit, [Note] = @Note, [EquipmentID] = @EquipmentID WHERE [Id] = @Id"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <%--放JS的地方--%>
</asp:Content>

