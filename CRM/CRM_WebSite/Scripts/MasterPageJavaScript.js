
$(function () {
    var empInfo = ($("#EmployeeHiddenField").val()).split(",");
    if (empInfo[3] === "False") {
        AddLiToUl("UserDropdown", "個人資訊", "Profile", "AMS_03_Profile.aspx");
        if (empInfo[0] == "1") {
            AddLiToUl("UserDropdown", "新增使用者", "AddUser", "AMS_02_Register.aspx");
        }
    }
    $("#userName").html(empInfo[1]);
    $("#userJobTitle").text(empInfo[2]);
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