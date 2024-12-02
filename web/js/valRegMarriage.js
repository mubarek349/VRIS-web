$(document).ready(function () {
    $('#pForm').submit(function () {
        if (!$.trim($('#rCity').val())) {
            alert('Please enter city name');
            $('#rCity').focus();
            return false;
        }
        if (!$.trim($('#rSubcity').val())) {
            alert('Please enter subCity name');
            $('#rSubcity').focus();
            return false;
        }
        if (!$.trim($('#rDistrict').val())) {
            alert('Please enter  district/specialDistrict');
            $('#rDistrict').focus();
            return false;
        }
        if (!$.trim($('#rKebele').val())) {
            alert('Please enter kebele name');
            $('#rKebele').focus();
            return false;
        }
        if (!$.trim($('#idn').val())) {
            alert('Please enter National ID Number');
            $('#idn').focus();
            return false;
        }
        if (!$.trim($('#bBirthID').val())) {
            alert('Please enter Birth Registration Number');
            $('#bBirthID').focus();
            return false;
        }
        if (!$.trim($('#gNidentity').val())) {
            alert('Please enter National ID Number');
            $('#gNidentity').focus();
            return false;
        }
        if (!$.trim($('#gBirthID').val())) {
            alert('Please enter Birth Registration Number');
            $('#gBirthID').focus();
            return false;
        }
        if (!$.trim($('#dom').val())) {
            alert('Please enter Date of the late Marriage');
            $('#dom').focus();
            return false;
        }
        if (!$.trim($('#mOrder').val())) {
            alert('Please enter Type of Marriage (Traditional, Court)');
            $('#mOrder').focus();
            return false;
        }
        if (!$.trim($('#bWitOneID').val())) {
            alert('Please Enter witness 1 National ID Number');
            $('#bWitOneID').focus();
            return false;
        }
        if (!$.trim($('#bWitTwoID').val())) {
            alert('Please enter witness 2 National ID Number');
            $('#bWitTwoID').focus();
            return false;
        }
        if (!$.trim($('#gWitOneID').val())) {
            alert('Please Enter witness 3 National ID Number');
            $('#gWitOneID').focus();
            return false;
        }
        if (!$.trim($('#gWitTwoID').val())) {
            alert('Please Enter witness 4 National ID Number');
            $('#gWitTwoID').focus();
            return false;
        }
        if (!$.trim($('#rtNidentity').val())) {
            alert('Please enter Number of rtNidentity');
            $('#rtNidentity').focus();
            return false;
        }
        if (!$.trim($('#mWeburl').val())) {
            alert('Please enter mWeburl');
            $('#mWeburl').focus();
            return false;
        }
        
    });
});