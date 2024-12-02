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
        if (!$.trim($('#decNidentity').val())) {
            alert('Please enter deceseased national id Number');
            $('#decNidentity').focus();
            return false;
        }
        if (!$.trim($('#decBirthID').val())) {
            alert('Please enter birth registration number');
            $('#decBirthID').focus();
            return false;
        }
        if (!$.trim($('#title').val())) {
            alert('Please enter title');
            $('#title').focus();
            return false;
        }
        if (!$.trim($('#relNidentity').val())) {
            alert('Please enter National Identification Number');
            $('#relNidentity').focus();
            return false;
        }
        if (!$.trim($('#relation').val())) {
            alert('Please enter Relation with the deceased');
            $('#relation').focus();
            return false;
        }
        if (!$.trim($('#dod').val())) {
            alert('Please enter Date of Death');
            $('#dod').focus();
            return false;
        }
        if (!$.trim($('#institution').val())) {
            alert('Please enter institution name');
            $('#institution').focus();
            return false;
        }
        if (!$.trim($('#dCity').val())) {
            alert('Please enter city name');
            $('#dCity').focus();
            return false;
        }
        if (!$.trim($('#dSubcity').val())) {
            alert('Please enter subSity name');
            $('#dSubcity').focus();
            return false;
        }
        if (!$.trim($('#dDistrict').val())) {
            alert('Please enter District/Special District');
            $('#dDistrict').focus();
            return false;
        }
        if (!$.trim($('#dKebele').val())) {
            alert('Please enter Kebele');
            $('#dKebele').focus();
            return false;
        }
        if (!$.trim($('#cause').val())) {
            alert('Please enter Cause of Death');
            $('#cause').focus();
            return false;
        }
        if (!$.trim($('#evidencetype').val())) {
            alert('Please enter Type of Evidence');
            $('#evidencetype').focus();
            return false;
        }
        if (!$.trim($('#evidenceid').val())) {
            alert('Please enter Evidence ID');
            $('#evidenceid').focus();
            return false;
        }
        if (!$.trim($('#burial').val())) {
            alert('Please enter Place of burial');
            $('#burial').focus();
            return false;
        }
        if (!$.trim($('#rtNidentity').val())) {
            alert('Please enter rtNidentity');
            $('#rtNidentity').focus();
            return false;
        }

        
    });
});