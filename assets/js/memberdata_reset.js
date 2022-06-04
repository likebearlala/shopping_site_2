function lock() {
    if(document.getElementById("Name").disabled === false)
    {
        document.getElementById("Name").disabled = true;
        document.getElementById("password").disabled = true;
        document.getElementById("check_password").disabled = true;
    } else {
        document.getElementById("Name").disabled = false;
        document.getElementById("password").disabled = false;
        document.getElementById("check_password").disabled = false;
    }
}

function changebtn() {
    document.getElementById("revise").classList.toggle("active");
}



$("#submit").click(function(){

    $("input").prop("disabled",false);
    });
