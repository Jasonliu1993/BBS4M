/**
 * Created by Jason on 22/06/2017.
 */
function log (Msg){
    console.log(Msg);
}

$.writeWarning = function (warning) {
    $(".error-dialog").text(warning);
}

$.loginVerify = function () {
    var name = $("#userId").val();
    var password = $("#password").val();
    if ((name == null || name == undefined || name =="") && (password != null && password != undefined && password !="")) {
        $.writeWarning("用户名不能为空!");
        return false;
    } else if ((name != null && name != undefined && name != "") && (password == null || password == undefined || password == "")) {
        $.writeWarning("密码不能为空!");
        return false;
    } else if ((name == null || name == undefined || name == "") && (password == null || password == undefined || password == "")) {
        $.writeWarning("用户名和密码不能为空!");
        return false;
    } else {
        return true;
    }
}

$.registerPage = function (path) {
    location.href = path;
    return false;
}