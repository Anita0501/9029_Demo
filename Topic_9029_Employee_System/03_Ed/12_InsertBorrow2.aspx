<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="12_InsertBorrow2.aspx.cs" Inherits="Demo" EnableEventValidation="false" %>

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
    <li class="breadcrumb-item active">借取資訊</li>
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
                        <h3 class="h4">借取資訊</h3>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal">

                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">器材名稱 :</label>
                                <div class="col-sm-9">
                                    <input id="Text1" type="text" placeholder="名稱" value='<%#Eval("EquipmentID") %>' runat="server" class="form-control form-control-success"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">借取數量 :</label>
                                <div class="col-sm-9">

                                    <%--繫結語法參考網頁 https://dotblogs.com.tw/mis0800/2015/01/17/148134--%>

                                    <input id="Text2" type="text" placeholder="數量" runat="server" class="form-control form-control-success"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">借用人 :</label>
                                <div class="col-sm-9">
                                    <input id="idUserName" value=""  type="text" placeholder="名稱" runat="server" class="form-control form-control-success"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">部門 :</label>
                                <div class="col-sm-9">
                                    <select id="idUnit" name="account" runat="server" class="form-control">
                                        <option value="">選擇</option>
                                        <option value="業務部">業務部</option>
                                        <option value="人事部">人事部</option>
                                        <option value="財會部">財會部</option>
                                        <option value="研發部">研發部</option>
                                    </select>
                                </div>
                                
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">借用起始日期 :</label>
                                <div class="col-sm-9">
                                    <input id="idBorrowStartDate" type="text" placeholder="日期" runat="server" class="form-control form-control-warning"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--欄位--%>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">預計歸還日期 :</label>
                                <div class="col-sm-9">
                                    <input id="idBorrowEndDate" type="text" placeholder="日期" runat="server" class="form-control form-control-warning"><small class="form-text"></small>
                                </div>
                            </div>
                            <%--按鈕--%>
                            <div class="form-group row">
                                <div class="col-sm-9 offset-sm-3">
                                    <asp:Button ID="Button1" runat="server" Text="確認" OnClick="Button1_Click1" Class="btn btn-primary" />
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
            $("#MainContentPlaceHolder_idBorrowStartDate").datepicker({ dateFormat: "yy/mm/dd" });
        });
        $(function () {
            $("#MainContentPlaceHolder_idBorrowEndDate").datepicker({ dateFormat: "yy/mm/dd" });
        });

    </script>
</asp:Content>