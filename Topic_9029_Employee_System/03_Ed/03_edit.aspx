<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="03_edit.aspx.cs" Inherits="Demo" %>

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
    <li class="breadcrumb-item active">器材管理</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <%--寫你們的全部的東西<br />--%>

    <select id="seleClass" name="account" runat="server" class="form-control">
        <option value="0">選擇</option>
        <option value="1">3C產品</option>
        <option value="2">周邊器材</option>
        <option value="3">五金工具</option>
        <option value="4">活動設備</option>
    </select>
    <asp:Button ID="Button1" runat="server" Text="查詢" OnClick="Button1_Click" />

    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
            <tr>
                <th scope="row"><%# Eval("EquipmentID") %></th>
                <td><%# Eval("EquipmentName") %></td>
                <td><%# Eval("EquipmentAmount") %></td>
                <td><%# Eval("StrSortID") %></td>
                <td><%# Eval("PurchaseDate") %></td>
                <td><%# Eval("UseLife") %></td>

                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("EquipmentID","~/03_Ed/04_edit2.aspx?id={0}") %>'>
                        <asp:Image ID="Image1" ImageUrl="~/img/testIcon.png" AlternateText="" Width="20px" Height="15px" BorderWidth="0" runat="server" />
                    </asp:HyperLink></td>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("EquipmentID","~/03_Ed/05_delete.aspx?id={0}") %>'>
                        <asp:Image ID="Image2" ImageUrl="~/img/testIcon.png" AlternateText="" Width="20px" Height="15px" BorderWidth="0" runat="server" />
                    </asp:HyperLink></td>
                
            </tr>
            <%-- <section class="tables">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <tr style="">
                                    <table class="table table-striped table-hover">
                                        <tbody>
                                            <td>
                                                <asp:Label ID="EquipmentIDLabel" runat="server" Text='<%# Eval("EquipmentID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="EquipmentNameLabel" runat="server" Text='<%# Eval("EquipmentName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="EquipmentAmountLabel" runat="server" Text='<%# Eval("EquipmentAmount") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="SortIDLabel" runat="server" Text='<%# Eval("SortID") %>' />
                                            </td>
                                        </tbody>--%>
            <%--</table>
                                </tr>
                            </div>
                        </div>
                    </div>
                </div>
            </section>--%>
        </ItemTemplate>

        <LayoutTemplate>
            <%--            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">EquipmentID</th>
                                <th runat="server">EquipmentName</th>
                                <th runat="server">EquipmentAmount</th>
                                <th runat="server">SortID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>--%>

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
                                    <h3 class="h4">器材管理</h3>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-hover" id="itemPlaceholderContainer" runat="server">
                                        <thead>
                                            <tr>
                                                <%--欄位開頭--%>
                                                <%--<th>#</th>--%>
                                                <th>編號</th>
                                                <th>器材名稱</th>
                                                <th>器材數量</th>
                                                <th>類別</th>
                                                <th>購買日期</th>
                                                <th>預期使用週期</th>
                                                <th>編輯</th>
                                                <th>刪除</th>
                                                <%--<th>剩餘數量</th>--%>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesDatabase %>" SelectCommand="SELECT * FROM [Equipment]"></asp:SqlDataSource>
    &nbsp;
    
   <%-- <section class="tables">
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
                            <h3 class="h4">Striped table with hover effect</h3>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>--%>
    <%--欄位開頭--%>
    <%-- <th>#</th>
                                        <th>EquipmentID</th>
                                        <th>EquipmentName</th>
                                        <th>EquipmentAmount</th>
                                        <th>SortID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <%--放JS的地方--%>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</asp:Content>
