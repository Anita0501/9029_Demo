<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="personnelformsee.aspx.cs" Inherits="personnelformsee" EnableEventValidation ="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
 申請中表單
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <section class="forms"> 
            <div class="container-fluid">
              <div class="row">      
                <!-- Form Elements -->
                <div class="col-lg-12">
                  <div class="card">
                    <div class="card-close">
                      <div class="dropdown">
                        <button type="button" id="closeCard5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                      </div>
                    </div>
                    <div class="card-body">
                   <%--   <form class="form-horizontal">--%>
                        <div>
  
      
      <br />
     
       <asp:Label ID="Label1" runat="server" CssClass="btn btn-warning" Text="Label"></asp:Label>
      <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"  CssClass="btn btn-primary col-lg-12" formnovalidate  Text="申請表單" />
      <asp:ListView ID="ListView1" runat="server"  DataKeyNames="Id">
       
          
          <%--<EditItemTemplate>
              <tr style="">
                  <td>
                      <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                      <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                  </td>
                  <td>
                      <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="idpersonnelTextBox" runat="server" Text='<%# Bind("idpersonnel") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="timestartTextBox" runat="server" Text='<%# Bind("timestart") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="timeendTextBox" runat="server" Text='<%# Bind("timeend") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="daytimeTextBox" runat="server" Text='<%# Bind("daytime") %>' />
                  </td>
              </tr>
          </EditItemTemplate>
          <EmptyDataTemplate>
              <table runat="server" style="">
                  <tr>
                      <td>No data was returned.</td>
                  </tr>
              </table>
          </EmptyDataTemplate>
          <InsertItemTemplate>
              <tr style="">
                  <td>
                      <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                      <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                  </td>
                  <td>&nbsp;</td>
                  <td>
                      <asp:TextBox ID="idpersonnelTextBox" runat="server" Text='<%# Bind("idpersonnel") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="timestartTextBox" runat="server" Text='<%# Bind("timestart") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="timeendTextBox" runat="server" Text='<%# Bind("timeend") %>' />
                  </td>
                  <td>
                      <asp:TextBox ID="daytimeTextBox" runat="server" Text='<%# Bind("daytime") %>' />
                  </td>
              </tr>
          </InsertItemTemplate>--%>
          <ItemTemplate>
              <tr style="">
                  <td>
                      <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                  </td>
                  <td>
                      <asp:Label ID="idpersonnelLabel" runat="server" Text='<%# Eval("idpersonnel") %>' />
                  </td>
                  <td>
                      <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                  </td>
                  <td>
                      <asp:Label ID="timestartLabel" runat="server" Text='<%# Eval("timestart") %>' />
                  </td>
                  <td>
                      <asp:Label ID="timeendLabel" runat="server" Text='<%# Eval("timeend") %>' />
                  </td>
                  <td>
                      <asp:Label ID="daytimeLabel" runat="server" Text='<%# Eval("daytime") %>' />
                  </td>
                    <td>
                      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("id", "~/05_Tid/personnelformwaitupdat.aspx?id={0}") %>'>
                            <asp:Image ID="Image1" ImageUrl="~/05_Tid/img/uddata.png" Width="20px" Height ="20px" BorderWidth="0" runat="server" />
                        </asp:HyperLink>  
                  </td>
                  <td>
                      <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("id", "~/05_Tid/personnelformwaitdelete.aspx?id={0}") %>'>
                            <asp:Image ID="Image2" ImageUrl="~/05_Tid/img/deled.png" Width="20px" Height ="20px" BorderWidth="0" runat="server" />
                        </asp:HyperLink>  
                  </td>
              </tr>
          </ItemTemplate>
          <LayoutTemplate>
              <table runat="server" class="col-lg-12">
                  <tr runat="server">
                      <td runat="server">
                          <div>
                               <div class="card">
                                   <div class="card-">
                                      <div class="dropdown">
                          <table id="itemPlaceholderContainer" runat="server" border="0" class="table" style="">
                              <tr runat="server" style="">
                                  <th runat="server">表單編號</th>
                                  <th runat="server">員工編號</th>
                                  <th runat="server">表單類型</th>
                                  <th runat="server">開始日期</th>
                                  <th runat="server">結束日期</th>
                                  <th runat="server">申請日期</th>
                                  <th runat="server">表單修改</th>
                                  <th runat="server">表單刪除</th>
                                  <th runat="server"></th>

                              </tr>
                              <tr id="itemPlaceholder" runat="server">
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr runat="server">
                      <td runat="server" style=""></td>
                  </tr>
              </table>
          </LayoutTemplate>
          <SelectedItemTemplate>
            
              <tr style="">
                  <td>
                      <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                  </td>
                  <td>
                      <asp:Label ID="idpersonnelLabel" runat="server" Text='<%# Eval("idpersonnel") %>' />
                  </td>
                  <td>
                      <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                  </td>
                  <td>
                      <asp:Label ID="timestartLabel" runat="server" Text='<%# Eval("timestart") %>' />
                  </td>
                  <td>
                      <asp:Label ID="timeendLabel" runat="server" Text='<%# Eval("timeend") %>' />
                  </td>
                  <td>
                      <asp:Label ID="daytimeLabel" runat="server" Text='<%# Eval("daytime") %>' />
                  </td>
              </tr>
              
          </SelectedItemTemplate>
  
      </asp:ListView>
   
  </div>
                        
                     <%-- </form>--%>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>


</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" Runat="Server">
      <script src="../Scripts/utils.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/datepicker-zh-TW.js"></script>
    <script src="../Scripts/bootstrap-table.js"></script>
    <script src="../Scripts/sweetalert2.min.js"></script>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>


    <script>
    $(function () {
      $("#jsGrid").jsGrid({
        width: "100%",
        height: "400px",

        paging: true,
        pageSize: 2,
        pageIndex: 1,

        inserting: true,
        editing: true,
        sorting: true,

        data: myProducts,



  </script>
</asp:Content>

