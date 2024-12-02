$(document).ready(function () {
    $('#pForm').submit(function () {
        if (!$.trim($('#fname').val())) {
            alert('Please enter first name');
            $('#fname').focus();
            return false;
        }
        if (!$.trim($('#mname').val())) {
            alert('Please enter middle name');
            $('#mname').focus();
            return false;
        }
        if (!$.trim($('#lname').val())) {
            alert('Please enter last name');
            $('#lname').focus();
            return false;
        }
        if (!$.trim($('#email').val())) {
            alert('Please enter email address');
            $('#email').focus();
            return false;
        }
        if (!$.trim($('#pass').val())) {
            alert('Please Enter password');
            $('#pass').focus();
            return false;
        }
       

        
    });
});