$(document).ready(function () {
    $('#cpForm').submit(function () {
        if (!($.trim($('#t1').val()) === $.trim($('#t2').val()))) {
            alert("Password don't match");
            $('#t2').focus();
            return false;
        }
    });
});