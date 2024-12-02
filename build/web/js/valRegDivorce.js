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
        if (!$.trim($('#xhNidentity').val())) {
            alert('Please enter National ID Number');
            $('#xhNidentity').focus();
            return false;
        }
        if (!$.trim($('#xhBirthID').val())) {
            alert('Please enter birth registration number');
            $('#xhBirthID').focus();
            return false;
        }
        if (!$.trim($('#xwNidentity').val())) {
            alert('Please enter National ID Number');
            $('#xwNidentity').focus();
            return false;
        }
        if (!$.trim($('#xwBirthID').val())) {
            alert('Please enter National Birth Registration Number');
            $('#xwBirthID').focus();
            return false;
        }
        if (!$.trim($('#xdom').val())) {
            alert('Please enter Date of the late Marriage');
            $('#xdom').focus();
            return false;
        }
        if (!$.trim($('#mOrder').val())) {
            alert('Please enter Type of Marriage (Traditional, Court)');
            $('#mOrder').focus();
            return false;
        }
        if (!$.trim($('#diCause').val())) {
            alert('Please enter Cause of divorce');
            $('#diCause').focus();
            return false;
        }
        if (!$.trim($('#dodi').val())) {
            alert('Please enter Date of divorce');
            $('#dodi').focus();
            return false;
        }
        if (!$.trim($('#diCourt').val())) {
            alert('Please enter Name of approving court');
            $('#diCourt').focus();
            return false;
        }
        if (!$.trim($('#diDocNum').val())) {
            alert('Please enter Document Number');
            $('#diDocNum').focus();
            return false;
        }
        if (!$.trim($('#children').val())) {
            alert('Please enter Number of Children');
            $('#children').focus();
            return false;
        }
        if (!$.trim($('#rtNidentity').val())) {
            alert('Please enter rtNidentity');
            $('#rtNidentity').focus();
            return false;
        }
        
    });
});