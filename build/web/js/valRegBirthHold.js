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
            alert('Please enter your District/Special District');
            $('#rDistrict').focus();
            return false;
        }
        if (!$.trim($('#rKebele').val())) {
            alert('Please enter kebele name');
            $('#rKebele').focus();
            return false;
        }
        if (!$.trim($('#mNidentity').val())) {
            alert('Please Enter Mother National ID Number');
            $('#mNidentity').focus();
            return false;
        }
        if (!$.trim($('#fNidentity').val())) {
            alert('Please Enter Father National ID Number');
            $('#fNidentity').focus();
            return false;
        }
        if (!$.trim($('#gNidentity').val())) {
            alert('Please enter National ID Number');
            $('#gNidentity').focus();
            return false;
        }
        if (!$.trim($('#gRelation').val())) {
            alert('Please enter Relation with the child');
            $('#gRelation').focus();
            return false;
        }
        if (!$.trim($('#rtNidentity').val())) {
            alert('Please enter rtNidentity');
            $('#rtNidentity').focus();
            return false;
        }
        if (!$.trim($('#cNidentity').val())) {
            alert('Please enter National ID');
            $('#cNidentity').focus();
            return false;
        }
        if (!$.trim($('#bInstitution').val())) {
            alert('Please enter Institution of Birth');
            $('#bInstitution').focus();
            return false;
        }
        if (!$.trim($('#cCity').val())) {
            alert('Please enter City Name');
            $('#cCity').focus();
            return false;
        }
        if (!$.trim($('#cSubcity').val())) {
            alert('Please enter SubCity Name');
            $('#cSubcity').focus();
            return false;
        }
        if (!$.trim($('#cDistrict').val())) {
            alert('Please Enter District/Special District name');
            $('#cDistrict').focus();
            return false;
        }
        if (!$.trim($('#cKebele').val())) {
            alert('Please Enter Kebele Name');
            $('#cKebele').focus();
            return false;
        }
        if (!$.trim($('#assistance').val())) {
            alert('Please enter Assistance offered during birth');
            $('#assistance').focus();
            return false;
        }
        if (!$.trim($('#weight').val())) {
            alert('Please enter Weight During Birth');
            $('#weight').focus();
            return false;
        }
        if (!$.trim($('#midNidentity').val())) {
            alert('Please enter Midwife National ID');
            $('#midNidentity').focus();
            return false;
        }
        if (!$.trim($('#credential').val())) {
            alert('Please enter Midwife Credential');
            $('#credential').focus();
            return false;
        }
        if (!$.trim($('#obWeburl').val())) {
            alert('Please enter obWeburl');
            $('#obWeburl').focus();
            return false;
        }

        if (!$.trim($('#btype').val())) {
            alert('Please enter birth type');
            $('#btype').focus();
            return false;
        }
       
    });
});