$(document).ready(function () {
////////////////////
    $('#t1').keyup(function () {
        var str = $('#t1').val();
        var upper_text = new RegExp('[A-Z]');
        var lower_text = new RegExp('[a-z]');
        var number_check = new RegExp('[0-9]');
        var special_char = new RegExp('[!/\'^�$%&*()}{@#~?><>,|=_+�-\]');

        var flag = 'T';

        if (str.match(upper_text)) {
            $('#d12').html("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span> One Upper Case Letter ");
            $('#d12').css("color", "green");
        } else {
            $('#d12').css("color", "red");
            $('#d12').html("<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> One Upper Case Letter ");
            flag = 'F';
        }

        if (str.match(lower_text)) {
            $('#d13').html("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span> One Lower Case Letter ");
            $('#d13').css("color", "green");
        } else {
            $('#d13').css("color", "red");
            $('#d13').html("<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> One Lower Case Letter ");
            flag = 'F';
        }

        if (str.match(special_char)) {
            $('#d14').html("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span> One Special Char ");
            $('#d14').css("color", "green");
        } else {
            $('#d14').css("color", "red");
            $('#d14').html("<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> One Special Char ");
            flag = 'F';
        }

        if (str.match(number_check)) {
            $('#d15').html("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span> One Number ");
            $('#d15').css("color", "green");
        } else {
            $('#d15').css("color", "red");
            $('#d15').html("<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> One Number ");
            flag = 'F';
        }


        if (str.length > 7) {
            $('#d16').html("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span> Length 8 Char ");

            $('#d16').css("color", "green");
        } else {
            $('#d16').css("color", "red");
            $('#d16').html("<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Length 8 Char ");

            flag = 'F';
        }


        if (flag === 'T') {
            $("#d1").fadeOut();
            $('#display_box').css("color", "green");
            $('#display_box').html("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span> " + str);
        } else {
            $("#d1").show();
            $('#display_box').css("color", "red");
            $('#display_box').html("<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> " + str);
        }
    });
///////////////////
    $('#t1').blur(function () {
        $("#d1").fadeOut();
    });
///////////
    $('#t1').focus(function () {
        $("#d1").show();
    });
////////////

});


