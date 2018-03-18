<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRM_02_Customer.aspx.cs" Inherits="_02_AddCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSContentPlaceHolder" runat="Server">
    <link href="Scripts/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    客戶關係管理
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteMapContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item">客戶資料管理</li>
    <li class="breadcrumb-item">新增與修改客戶資料</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <div class="container">
        <asp:label id="ErrorLab" cssclass="offset-2" style="color: red" runat="server" text=""></asp:label>
        <div class="form-group">
            <asp:label id="CompanyID" runat="server" text="統編" associatedcontrolid="CompanyIDTextBox" cssclass="col-2"></asp:label>
            <asp:textbox id="CompanyIDTextBox" runat="server" cssclass="col-4" placeholder="請輸入客戶公司統編"></asp:textbox>
            <asp:button id="SelectBtn" cssclass="btn btn-sm btn-info col-1" runat="server" text="查詢" onclick="SelectBtn_Click" />
        </div>
        <div class="form-group">
            <asp:label id="CompanyName" runat="server" text="公司名稱" associatedcontrolid="CompanyNameTextBox" cssclass="col-2"></asp:label>
            <asp:textbox id="CompanyNameTextBox" runat="server" cssclass="col-4" placeholder="請輸入客戶公司名稱"></asp:textbox>
        </div>
        <div class="form-group">
            <asp:label id="CompanyAddress" runat="server" text="公司地址" associatedcontrolid="CompanyAddressTextBox" cssclass="col-2"></asp:label>
            <asp:textbox id="CompanyAddressTextBox" runat="server" cssclass="col-4" placeholder="請輸入客戶公司地址"></asp:textbox>
        </div>
        <div class="form-group">
            <asp:label id="CompanyPhone" runat="server" text="公司電話" associatedcontrolid="CompanyPhoneTextBox" cssclass="col-2"></asp:label>
            <asp:textbox id="CompanyPhoneTextBox" runat="server" cssclass="col-4" placeholder="請輸入客戶公司電話"></asp:textbox>
        </div>
        <div class="form-group">
            <asp:label id="OfficialWebsite" runat="server" text="公司官網" associatedcontrolid="OfficialWebsiteTextBox" cssclass="col-2"></asp:label>
            <asp:textbox id="OfficialWebsiteTextBox" runat="server" cssclass="col-4" placeholder="請輸入客戶公司官網"></asp:textbox>
        </div>
        <div class="form-group">
            <asp:label id="ContactPerson" runat="server" text="負責窗口" associatedcontrolid="ContactPersonTextBox" cssclass="col-2"></asp:label>
            <asp:textbox id="ContactPersonTextBox" runat="server" cssclass="col-4" placeholder="請輸入窗口負責人名稱"></asp:textbox>
        </div>
        <div class="form-group">
            <asp:label id="CP_Phone" runat="server" text="負責窗口電話" associatedcontrolid="CP_PhoneTextBox" cssclass="col-2"></asp:label>
            <asp:textbox id="CP_PhoneTextBox" runat="server" cssclass="col-4" placeholder="請輸入窗口負責人電話"></asp:textbox>
        </div>
        <div class="form-group">
            <asp:label id="CP_Email" runat="server" text="負責窗口E-mail" associatedcontrolid="CP_EmailTextBox" cssclass="col-2"></asp:label>
            <asp:textbox id="CP_EmailTextBox" runat="server" cssclass="col-4" placeholder="請輸入窗口負責人E-mail"></asp:textbox>
        </div>
        <div class="form-group">
            <asp:label id="CompanyScale" runat="server" text="公司規模" cssclass="col-2"></asp:label>
            <asp:dropdownlist id="CompanyScaleDropDownList" runat="server" cssclass="col-4 custom-select-sm" datasourceid="CompanyScales" datatextfield="CompanyScale" datavaluefield="CompanyScale" appenddatabounditems="True">
                <asp:ListItem>未選擇</asp:ListItem>
            </asp:dropdownlist>
            <asp:sqldatasource runat="server" id="CompanyScales" connectionstring='<%$ ConnectionStrings:employeesDatabase %>' selectcommand="SELECT [CompanyScale] FROM [CRM_CompanyScales]"></asp:sqldatasource>
        </div>
        <div class="form-group">
            <asp:label id="CompanyCategory" runat="server" text="產業類別" cssclass="col-2"></asp:label>
            <asp:dropdownlist id="CompanyCategoryDropDownList" runat="server" cssclass="col-4 custom-select-sm" datasourceid="CompanyCategorys" datatextfield="CompanyCategory" datavaluefield="CompanyCategory" appenddatabounditems="True">
                <asp:ListItem>未選擇</asp:ListItem>
            </asp:dropdownlist>
            <asp:sqldatasource runat="server" id="CompanyCategorys" connectionstring='<%$ ConnectionStrings:employeesDatabase %>' selectcommand="SELECT [CompanyCategory] FROM [CRM_CompanyCategorys]"></asp:sqldatasource>
        </div>
        <br />
        <div>
            <asp:button id="InsertBtn" cssclass="btn btn-info offset-2 col-1" runat="server" text="新增" onclick="InsertBtn_Click" OnClientClick="return false"/>
            <asp:button id="UpdateBtn" cssclass="btn btn-info col-1" runat="server" text="修改" onclick="UpdateBtn_Click" />
            <asp:button id="CancelBtn" cssclass="btn btn-info col-1" runat="server" text="取消" onclick="CancelBtn_Click" />
            <asp:button id="Demobtn" cssclass="btn btn-default offset-2 col-1" runat="server" text="Demo" onclick="Demobtn_Click" />
        </div>
    </div>
    <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JavaScriptContentPlaceHolder" runat="Server">
    <script src="https://cdn.bootcss.com/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="Scripts/sweetalert2.min.js"></script>

    <script>
        $(function () {

            $("#MainContentPlaceHolder_InsertBtn").click(function () { 

                swal({
                    title: '是否新增',
                    //text: "客戶資料新增成功!",
                    type: 'question',
                    showCancelButton: true,
                    confirmButtonText: '確定',
                    cancelButtonText: '取消'
                }).then(
                    function () {
                        $("#__EVENTTARGET").val("ctl00$MainContentPlaceHolder$InsertBtn");
                        $("#form1").submit();
                    });
            });
        });

    </script>
</asp:Content>

