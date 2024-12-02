<%@page import="java.sql.Statement"%>
<%@include file="nm2h41rnr6/config.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kebele VE Registrant</title>
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/kebele.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("username") == null || !session.getAttribute("uType").equals("kebele_emp")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="sidenav">
            <h5 style="color: white; text-align: center">Services</h5>
            <a href="#" id="regBirth">Register Birth</a>
            <a href="#" id="regDeath">Register Death</a>
            <a href="#" id="regMarriage">Register Marriage</a>
            <a href="#" id="regDivorce">Register Divorce</a>
            <a href="#" id="certBirth">Certify Birth</a>
            <a href="#" id="certDeath">Certify Death</a>
            <a href="#" id="certMarriage">Certify Marriage</a>
            <a href="#" id="certDivorce">Certify Divorce</a>
            <a href="#" id="issueID">Issue National ID</a>
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
            <div id="info" class="offset-4">
                <h2>${msg}</h2>
                <img src="assets/colcover.png">
            </div>
            <div id="dRegBirth" style="display: none">
                <div class="container">
                    <h3 style="color: green">Family of the child must have National ID</h3>
                </div>
                <br>
                <div>
                    <div class="col-6 offset-3">
                        <div class="form-row">
                            <div class="col">                            
                                <button class="btn btn-lg btn-success btn-block" id="more18">If the Person has ID</button>
                            </div>
                            <div class="col">
                                <button class="btn btn-lg btn-success btn-block" id="less18">If the Child is Newborn</button> 
                            </div>
                        </div>
                    </div>
                    <br>
                    <diV id="dMore18" style="display: none">
                        <%@include file="nm2h41rnr6/regbirthold.jsp" %>
                        <script>
                            $(function () {
                                $("#obWeburl").val("kebele.jsp");
                                $("#obBtnCancel").click(function () {
                                    window.location.href = 'kebele.jsp';
                                });
                            });
                        </script>
                    </diV>

                    <div id="dLess18" style="display: none">
                        <%@include file="nm2h41rnr6/regbirth.jsp" %>
                        <script>
                            $(function () {
                                $("#bWeburl").val("kebele.jsp");
                                $("#bBtnCancel").click(function () {
                                    window.location.href = 'kebele.jsp';
                                });
                            });
                        </script>
                    </div>
                </div>
            </div>
            <div id="dRegDeath" style="display: none">
                <div class="container">
                    <h3 style="color: green">NOTE: Family of the deceased must have National ID and Birth Certificate of the deceased.</h3>
                </div>

                <%@include file="nm2h41rnr6/regdeath.jsp" %>
                <script>
                    $(function () {
                        $("#dWeburl").val("kebele.jsp");
                        $("#dBtnCancel").click(function () {
                            window.location.href = 'kebele.jsp';
                        });
                    });
                </script>
            </div>
            <div id="dRegMarriage" style="display: none">
                <div class="container">
                    <h3 style="color: green">NOTE: Both the Bride and Groom must present their National ID and Birth Certificate</h3><br>
                    <%@include file="nm2h41rnr6/regmarriage.jsp" %>
                    <script>
                        $(function () {
                            $("#mWeburl").val("kebele.jsp");
                            $("#mBtnCancel").click(function () {
                                window.location.href = 'kebele.jsp';
                            });
                        });
                    </script>
                </div>
            </div>
            <div id="dRegDivorce" style="display: none">
                <div class="container">
                    <h3 style="color: green">NOTE: Both the Bride and Groom must present their National ID and Birth Certificate</h3><br>
                    <%@include file="nm2h41rnr6/regdivorce.jsp" %>
                    <script>
                        $(function () {
                            $("#diWeburl").val("kebele.jsp");
                            $("#diBtnCancel").click(function () {
                                window.location.href = 'kebele.jsp';
                            });
                        });
                    </script>
                </div>
            </div>
            <br>
            <div id="dCertBirth" style="display: none">
                <form action="CertifyBirth" method="POST" class="col-4 offset-4">
                    <input type="text" name="birthID" class="form-control" placeholder="Birth Registration Number" required> <br>
                    <button type="submit" class="btn btn-success btn-lg">Certify</button>
                </form>
            </div>
            <div id="dCertDeath" style="display: none">
                <form action="CertifyDeath" method="POST" class="col-4 offset-4">
                    <input type="text" name="deathID" class="form-control" placeholder="Death Registration Number" required> <br>
                    <button type="submit" class="btn btn-success btn-lg">Certify</button>
                </form>
            </div>
               <div id="dCertMarriage" style="display: none">
                <form action="CertifyMarriage" method="POST" class="col-4 offset-4">
                    <input type="text" name="marriageID" class="form-control" placeholder="Marriage Registration Number" required> <br>
                    <button type="submit" class="btn btn-success btn-lg">Certify</button>
                </form>
            </div>
            <div id="dCertDivorce" style="display: none">
                <form action="CertifyDivorce" method="POST" class="col-4 offset-4">
                    <input type="text" name="divorceID" class="form-control" placeholder="Divorce Registration Number" required> <br>
                    <button type="submit" class="btn btn-success btn-lg">Certify</button>
                </form>
            </div>
            <div id="dIssueID" style="display: none">
                <div class="col-6 offset-3">
                    <div class="form-row">
                        <div class="col">                            
                            <button class="btn btn-lg btn-success btn-block" id="idonly">If the person does not have birth certificate</button>
                        </div>
                        <div class="col">
                            <button class="btn btn-lg btn-success btn-block" id="idwithbirth">If the person have birth certificate</button> 
                        </div>
                    </div>
                </div>
                <br>
                <div id="dIdonly" style="display: none">
                    <%@include file="nm2h41rnr6/regperson.jsp" %>
                    <script>
                        $(function () {
                            $("#regweburl").val("kebele.jsp");
                        });
                    </script>
                </div>
                <div id="dIdwithbirth" style="display: none">
                    <%@include file="nm2h41rnr6/regpersonwithbirth.jsp" %>
                    <script>
                        $(function () {
                            $("#regwbweburl").val("kebele.jsp");
                        });
                    </script>
                </div>
            </div>
            <div id="dChangeMail" style="display: none">
                <%@include file="nm2h41rnr6/changemail.jsp" %>
                <script>
                    $(function () {
                        $("#cmWeburl").val("kebele.jsp");
                    });
                </script>
            </div>
            <div id="dChangePass" style="display: none">
                <%@include file="nm2h41rnr6/changepass.jsp" %>
                <script>
                    $(function () {
                        $("#cpWeburl").val("kebele.jsp");
                    });
                </script>
            </div>
            <div class="push"></div>
        </div>
        <%@include file="nm2h41rnr6/minifooter.jsp" %>
    </body>
</html>
