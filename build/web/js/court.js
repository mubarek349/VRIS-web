
$(document).ready(function () {
    $("#regMarriage").click(function () {
        $("#dRegMarriage").css("display", "block");
        $("#dRegDivorce").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#regDivorce").click(function () {
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "block");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changeMail").click(function () {
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dChangeMail").css("display", "block");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changePass").click(function () {
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "block");
        $("#info").css("display", "none");
    });
});
$(function () {
    $("#dom").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: 0,
        yearRange: "-150:+0"
    });
    $("#dodi").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: 0,
        yearRange: "-150:+0"
    });
    $("#xdom").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: 0,
        yearRange: "-150:+0"
    });
});