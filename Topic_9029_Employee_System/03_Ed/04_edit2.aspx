<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="04_edit2.aspx.cs" Inherits="Demo" enableEventValidation="false" %>

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
    <li class="breadcrumb-item active">器材編輯表</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <%--寫你們的全部的東西--%>
 
    <section class="tables">

        <div class="container" id="div1">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-close">
                        <div class="dropdown">
                            <button type="button" id="closeCard2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                            <div aria-labelledby="closeCard2" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"><i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                        </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                        <h3 class="h4">器材編輯表</h3>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal">
                            <%--欄位--%>
                         <%--   <div class="form-group row">
                                <label class="col-sm-3 form-control-label">器材編號 :</label>
                                <div class="col-sm-9">
                                    <input id="inputHorizontalSuccess" type="text" placeholder="編號" runat="server" class="form-control form-control-success"><small class="form-text"></small>
                                </div>
                            </div>--%>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">器材名稱 :</label>
                                <div class="col-sm-9">
                                    <input id="inputHorizontalWarning1" value='<%#Eval("EquipmentID") %>' type="text" placeholder="名稱" runat="server" class="form-control form-control-warning"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">器材數量 :</label>
                                <div class="col-sm-9">
                                    <input id="inputHorizontalWarning2" value='<%#Eval("EquipmentID") %>' type="text" placeholder="數量" runat="server" class="form-control form-control-warning"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">分類 :</label>
                                <div class="col-sm-9">
                                    <%--                            <input id="inputHorizontalWarning3" type="text" placeholder="類別" class="form-control form-control-warning"><small class="form-text"></small>--%>
                                    
                                    <select id="idSortID"  name="account" runat="server" class="form-control form-control-warning">
                                        <option value="0">選擇</option>
                                        <option value="1">3C產品</option>
                                        <option value="2">周邊器材</option>
                                        <option value="3">五金工具</option>
                                        <option value="4">活動設備</option>
                                    </select>
                                </div>
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">購買日期 :</label>
                                <div class="col-sm-9">
                                    <input id="PurchaseDate" value='<%#Eval("EquipmentID") %>' type="text" placeholder="名稱" runat="server" class="form-control form-control-warning"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">使用年限 :</label>
                                <div class="col-sm-9">
                                    <input id="UseLife" value='<%#Eval("EquipmentID") %>' type="text" placeholder="名稱" runat="server" class="form-control form-control-warning"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--按鈕--%>
                            <div class="form-group row">
                                <div class="col-sm-9 offset-sm-3">
                                    <asp:Button ID="Button1" runat="server" Text="更新" OnClick="Button1_Click1" Class="btn btn-primary" />
                                    <%--<input id="PostData" type="submit" value="Signin" class="btn btn-primary">--%>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <%--放JS的地方--%>
    <link href="Content/themes/base/all.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script>
        $(function () {
            $.datepicker.regional['zh-TW'] = {
                dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                prevText: "上月",
                nextText: "次月",
                weekHeader: "週"
            }
            //將預設語系設定為中文
            $.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
            $("#MainContentPlaceHolder_PurchaseDate").datepicker({ dateFormat: "yy/mm/dd" });
        });
        $(function () {
            $("#MainContentPlaceHolder_UseLife").datepicker({ dateFormat: "yy/mm/dd" });
        });
    </script>
</asp:Content>