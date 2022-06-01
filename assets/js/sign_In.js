        function IfNull() {
            var user_email=document.getElementById("user_email").value;
            var user_password=document.getElementById("user_password").value;
            if (user_email = null) {
                alert("請輸入帳號!!不可為空值!!");
            }
            if (user_password = null) {
                alert("請輸入密碼!!不可為空值!!");
            }
        }
