<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="03_CustomerTotal.aspx.cs" Inherits="_03_Sel_Del_Customer" %>

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
        /*#dialog-form {
            font-size: 90%;
        }

        #dialog-form label, input {
            display: block;
        }

        #dialog-form input.text {
                margin-bottom: 12px;
                width: 95%;
                padding: .4em;
            }

       #dialog-form fieldset {
            padding: 0;
            border: 0;
            margin-top: 25px;
        }

        h1 {
            font-size: 1.2em;
            margin: .6em 0;
        }

        div#users-contain {
            width: 350px;
            margin: 20px 0;
        }

            div#users-contain table {
                margin: 1em 0;
                border-collapse: collapse;
                width: 100%;
            }

                div#users-contain table td, div#users-contain table th {
                    border: 1px solid #eee;
                    padding: .6em 10px;
                    text-align: left;
                }

        .ui-dialog .ui-state-error {
            padding: .3em;
        }

        .validateTips {
            border: 1px solid transparent;
            padding: 0.3em;
        }*/
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
                        <input type="text" name="CompanyID" id="CompanyID" class="text ui-widget-content ui-corner-all col-6">
                        <label for="CompanyName" class="col-4">公司名稱</label>
                        <input type="text" name="CompanyName" id="CompanyName" value="" class="text ui-widget-content ui-corner-all col-6">
                        <label for="CompanyAddress" class="col-4">公司地址</label>
                        <input type="text" name="CompanyAddress" id="CompanyAddress" value="" class="text ui-widget-content ui-corner-all col-6">
                        <label for="CompanyPhone" class="col-4">公司電話</label>
                        <input type="text" name="CompanyPhone" id="CompanyPhone" value="" class="text ui-widget-content ui-corner-all col-6">
                        <label for="OfficialWebsite" class="col-4">公司官網</label>
                        <input type="text" name="OfficialWebsite" id="OfficialWebsite" value="" class="text ui-widget-content ui-corner-all col-6">
                        <label for="ContactPerson" class="col-4">負責窗口</label>
                        <input type="text" name="ContactPerson" id="ContactPerson" value="" class="text ui-widget-content ui-corner-all col-6">
                        <label for="CP_Phone" class="col-4">負責窗口電話</label>
                        <input type="text" name="CP_Phone" id="CP_Phone" value="" class="text ui-widget-content ui-corner-all col-6">
                        <label for="CP_Email" class="col-4">負責窗口E-mail</label>
                        <input type="text" name="CP_Email" id="CP_Email" value="" class="text ui-widget-content ui-corner-all col-6">
                        <label for="CompanyScale" class="col-4">公司規模</label>
                        <asp:DropDownList ID="CompanyScale" runat="server" class="text ui-widget-content ui-corner-all col-6">
                            <asp:ListItem>請選擇公司規模</asp:ListItem>
                            <asp:ListItem>100萬以下</asp:ListItem>
                            <asp:ListItem>101萬-500萬</asp:ListItem>
                            <asp:ListItem>501萬-1000萬</asp:ListItem>
                            <asp:ListItem>1001萬-3000萬</asp:ListItem>
                            <asp:ListItem>3001萬-5000萬</asp:ListItem>
                        </asp:DropDownList>
                        <label for="CompanyCategory" class="col-4">產業類別</label>
                        <asp:DropDownList ID="CompanyCategory" runat="server" class="text ui-widget-content ui-corner-all col-6">
                            <asp:ListItem>請選擇產業類別</asp:ListItem>
                            <asp:ListItem>軟體及網路相關業</asp:ListItem>
                            <asp:ListItem>電信及通訊相關業</asp:ListItem>
                            <asp:ListItem>電腦及消費性電子製造業</asp:ListItem>
                            <asp:ListItem>光電及光學相關業</asp:ListItem>
                            <asp:ListItem>電子零組件相關業</asp:ListItem>
                            <asp:ListItem>半導體業</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="Button1" runat="server" Text="修改" CssClass="btn btn-info" />
                        <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-info" />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <input id="CloseBtn" type="button" value="收折列表" class="btn btn-info btn-group-lg" />
        <br />
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
                                    return "<a id='update' href='#' class='fa fa-pencil'data-toggle='modal' data-target='#myModal' style='color:cornflowerblue;text-decoration:none' >&nbsp;</a><a id='delete' href='#' class='fa fa-trash-o' style='color:cornflowerblue;text-decoration:none' ></a>"
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
                        $("#CompanyID").val(data.CompanyID);
                        $("#CompanyName").val(data.CompanyName);
                        $("#CompanyAddress").val(data.CompanyAddress);
                        $("#CompanyPhone").val(data.CompanyPhone);
                        $("#OfficialWebsite").val(data.OfficialWebsite);
                        $("#ContactPerson").val(data.ContactPerson);
                        $("#CP_Phone").val(data.CP_Phone);
                        $("#CP_Email").val(data.CP_Email);
                        $("#CompanyScale").val(data.CompanyScale);
                        $("#CompanyCategory").val(data.CompanyCategory);
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

            //$("#myModal").dialog({
            //    autoOpen: false,
            //    height: 600,
            //    width: 400,
            //    modal: true
            //    //buttons: {
            //    //    "修改": function () {


            //    //        $(this).dialog("close");

            //    //    },
            //    //    Cancel: function () {
            //    //        $(this).dialog("close");
            //    //    }
            //    //},
            //    //close: function () {
            //    //    //allFields.val("").removeClass("ui-state-error");
            //    //    $(this).dialog("close");
            //    //}
            //});

            //$("#Update").click(function () {
            //    $("#dialog-form").dialog("open");
            //    alert("成功");
            //});
            //$("#CustomerTable tbody").on('click', '#Update', function () {
            //    //var data = datatableVariable.row($(this).parents('tr')).data();
            //    //var data2 = datatableVariable.row($(this).parents('tr'));
            //    //if (confirm("確定刪除")) {
            //    //    $.ajax({
            //    //        type: "POST",
            //    //        url: "CRM_WebService.asmx/Update",
            //    //        data: JSON.stringify({ id: data.CompanyID }),
            //    //        contentType: "application/json; charset=utf-8",
            //    //        dataType: "json",
            //    //        success: function (response) {
            //    //            alert('測試');
            //    //            //data2.remove().draw(false);
            //    //        }
            //    //    });

            //    //}
            //    //else {
            //    //    alert("刪除取消");
            //    //}
            //    //$('#myModal').on('show.bs.modal', function (event) {
            //    //    var button = $(event.relatedTarget) // Button that triggered the modal
            //    //    var recipient = button.data('whatever') // Extract info from data-* attributes
            //    //    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            //    //    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            //    //    var modal = $(this)
            //    //    modal.find('.modal-title').text('New message to ' + recipient)
            //    //    modal.find('.modal-body input').val(recipient)
            //    //})
            //});
        });
    </script>
</asp:Content>

