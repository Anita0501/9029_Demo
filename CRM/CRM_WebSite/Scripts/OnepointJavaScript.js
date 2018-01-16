

AddLiToUl("UserDropdown", "新增使用者", "AddUser", "Register.aspx");

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