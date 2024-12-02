$(document).ready(function () {
    $("#viewRep").click(function () {
        $("#dViewRep").css("display", "block");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changeMail").click(function () {
        $("#dViewRep").css("display", "none");
        $("#dChangeMail").css("display", "block");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changePass").click(function () {
        $("#dViewRep").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "block");
        $("#info").css("display", "none");
    });
});