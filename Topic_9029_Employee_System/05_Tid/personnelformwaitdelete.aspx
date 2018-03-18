<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="personnelformwaitdelete.aspx.cs" Inherits="personnelformwaitdelete" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
     <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/themes/base/base.css" rel="stylesheet" />
    <link href="../Content/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
 刪除表單
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
                                <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"><i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                            </div>
                        </div>
                        <div class="card-body">

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">表單編號</label>
                                <div class="col-sm-9">

                                    <%--   <input type="text" disabled="" placeholder="TextBox2" class="form-control">--%>
                                    <asp:TextBox ID="TextBox1" runat="server" disabled="" CssClass="form-control" placeholder="Disabled input here..."></asp:TextBox>

                                </div>
                            </div>

                            <div class="line"></div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">員工編號</label>
                                <div class="col-sm-9">


                                    <asp:TextBox ID="TextBox2" runat="server" disabled="" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="line"></div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">表單類型</label>
                                <div class="col-sm-9">

                                    <asp:TextBox ID="TextBox3" runat="server" disabled="" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>

                            <div class="line"></div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">開始時間</label>
                                <div class="col-sm-9">

                                    <asp:TextBox ID="TextBox4" runat="server" disabled="" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="form-group row">

                                <label class="col-sm-3 form-control-label">結束時間:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" disabled=""></asp:TextBox>

                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="form-group row">

                                <label class="col-sm-3 form-control-label">申請時間:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" disabled=""></asp:TextBox>

                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="form-group row">

                                <label class="col-sm-3 form-control-label">申請備註:</label>
                                <div class="col-sm-9">

                                    <%--<textarea id="TextArea1"  cols="70" rows="6" CssClass= "form-control input-material" runat="server" required="" placeholder="敘述流程" ></textarea>--%>
                                    <%--<asp:TextBox ID="TextBox7" runat="server" cols="70" rows="6" CssClass="form-control" disabled="" ></asp:TextBox>--%>
                                    <textarea id="TextArea1" style="width:100%" rows="6" cssclass="form-control " runat="server" disabled="" placeholder="申請備註"></textarea>
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="form-group row">
                                <div class="col-sm-4 offset-sm-3">

                                    

    
                                    <%--<button type="submit" class="btn btn-secondary">Cancel</button>--%>
                                    <%--<button type="submit" class="btn btn-primary">Save changes</button>--%>
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-secondary" OnClick="Button2_Click"  formnovalidate Text="取消" />
                                    <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                                    
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  CssClass="btn btn-primary" formnovalidate  OnClientClick="return false" Text="刪除" />
                                    <asp:Label ID="Label1" runat="server" CssClass="invalid-feedback" Text="Label"></asp:Label>
                                    <%--<asp:Button ID="Button3" runat="server" Text="test"/>--%>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
        <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/datepicker-zh-TW.js"></script>
    <script src="../Scripts/bootstrap-table.js"></script>
<%--    <script src="../Scripts/sweetalert2.min.js"></script>--%>
    
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

                $("#MainContentPlaceHolder_Button1").click(function () {

                    swal({
                        title: '確認?',
                        text: "檔案即將被刪除!",
                        type: 'warning',
                        showCancelButton: true,
                    }).then(
                        function ()
                        {
                            $("#__EVENTTARGET").val("ctl00$MainContentPlaceHolder$Button1");
                            $("#form1").submit();
                        });

                });

            });

    </script>

</asp:Content>

