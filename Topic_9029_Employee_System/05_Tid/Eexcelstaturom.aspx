<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Eexcelstaturom.aspx.cs" Inherits="Eexcelstaturom" EnableEventValidation ="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="Content/themes/cupertino/jquery-ui.css" rel="stylesheet" />
    <link href="Content/themes/base/all.css" rel="stylesheet" />
    <link href="Scripts/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
 審核結果
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <style>

        #GridView1 > tbody > tr :hover
        {
            background-color: lightblue;
        }

        .auto-style1 {
            position: relative;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-clip: border-box;
            border-radius: 0;
            -webkit-box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1), -1px 0 2px rgba(0, 0, 0, 0.05);
            box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1), -1px 0 2px rgba(0, 0, 0, 0.05);
            left: 0px;
            top: -70px;
            border: 0 solid #eee;
            margin-bottom: 30px;
            background-color: #fff;
        }

    </style>
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <!-- Form Elements -->
                <div class="col-lg-12">
                    <div class="auto-style1">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                                <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"><i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                            </div>
                        </div>
                        <div class="card-body">
                            
                         
                            <asp:Label ID="Label4" runat="server" CssClass="btn btn-warning"  Text="Label"></asp:Label>
                            
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"  CssClass="btn btn-primary col-lg-12" formnovalidate  OnClientClick="return false" Text="下載Excel" />
                            
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" class="col-lg-12"  EmptyDataText="There are no data records to display." OnRowDataBound="GridView1_RowDataBound" CellPadding="7" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" CssClass="btn btn-primary" formnovalidate runat="server" Text="+" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="員工編號" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="name" HeaderText="員工姓名" SortExpression="name" />
                    <asp:BoundField DataField="idpersonnel" HeaderText="員工編號" SortExpression="idpersonnel" />
                    <asp:BoundField DataField="type" HeaderText="表單類型" SortExpression="type" />
                    <asp:BoundField DataField="timestart" HeaderText="開始日期" SortExpression="timestart" />
                    <asp:BoundField DataField="timeend" HeaderText="結束日期" SortExpression="timeend" />
                    <asp:BoundField DataField="daytime" HeaderText="申請日期" SortExpression="daytime" />
                    <asp:TemplateField HeaderText="審核結果" SortExpression="statusfromowaitresatnooryes">
                        <EditItemTemplate>                         
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("statusfromowaitresatnooryes") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Bind("statusfromowaitresatnooryes") %>'></asp:Label>
                            <tr id='<%# "d" + Eval("Id") %>' style="display: none;">
                                <td colspan="5">
                                    <p>
                                        申請理由 :
							        <%# Eval("description", "{0:d}") %>
                                        <br>
                                        審核備註 :
							        <%# Eval("statusfromowaitresatbute") %>
                                        <br>
                                       
                                    </p>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeesDatabase %>" SelectCommand="SELECT [Id], [idpersonnel], [type], [timestart], [timeend], [description], [daytime], [statusfromowaitresatnooryes], [statusfromowaitresatbute],[name] FROM personnelfurloughwait Where  statusfromowaitok in (1,2)"></asp:SqlDataSource>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
    <%--  <div>
  
      <div>
          表單編號:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
          <br />
          <br />
      </div>
      <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="刪除" />
      <br />
      <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
  
  </div>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
     <script src="../Scripts/utils.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/datepicker-zh-TW.js"></script>
    <script src="../Scripts/bootstrap-table.js"></script>
    <script src="../Scripts/sweetalert2.min.js"></script>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script>
        $(function () {
            $("#TextBox3").datepicker({
                dateFormat: "yy/mm/dd",
                minDate: +1,
                maxDate: "+10D",
                buttonImage: "/Content/calendar.gif",
                showOn: "button",
                buttonImageOnly: true
            });
        });
    </script>

    <script>
        $(function () {
            $("#TextBox4").datepicker({
                dateFormat: "yy/mm/dd",
                minDate: +1,
                maxDate: "+10D",
                buttonImage: "/Content/calendar.gif",
                showOn: "button",
                buttonImageOnly: true
            });
        });
        </script>

        <script>
            $(function () {

                $("#MainContentPlaceHolder_Button2").click(function () {

                    swal({
                        title: '確認?',
                        text: "確認是否下載Excel!",
                        type: 'warning',
                        showCancelButton: true,
                    }).then(
                        function ()
                        {
                            $("#__EVENTTARGET").val("ctl00$MainContentPlaceHolder$Button2");
                            $("#form1").submit();
                        });
                });

            });

    </script>
   
</asp:Content>

