<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_05_BusinessScheduleTotal.aspx.cs" Inherits="_03_Sel_Del_Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

    <style>
        .container CustomerTable {
            padding-right: 0px;
            padding-left: 0px;
        }

        .modal-dialog {
            top: 10%;
        }

        .modal-content {
            border-style: none;
            border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">業務行程管理</li>
    <li class="breadcrumb-item">查詢與刪除業務行程</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <%--    <div class="container">
        <asp:Label ID="DeleteLab" runat="server" Text="公司統編" AssociatedControlID="DeleteTextBox" CssClass="col-2"></asp:Label>
        <asp:TextBox ID="DeleteTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        <asp:Button ID="DeleteBtn" runat="server" Text="刪除" OnClick="DeleteBtn_Click" CssClass="btn btn-info col-1" />
    </div>
    <hr />--%>
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #8fd5e0">
                    <h5 class="modal-title" id="exampleModalLabel">修改業務行程</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="TripID" class="col-4">行程單號</label>
                        <asp:TextBox ID="TripID" runat="server" class="text ui-widget-content ui-corner-all col-6" disabled="disabled"></asp:TextBox>
                        <asp:HiddenField ID="TripIDHiddenField" runat="server" />
                        <label for="CompanyID" class="col-4">統編</label>
                        <asp:TextBox ID="CompanyID" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="CompanyName" class="col-4">公司名稱</label>
                        <asp:TextBox ID="CompanyName" runat="server" value="" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="EmployeeID" class="col-4">員工編號</label>
                        <asp:TextBox ID="EmployeeID" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="EmployeeName" class="col-4">員工名稱</label>
                        <asp:TextBox ID="EmployeeName" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="TripTheme" class="col-4">行程主題</label>
                        <asp:TextBox ID="TripTheme" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="TargetDate" class="col-4">預約日期</label>
                        <asp:TextBox ID="TargetDate" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="Memo" class="col-4">備註欄</label>
                        <asp:TextBox ID="Memo" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="UpdateBtn" runat="server" Text="修改" CssClass="btn btn-info" OnClick="UpdateBtn_Click" />
                        <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-info" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <asp:Button ID="ExcelBtn" runat="server" Text="匯出列表" CssClass="btn btn-info" OnClick="ExcelBtn_Click" />
        <input id="CloseBtn" type="button" value="收折列表" class="btn btn-info btn-group-lg" />
        <br />
        <asp:Label ID="MsgLab" runat="server" Text=""></asp:Label>
        <br />
        <table id="BusinessScheduleTable" class="table table-info table-bordered table-hover">
            <thead>
                <tr>
                    <th style="width: 8%">統編</th>
                    <th style="width: 18%">公司名稱</th>
                    <th style="width: 12%">員工編號</th>
                    <th style="width: 11%">員工名稱</th>
                    <th style="width: 15%">行程主題</th>
                    <th style="width: 12%">預約日期</th>
                    <th style="width: 19%">備註欄</th>
                    <th style="width: 5%"></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $.ajax({
                type: "POST",
                url: "CRM_WebService.asmx/BusinessSchedules",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var datatableVariable = $("#BusinessScheduleTable").DataTable({
                        data: response.d,
                        bDeferRander: true,
                        columns: [
                            { 'data': 'CompanyID' },
                            { 'data': 'CompanyName' },
                            { 'data': 'EmployeeID' },
                            { 'data': 'EmployeeName' },
                            { 'data': 'TripTheme' },
                            { 'data': 'TargetDate' },
                            { 'data': 'Memo' },
                            {
                                'data': null,
                                render: function (data, type, row, meta) {
                                    return "<a id='update' href='#' class='fa fa-pencil' data-toggle='modal' data-toggle='tooltip' data- placement='bottom' title='編輯' data-target='#myModal' style='color:cornflowerblue;text-decoration:none' ></a>&nbsp;<a id='DeleteSchedule' href='#' class='fa fa-trash-o' style='color:cornflowerblue;text-decoration:none' data-toggle='tooltip'  data- placement='bottom' title='刪除'></a>"
                                }
                            }
                        ],
                        "language": {
                            "sProcessing": "處理中...",
                            "sLengthMenu": "顯示 _MENU_ 項結果",
                            "sZeroRecords": "沒有匹配結果",
                            "sInfo": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                            "sInfoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                            "sInfoFiltered": "(從 _MAX_ 項結果過濾)",
                            "sInfoPostFix": "",
                            "sSearch": "搜索:",
                            "sUrl": "",
                            "oPaginate": {
                                "sFirst": "首頁",
                                "sPrevious": "上頁",
                                "sNext": "下頁",
                                "sLast": "尾頁"
                            }
                        }
                    });

                    $("#BusinessScheduleTable tbody").on('click', '#update', function () {
                        var data = datatableVariable.row($(this).parents('tr')).data();
                        var data2 = datatableVariable.row($(this).parents('tr'));
                        $("#MainContentPlaceHolder_TripIDHiddenField").val(data.TripID);
                        $("#MainContentPlaceHolder_TripID").val(data.TripID);
                        $("#MainContentPlaceHolder_CompanyID").val(data.CompanyID);
                        $("#MainContentPlaceHolder_CompanyName").val(data.CompanyName);
                        $("#MainContentPlaceHolder_EmployeeID").val(data.EmployeeID);
                        $("#MainContentPlaceHolder_EmployeeName").val(data.EmployeeName);
                        $("#MainContentPlaceHolder_TripTheme").val(data.TripTheme);
                        $("#MainContentPlaceHolder_TargetDate").val(data.TargetDate);
                        $("#MainContentPlaceHolder_Memo").val(data.Memo);
                    });
                    //$("#MainContentPlaceHolder_TargetDate").datepicker({
                    //    dateFormat: "yy-mm-dd",
                    //    minDate: 0
                    //});
                    $.datepicker.regional['zh-TW'] = {
                        dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                        dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                        monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                        monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                        prevText: "上月",
                        nextText: "次月",
                        weekHeader: "週"
                    };
                    //將預設語系設定為中文
                    $.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
                    //套用到表單
                    $(function () {
                        $("#MainContentPlaceHolder_TargetDate").datepicker({ dateFormat: 'yy/mm/dd' });
                    });
                    $("#BusinessScheduleTable tbody").on('click', '#DeleteSchedule', function () {
                        var data = datatableVariable.row($(this).parents('tr')).data();
                        var data2 = datatableVariable.row($(this).parents('tr'));
                        if (confirm("確定刪除")) {
                            $.ajax({
                                type: "POST",
                                url: "CRM_WebService.asmx/DeleteSchedule",
                                data: JSON.stringify({ id: data.TripID }),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    alert('刪除成功');
                                    data2.remove().draw(false);
                                }
                            });

                        }
                        else {
                            alert("刪除取消");
                        }
                    });


                    $("#CloseBtn").click(function () {
                        $("#BusinessScheduleTable_wrapper").toggle(500);
                    });

                }

            });

        });
    </script>
</asp:Content>