function check() { //檢查密碼與確認密碼的值有沒有一致
    var password1 = document.getElementById("password").value;
    var password2 = document.getElementById("check_password").value;
    if (password1 != null & password2 != null){
        if (password1 != password2) {
            alert("密碼不一致請核查");
        }
    }
}