$(document).ready(function () {
    $("#createAdm").click(function () {
        $("#dRegAdm").css("display", "block");
        $("#dRegCsa").css("display", "none");
        $("#dRegMoe").css("display", "none");
        $("#dMgtAdm").css("display", "none");
        $("#dRegRegion").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#createCsa").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dRegCsa").css("display", "block");
        $("#dRegMoe").css("display", "none");
        $("#dMgtAdm").css("display", "none");
        $("#dRegRegion").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#createMoe").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dRegCsa").css("display", "none");
        $("#dRegMoe").css("display", "block");
        $("#dMgtAdm").css("display", "none");
        $("#dRegRegion").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });

    $("#mgtAdm").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dRegCsa").css("display", "none");
        $("#dRegMoe").css("display", "none");
        $("#dMgtAdm").css("display", "block");
        $("#dRegRegion").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#regRegion").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dRegCsa").css("display", "none");
        $("#dRegMoe").css("display", "none");
        $("#dMgtAdm").css("display", "none");
        $("#dRegRegion").css("display", "block");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changeMail").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dRegCsa").css("display", "none");
        $("#dRegMoe").css("display", "none");
        $("#dMgtAdm").css("display", "none");
        $("#dRegRegion").css("display", "none");
        $("#dChangeMail").css("display", "block");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changePass").click(function () {
        $("#dRegAdm").css("display", "none");
        $("#dRegCsa").css("display", "none");
        $("#dRegMoe").css("display", "none");
        $("#dMgtAdm").css("display", "none");
        $("#dRegRegion").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "block");
        $("#info").css("display", "none");
    });
});