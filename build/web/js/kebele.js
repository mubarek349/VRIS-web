
$(document).ready(function () {
    $("#regBirth").click(function () {
        $("#dRegBirth").css("display", "block");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });

    $("#regDeath").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "block");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#regMarriage").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "block");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#regDivorce").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "block");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#certBirth").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "block");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#certDeath").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "block");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#certMarriage").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "block");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#certDivorce").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "block");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#issueID").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "block");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changeMail").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "block");
        $("#dChangePass").css("display", "none");
        $("#info").css("display", "none");
    });
    $("#changePass").click(function () {
        $("#dRegBirth").css("display", "none");
        $("#dRegDeath").css("display", "none");
        $("#dRegMarriage").css("display", "none");
        $("#dRegDivorce").css("display", "none");
        $("#dCertBirth").css("display", "none");
        $("#dCertDeath").css("display", "none");
        $("#dCertMarriage").css("display", "none");
        $("#dCertDivorce").css("display", "none");
        $("#dIssueID").css("display", "none");
        $("#dChangeMail").css("display", "none");
        $("#dChangePass").css("display", "block");
        $("#info").css("display", "none");
    });

    $("#more18").click(function () {
        $("#dMore18").css("display", "block");
        $("#dLess18").css("display", "none");
    });
    $("#less18").click(function () {
        $("#dLess18").css("display", "block");
        $("#dMore18").css("display", "none");
    });

    $("#idonly").click(function () {
        $("#dIdonly").css("display", "block");
        $("#dIdwithbirth").css("display", "none");
    });
    $("#idwithbirth").click(function () {
        $("#dIdonly").css("display", "none");
        $("#dIdwithbirth").css("display", "block");
    });

});
$(function () {
    $("#dob").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: 0,
        yearRange: "-150:+0"
    });
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
    $("#dom").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: 0,
        yearRange: "-150:+0"
    });
});

$(function () {
    $('#regPIForm').submit(function () {
        var pattern = /^[a-zA-Z]*$/;

        if (!(pattern.test($('#birthplace').val()))) {
            alert("Should contain only Characters");
            $('#birthplace').focus();
            return false;
        }
        if (!(pattern.test($('#residence').val()))) {
            alert("Should contain only Characters");
            $('#residence').focus();
            return false;
        }
        if (!(pattern.test($('#religion').val()))) {
            alert("Should contain only Characters");
            $('#religion').focus();
            return false;
        }
        if (!(pattern.test($('#education').val()))) {
            alert("Should contain only Characters");
            $('#education').focus();
            return false;
        }
        if (!(pattern.test($('#occupation').val()))) {
            alert("Should contain only Characters");
            $('#occupation').focus();
            return false;
        }
    });

    $('#regPForm').submit(function () {
        var pattern = /^[a-zA-Z]*$/;

        if (!(pattern.test($('#first_name').val()))) {
            alert("Should contain only Characters");
            $('#first_name').focus();
            return false;
        }
        if (!(pattern.test($('#middle_name').val()))) {
            alert("Should contain only Characters");
            $('#middle_name').focus();
            return false;
        }
        if (!(pattern.test($('#last_name').val()))) {
            alert("Should contain only Characters");
            $('#last_name').focus();
            return false;
        }
        if (!(pattern.test($('#nationality').val()))) {
            alert("Should contain only Characters");
            $('#nationality').focus();
            return false;
        }
        if (!(pattern.test($('#birthplace2').val()))) {
            alert("Should contain only Characters");
            $('#birthplace2').focus();
            return false;
        }
        if (!(pattern.test($('#residence2').val()))) {
            alert("Should contain only Characters");
            $('#residence2').focus();
            return false;
        }
        if (!(pattern.test($('#religion2').val()))) {
            alert("Should contain only Characters");
            $('#religion2').focus();
            return false;
        }
        if (!(pattern.test($('#education2').val()))) {
            alert("Should contain only Characters");
            $('#education2').focus();
            return false;
        }
        if (!(pattern.test($('#occupation2').val()))) {
            alert("Should contain only Characters");
            $('#occupation2').focus();
            return false;
        }
    });
});