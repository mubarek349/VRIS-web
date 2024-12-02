<%@include file="nm2h41rnr6/config.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Certify Marriage</title>
    </head>
    <body>
        <br>
        <div class="container to-be-printed">
            <div class="row">
                <div class="col">
                    Marriage Registration Number: <u>${marriageid}</u>
                </div>
                <div class="col">
                    <img src="assets/et-flag.png" width="130" height="65">
                </div>
                <div class="col">
                    Bride Birth Registration Number: <u>${bbirthid}</u><br><br>
                    Groom Birth Registration Number: <u>${gbirthid}</u>
                </div>
            </div>
            <br>
            <div class="row offset-2">
                <h5>FEDERAL DEMOCRATIC REPUBLIC OF ETHIOPIA VITAL REGISTRATION AGENCY</h5>
            </div>
            <div class="row offset-5">
                <h5>MARRIAGE CERTIFICATE</h5>
            </div>
            <br><br>
            <div class="row">
                <div class="col">
                    Bride Full Name    <u>${bfname}</u><br><br>
                    Date of Birth    <u>${bdob}</u><br><br>
                    Place of Birth    <u>${bpob}</u><br><br>
                    Nationality    <u>${bnat}</u><br><br>

                </div>
                <div class="col">
                    Groom Full Name    <u>${gfname}</u><br><br>
                    Date of Birth    <u>${gdob}</u><br><br>
                    Place of Birth    <u>${gpob}</u><br><br>
                    Nationality    <u>${gnat}</u><br><br>

                </div>
            </div>
            <div class="row">
                <div class="col-5">
                    Date of Marriage    <u>${dom}</u>
                </div>
                <div class="col-7">
                    Type of Marriage    <u>${pom}</u>
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
