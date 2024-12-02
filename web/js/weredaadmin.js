$(document).ready(function () {
    $("#createAdm").click(function () {
        $("#dRegAdm").css("display", "block");
        $("#dMgtAdm").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#mgtAdm").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dMgtAdm").css("display", "block");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changeMail").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dMgtAdm").css("display", "none");
        $("#dChangeMail").css("display", "block");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changePass").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dMgtAdm").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "block");
        $("#info").css("display", "none");
    });
});