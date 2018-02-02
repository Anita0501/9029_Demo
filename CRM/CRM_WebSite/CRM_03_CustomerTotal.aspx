<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_03_CustomerTotal.aspx.cs" Inherits="_03_Sel_Del_Customer" %>

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
    <li class="breadcrumb-item">客戶資料管理</li>
    <li class="breadcrumb-item">查詢與刪除客戶資料</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <div class="container">
        <asp:Label ID="DeleteLab" runat="server" Text="公司統編" AssociatedControlID="DeleteTextBox" CssClass="col-2"></asp:Label>
        <asp:TextBox ID="DeleteTextBox" runat="server" CssClass="col-4"></asp:TextBox>
        <asp:Button ID="DeleteBtn" runat="server" Text="刪除" OnClick="DeleteBtn_Click" CssClass="btn btn-info col-1" />
    </div>
    <hr />
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #8fd5e0">
                    <h5 class="modal-title" id="exampleModalLabel">修改客戶資料</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="CompanyID" class="col-4">公司統編</label>
                        <asp:TextBox ID="CompanyID" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="CompanyName" class="col-4">公司名稱</label>
                        <asp:TextBox ID="CompanyName" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="CompanyAddress" class="col-4">公司地址</label>
                        <asp:TextBox ID="CompanyAddress" runat="server" value="" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="CompanyPhone" class="col-4">公司電話</label>
                        <asp:TextBox ID="CompanyPhone" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="OfficialWebsite" class="col-4">公司官網</label>
                        <asp:TextBox ID="OfficialWebsite" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="ContactPerson" class="col-4">負責窗口</label>
                        <asp:TextBox ID="ContactPerson" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="CP_Phone" class="col-4">負責窗口電話</label>
                        <asp:TextBox ID="CP_Phone" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="CP_Email" class="col-4">負責窗口E-mail</label>
                        <asp:TextBox ID="CP_Email" runat="server" class="text ui-widget-content ui-corner-all col-6"></asp:TextBox>
                        <label for="CompanyScale" class="col-4">公司規模</label>
                        <asp:DropDownList ID="CompanyScale" runat="server" class="text ui-widget-content ui-corner-all col-6" DataSourceID="CompanyScales" DataTextField="CompanyScale" DataValueField="CompanyScale" AppendDataBoundItems="True">
                            <asp:ListItem>未選擇</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="CompanyScales" ConnectionString='<%$ ConnectionStrings:CRMConnectionString1 %>' SelectCommand="SELECT [CompanyScale] FROM [CRM_CompanyScales]"></asp:SqlDataSource>
                        <label for="CompanyCategory" class="col-4">產業類別</label>
                        <asp:DropDownList ID="CompanyCategory" runat="server" class="text ui-widget-content ui-corner-all col-6" AppendDataBoundItems="True" DataSourceID="CompanyCategorys" DataTextField="CompanyCategory" DataValueField="CompanyCategory">
                            <asp:ListItem>未選擇</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="CompanyCategorys" ConnectionString='<%$ ConnectionStrings:CRMConnectionString1 %>' SelectCommand="SELECT [CompanyCategory] FROM [CRM_CompanyCategorys]"></asp:SqlDataSource>
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
        <table id="CustomerTable" class="table table-info table-bordered table-hover">
            <thead>
                <tr>
                    <th style="width: 8%">統編</th>
                    <th style="width: 18%">公司名稱</th>
                    <th style="width: 12%">公司電話</th>
                    <th style="width: 11%">負責窗口</th>
                    <th style="width: 15%">負責窗口電話</th>
                    <th style="width: 15%">公司規模</th>
                    <th style="width: 16%">產業類別</th>
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
                url: "CRM_WebService.asmx/Customers",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var datatableVariable = $("#CustomerTable").DataTable({
                        data: response.d,
                        bDeferRander: true,
                        columns: [
                            { 'data': 'CompanyID' },
                            { 'data': 'CompanyName' },
                            { 'data': 'CompanyPhone' },
                            { 'data': 'ContactPerson' },
                            { 'data': 'CP_Phone' },
                            { 'data': 'CompanyScale' },
                            { 'data': 'CompanyCategory' },
                            {
                                'data': null,
                                render: function (data, type, row, meta) {
                                    return "<a id='update' href='#' class='fa fa-pencil'data-toggle='modal'  title='編輯' data-target='#myModal' style='color:cornflowerblue;text-decoration:none' >&nbsp;</a><a id='delete' href='#' class='fa fa-trash-o' style='color:cornflowerblue;text-decoration:none' data-toggle='tooltip' data- placement='bottom' title='刪除' ></a>"
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
                    $("#CustomerTable tbody").on('click', '#update', function () {
                        var data = datatableVariable.row($(this).parents('tr')).data();
                        var data2 = datatableVariable.row($(this).parents('tr'));
                        $("#MainContentPlaceHolder_CompanyID").val(data.CompanyID);
                        $("#MainContentPlaceHolder_CompanyName").val(data.CompanyName);
                        $("#MainContentPlaceHolder_CompanyAddress").val(data.CompanyAddress);
                        $("#MainContentPlaceHolder_CompanyPhone").val(data.CompanyPhone);
                        $("#MainContentPlaceHolder_OfficialWebsite").val(data.OfficialWebsite);
                        $("#MainContentPlaceHolder_ContactPerson").val(data.ContactPerson);
                        $("#MainContentPlaceHolder_CP_Phone").val(data.CP_Phone);
                        $("#MainContentPlaceHolder_CP_Email").val(data.CP_Email);
                        $("#MainContentPlaceHolder_CompanyScale").val(data.CompanyScale);
                        $("#MainContentPlaceHolder_CompanyCategory").val(data.CompanyCategory);
                    });

                    $("#CustomerTable tbody").on('click', '#delete', function () {
                        var data = datatableVariable.row($(this).parents('tr')).data();
                        var data2 = datatableVariable.row($(this).parents('tr'));
                        if (confirm("確定刪除")) {
                            $.ajax({
                                type: "POST",
                                url: "CRM_WebService.asmx/Delete",
                                data: JSON.stringify({ id: data.CompanyID }),
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
                        $("#CustomerTable_wrapper").toggle(500);
                    });

                }

            });
        });
    </script>
</asp:Content>

