<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="personnelformwaitadd.aspx.cs" Inherits="personnelformwaitadd" EnableEventValidation="false" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Threading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/themes/base/base.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
 申請表單
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
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
                   
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">員工編號</label>
                          <div class="col-sm-9">

                            <asp:TextBox ID="TextBox2" runat="server" disabled="" CssClass="form-control"></asp:TextBox>
        
                          </div>
                        </div>
                        <div class="line"></div>
                         <div class="form-group row">

                          <label class="col-sm-3 form-control-label">表單類型:</label>
                          <div class="col-sm-9 select">
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">

                              <asp:ListItem>出差</asp:ListItem>
                              <asp:ListItem>請假</asp:ListItem>
                              <asp:ListItem>加班</asp:ListItem>
                              <asp:ListItem>其他</asp:ListItem>
                            </asp:DropDownList>  

                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">

                           <label class="col-sm-3 form-control-label">開始時間:</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control input-material" required=""  placeholder="開始時間"></asp:TextBox>
                          </div>

                        </div>
                        <div class="line"></div>
                        <div class="form-group row">

                          <label class="col-sm-3 form-control-label">結束時間:</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control input-material" required="" placeholder="結束時間:"></asp:TextBox>

                          </div>
                        </div>
                        <div class="line"></div>
                        <div class="form-group row">

                          <label class="col-sm-3 form-control-label">申請備註:</label>  
                          <div class="col-sm-9">
                            
                           <textarea id="TextArea1" style="width:100%" rows="6" CssClass= "form-control input-material " runat="server" required="" placeholder="申請備註" ></textarea>
                
                          </div>
                        </div>
                           <div class="line"></div>
                        <div class="form-group row">
                          <div class="col-sm-4 offset-sm-3">
                              
                            <%--<button type="submit" class="btn btn-secondary">Cancel</button>--%>
                            <%--<button type="submit" class="btn btn-primary">Save changes</button>--%>
                             <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"  CssClass="btn btn-secondary" formnovalidate Text="取消" />
                             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btn btn-primary"  OnClientClick="return false" Text="申請" />
                             <asp:Label ID="Label1" runat="server" CssClass="invalid-feedback" Text="Label"></asp:Label>
                              <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                          </div>
                        </div>
                  
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
</asp:Content>
    

   <%-- <div class="container-fluid">
    <div>
        <div> 
              <div class="form-group">
                    <label for="EmployeeID" class="col-md-3 control-label"> 員工編號:</label>
                    <div class="col-md-9"></div>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control-static" placeholder="Disabled input here..." ></asp:TextBox>
                        <input type="text" disabled="" placeholder="TextBox2" class="form-control">
                    
                </div>
            <br />
            <label class="form-control-label">表單類型:</label>
            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                <asp:ListItem>出差</asp:ListItem>
                <asp:ListItem>請假</asp:ListItem>
                <asp:ListItem>加班</asp:ListItem>
                <asp:ListItem>其他</asp:ListItem>
            </asp:DropDownList>   
            <br />
              <div class="line"></div>
            <div class="form-group">
                <label class="form-control-label">開始時間:</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="開始時間"></asp:TextBox>
            </div>
            <br />
            <div class="line"></div>
            <div class="form-group">
                <label class="form-control-label">結束時間:</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="結束時間"></asp:TextBox>
            </div>
            <br />
            <div class="line"></div>
            <div class="form-group">
                <label class="form-control-label">敘述流程:</label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="敘述流程"></asp:TextBox>
            </div>
            <br />
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="申請" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
         </div>--%>
<%--</asp:Content>--%>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">

    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/datepicker-zh-TW.js"></script>
    <script src="../Scripts/bootstrap-table.js"></script>
    <script src="../Scripts/sweetalert2.min.js"></script>


    <script>
        $(function () {
            $("#MainContentPlaceHolder_TextBox3").datepicker({
                dateFormat: "yy/mm/dd",
                minDate: +1,
                maxDate: "+10D",
            });

            $("#MainContentPlaceHolder_TextBox4").datepicker({
                dateFormat: "yy/mm/dd",
                minDate: +1,
                maxDate: "+10D",
            });
        });
    </script>
    <script>
        $(function () {

            $("#MainContentPlaceHolder_Button1").click(function () {

                swal({
                    title: '確認?',
                    text: "確認進行申請作業?!",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {
                        $("#__EVENTTARGET").val("ctl00$MainContentPlaceHolder$Button1");
                        $("#form1").submit();
                    });
            });

        });

    </script>
</asp:Content>

<%--<input name="ctl00$MainContentPlaceHolder$TextBox4" type="text" id="MainContentPlaceHolder_TextBox4" class="form-control" placeholder="結束時間">--%>