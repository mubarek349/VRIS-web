$(document).ready(function () {
    $("#regBirth").click(function () {
        $("#dRegBirth").css("display", "block");
        $("#dRegDeath").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#regDeath").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "block");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changeMail").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dChangeMail").css("display", "block");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changePass").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "block");
        $("#info").css("display", "none");
    });

});
$(function () {
    $("#cDob").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: 0,
        yearRange: "-150:+0"
    });
    $("#dod").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: 0,
        yearRange: "-150:+0"
    });
});