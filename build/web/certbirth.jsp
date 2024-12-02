<%@include file="nm2h41rnr6/config.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Certify Birth</title>
    </head>
    <body>
        <br>
        <div class="container to-be-printed">
            <div class="row">
                <div class="col">

                </div>
                <div class="col">
                    <img src="assets/et-flag.png" width="130" height="65">
                </div>
                <div class="col">
                    Birth Registration Number: <u>${birthid}</u>
                </div>
            </div>
            <br>
            <div class="row offset-2">
                <h5>FEDERAL DEMOCRATIC REPUBLIC OF ETHIOPIA VITAL REGISTRATION AGENCY</h5>
            </div>
            <div class="row offset-5">
                <h5>BIRTH CERTIFICATE</h5>
            </div>
            <br><br>
            <div class="row">
                <div class="col">
                    Child's Name    <u>${cfname}</u>
                </div>
                <div class="col">
                    Middle Name  <u>${cmname}</u>
                </div>
                <div class="col">
                    Last Name <u>${clname}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col-2">
                    Gender <u>${gender}</u>
                </div>
                <div class="offset-1">
                    Date of Birth <u>${dob}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col-8">
                    Place of Birth <u>${pob}</u>
                </div>
                <div class="col-4">
                    Nationality <u>${cnat}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col-7">
                    Mother's Full Name <u>${mname}</u>
                </div>
                <div class="col-5">
                    Mother's Nationality <u>${mnat}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col-7">
                    Father's Full Name <u>${fname}</u>
                </div>
                <div class="col-5">
                    Father's Nationality <u>${fnat}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col">
                    Date of Registration <u>${regdate}</u>
                </div>
                <div class="col">
                    Date of Certification <u>${certdate}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col">
                    Registrant Full Name <u>${rtname}</u>
                </div>
            </div><br>
            <div class="row">
                <div class="col">
                    Signature
                </div>
            </div>
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
