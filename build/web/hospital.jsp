<%@include file="nm2h41rnr6/config.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital VE Registrant</title>
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/hospital.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("username") == null || !session.getAttribute("uType").equals("hospital_emp")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="sidenav">
            <h5 style="color: white; text-align: center">Services</h5>
            <a href="#" id="regBirth">Register Birth</a>
            <a href="#" id="regDeath">Register Death</a>
            <a href="#" id="changeMail">Change Email</a>
            <a href="#" id="changePass">Change Password</a>
            <a href="searchpeople.jsp">Search</a>
        </div>
        <div class="wrapper main">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="index.jsp">VRIS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">About <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.jsp">Contact <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="help.jsp">Help <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <div class="my-2 my-lg-0">
                        <a class="btn btn-outline-danger my-2 my-sm-0" href="Logout">Logout</a>
                    </div>
                </div>
            </nav>

            <div id="info" class="offset-5">
                <h2>${msg}</h2>
                <img src="assets/colcover.png">
            </div>
            <br>
            <div id="dRegBirth" style="display: none">
                <div class="container">
                    <h3 style="color: green">NOTE: Family of the child must have a National ID</h3><br>
                    <%@include file="nm2h41rnr6/regbirth.jsp" %>
                    <script>
                        $(function () {
                            $("#bWeburl").val("hospital.jsp");
                            $("#bBtnCancel").click(function () {
                                window.location.href = 'hospital.jsp';
                            });
                        });
                    </script>
                </div>
            </div>

            <div id="dRegDeath" style="display: none">
                <div class="container">
                    <h3 style="color: green">NOTE: Family of the deceased must have National ID and Birth Certificate of the deceased</h3><br>
                    <%@include file="nm2h41rnr6/regdeath.jsp" %>
                    <script>
                        $(function () {
                            $("#dWeburl").val("hospital.jsp");
                            $("#dBtnCancel").click(function () {
                                window.location.href = 'hospital.jsp';
                            });
                        });
                    </script>
                </div>
            </div>
            <div id="dChangeMail" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changemail.jsp" %>
                <script>
                    $(function () {
                        $("#cmWeburl").val("hospital.jsp");
                    });
                </script>
            </div>
            <div id="dChangePass" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changepass.jsp" %>
                <script>
                    $(function () {
                        $("#cpWeburl").val("hospital.jsp");
                    });
                </script>
            </div>

            <div class="push"></div>
        </div>
        <%@include file="nm2h41rnr6/minifooter.jsp" %>
    </body>
</html>
