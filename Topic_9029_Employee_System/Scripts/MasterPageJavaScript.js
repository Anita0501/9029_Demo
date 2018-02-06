//url
//    ConfigurationManager.AppSettings["LoginPage"],


//empInfo
//PermissionsID
//EmployeeName
//JobTitle
//changePassword

$(function () {
    var empInfo = ($("#EmployeeHiddenField").val()).split(",");
    var loginUrl = $("#urlHiddenField").val();
    var apiUrl = "/api/PermissionsByEmployeeId/" + empInfo[0];
    //不是第一次登入或密碼沒有過期 可以看到該權限所能看到的資料
    if (empInfo[3] === "false") {

        var siteArray;
        $.ajax({
            async: false,
            type: "GET",
            contentType: "application/json; charset=utf-8",
            url: apiUrl,
            dataType: "json"
        }).done(function (response) {
            siteArray = response;
        });

        for (var i = 0; i < siteArray.length; i++) {
            if (siteArray[i].MainMenuId == 1) {
                AddLiToUl("UserDropdown", siteArray[i].SiteName, "site" + siteArray[i].SiteId, "/" + siteArray[i].Url);
            }
            else if (siteArray[i].MainMenuId == 2) {
                AddLiToUl("FormDropdown", siteArray[i].SiteName, "site" + siteArray[i].SiteId, "/" + siteArray[i].Url);
            }
            else if (siteArray[i].MainMenuId == 3) {
                AddLiToUl("AssetEquipmentRentalDropdown", siteArray[i].SiteName, "site" + siteArray[i].SiteId, "/" + siteArray[i].Url);
            }
            else if (siteArray[i].MainMenuId == 4) {
                AddLiToUl("CommissionDropdown", siteArray[i].SiteName, "site" + siteArray[i].SiteId, "/" + siteArray[i].Url);
            }
            else if (siteArray[i].MainMenuId == 5) {
                AddLiToUl("CRMDropdown", siteArray[i].SiteName, "site" + siteArray[i].SiteId, "/" + siteArray[i].Url);
            }
            else if (siteArray[i].MainMenuId == 6) {
                AddLiToUl("BillboardDropdown", siteArray[i].SiteName, "site" + siteArray[i].SiteId, "/" + siteArray[i].Url);
            }

        }
    }

    $("#userName").html(empInfo[1]);
    $("#userJobTitle").text(empInfo[2]);

    var a = document.getElementById('SingOut');
    a.href = loginUrl;
    var b = document.getElementById('SingOut2');
    b.href = loginUrl;
});


function AddLiToUl(ulId, linkText, liID, linkURL) {
    //新增LI到UL  先建一個新的LI  設定ID 並加到UL中
    var li = document.createElement("LI");
    li.setAttribute("id", liID);
    document.getElementById(ulId).appendChild(li);

    //新增a連結到LI  
    var a = document.createElement("a");           //建立A
    a.textContent = linkText;                      //設定顯示文字
    a.setAttribute('href', linkURL);               //設定連結
    document.getElementById(liID).appendChild(a);  //加到LI中

}
