<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="personnelformwaitupdat.aspx.cs" Inherits="personnelformwaitupdat" EnableEventValidation ="false" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Threading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" Runat="Server">
   <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/themes/base/base.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
修改表單
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
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">表單編號</label>
                          <div class="col-sm-9">

                             
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" disabled=""  ></asp:TextBox>
        
                          </div>
                        </div>

                   <div class="line"></div>
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label">員工編號</label>
                          <div class="col-sm-9">

                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" disabled=""  ></asp:TextBox>
        
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

                          <label class="col-sm-3 form-control-label">敘述流程:</label>  
                          <div class="col-sm-9">
                            
                           <textarea id="TextArea1" style="width:100%" rows="6" CssClass= "form-control input-material" runat="server" required="" placeholder="敘述流程" ></textarea>
                
                          </div>
                        </div>
                           <div class="line"></div>
                        <div class="form-group row">
                          <div class="col-sm-4 offset-sm-3">
                              
                            <%--<button type="submit" class="btn btn-secondary">Cancel</button>--%>
                            <%--<button type="submit" class="btn btn-primary">Save changes</button>--%>
                             <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" CssClass="btn btn-secondary" formnovalidate ValidationGroup="aaa" Text="取消" />
                              <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btn btn-primary" OnClientClick="return false" Text="修改" />
                             <asp:Label ID="Label1" runat="server" CssClass="invalid-feedback" Text="Label"></asp:Label>
                          </div>
                        </div>
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

    <script>
        $(function () {
                  $("#MainContentPlaceHolder_TextBox3").datepicker({
                        dateFormat: "yy/mm/dd",
                        minDate: +1,
                        maxDate: "+10D",
                    });
        });
    </script>
    <script>
        $(function () {
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
                    text: "表單即將被修改?",
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

