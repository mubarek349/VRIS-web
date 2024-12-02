<%@include file="nm2h41rnr6/config.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Certify Divorce</title>
    </head>
    <body>
        <br>
        <div class="container to-be-printed">
            <div class="row">
                <div class="col">
                    Divorce Registration Number: <u>${divorceid}</u>
                </div>
                <div class="col">
                    <img src="assets/et-flag.png" width="130" height="65">
                </div>
                <div class="col">
                    Grasswidow Birth Registration Number: <u>${gwbirthid}</u><br><br>
                    Grasswidower Birth Registration Number: <u>${gwrbirthid}</u>
                </div>
            </div>
            <br>
            <div class="row offset-2">
                <h5>FEDERAL DEMOCRATIC REPUBLIC OF ETHIOPIA VITAL REGISTRATION AGENCY</h5>
            </div>
            <div class="row offset-5">
                <h5>DIVORCE CERTIFICATE</h5>
            </div>
            <br><br>
            <div class="row">
                <div class="col">
                    Grasswidow Full Name    <u>${gwfname}</u><br><br>
                    Date of Birth    <u>${gwdob}</u><br><br>
                    Place of Birth    <u>${gwpob}</u><br><br>
                    Nationality    <u>${gwnat}</u><br><br>

                </div>
                <div class="col">
                    Grasswidower Full Name    <u>${gwrfname}</u><br><br>
                    Date of Birth    <u>${gwrdob}</u><br><br>
                    Place of Birth    <u>${gwrpob}</u><br><br>
                    Nationality    <u>${gwrnat}</u><br><br>

                </div>
            </div>
            <div class="row">
                <div class="col-5">
                    Date of Divorce    <u>${dodi}</u>
                </div>
                <div class="col-7">
                    Place of Divorce    <u>${pod}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col-5">
                    Date of Registration <u>${regdate}</u>
                </div>
                <div class="col-7">
                    Date of Certification <u>${certdate}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col-7">
                    Registrant Full Name <u>${rtname}</u>
                </div>
                <div class="col-5">
                    Signature
                </div>
            </div><br>
        </div>

        <style>
            @media print{
                body{
                    visibility: hidden;
                }
                .to-be-printed, .to-be-printed{
                    visibility: visible;
                }
            }
        </style>

        <div class="col-5 offset-4">
            <a href="kebele.jsp"><button class="btn btn-primary"> Back</button></a>&nbsp;&nbsp;
            <button onclick="window.print();" class="btn btn-success">Print</button>
        </div>
    </body>
</html>
