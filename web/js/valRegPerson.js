$(document).ready(function () {
    $('#pForm').submit(function () {
        if (!$.trim($('#first_name').val())) {
            alert('Please enter first name');
            $('#first_name').focus();
            return false;
        }
        if (!$.trim($('#middle_name').val())) {
            alert('Please enter middle name');
            $('#middle_name').focus();
            return false;
        }
        if (!$.trim($('#last_name').val())) {
            alert('Please enter  last name');
            $('#last_name').focus();
            return false;
        }
        if (!$.trim($('#nationality').val())) {
            alert('Please enter Natioality');
            $('#nationality').focus();
            return false;
        }
        if (!$.trim($('#dob').val())) {
            alert('Please enter Date of Birth');
            $('#dob').focus();
            return false;
        }
        if (!$.trim($('#birthplace').val())) {
            alert('Please enter country of birth');
            $('#birthplace').focus();
            return false;
        }
        if (!$.trim($('#residence').val())) {
            alert('Please enter country of residence');
            $('#residence').focus();
            return false;
        }
        if (!$.trim($('#religion').val())) {
            alert('Please enter religion');
            $('#religion').focus();
            return false;
        }
        if (!$.trim($('#education').val())) {
            alert('Please enter Educational Background');
            $('#education').focus();
            return false;
        }
        if (!$.trim($('#occupation').val())) {
            alert('Please enter Occupation');
            $('#occupation').focus();
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