<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vris.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@include file="nm2h41rnr6/config.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CSA Administrator</title>
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/csa.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("username") == null || !session.getAttribute("uType").equals("csa")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="sidenav">
            <h5 style="color: white; text-align: center">Services</h5>
            <a href="#" id="viewRep">View Report</a>
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

            <div id="dViewRep" style="display: none">
                <br>
                <div class="container">
                    <div class="row">
                        <div class="col-3">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle btn-block" type="button" id="birthDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Birth
                                </button>
                                <div class="dropdown-menu" aria-labelledby="birthDropdown">
                                    <button class="dropdown-item" id="birthDaily">Daily</button>
                                    <button class="dropdown-item" id="birthWeekly">Weekly</button>
                                    <button class="dropdown-item" id="birthMonthly">Monthly</button>
                                    <button class="dropdown-item" id="birthAnnually">Annually</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle btn-block" type="button" id="deathDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Death
                                </button>
                                <div class="dropdown-menu" aria-labelledby="deathDropdown">
                                    <button class="dropdown-item" id="deathDaily">Daily</button>
                                    <button class="dropdown-item" id="deathWeekly">Weekly</button>
                                    <button class="dropdown-item" id="deathMonthly">Monthly</button>
                                    <button class="dropdown-item" id="deathAnnually">Annually</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle btn-block" type="button" id="marriageDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Marriage
                                </button>
                                <div class="dropdown-menu" aria-labelledby="marriageDropdown">
                                    <button class="dropdown-item" id="marriageDaily">Daily</button>
                                    <button class="dropdown-item" id="marriageWeekly">Weekly</button>
                                    <button class="dropdown-item" id="marriageMonthly">Monthly</button>
                                    <button class="dropdown-item" id="marriageAnnually">Annually</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle btn-block" type="button" id="divorceDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Divorce
                                </button>
                                <div class="dropdown-menu" aria-labelledby="divorceDropdown">
                                    <button class="dropdown-item" id="divorceDaily">Daily</button>
                                    <button class="dropdown-item" id="divorceWeekly">Weekly</button>
                                    <button class="dropdown-item" id="divorceMonthly">Monthly</button>
                                    <button class="dropdown-item" id="divorceAnnually">Annually</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-3">
                            <diV id="dBirthDaily" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        Connection con = null;
                                        Statement stmt = null;
                                        ResultSet rs = null;

                                        SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");
                                        String today = String.valueOf(tf.format(new java.util.Date().getTime()));

                                        String data = "select * from birth where reg_date = " + "'" + today + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        Statement stmt2 = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        int counter = 0;
                                        String child_id;
                                        String genderQuery;
                                        String gender;
                                        int male = 0, female = 0;

                                        while (rs.next()) {
                                            counter++;
                                            child_id = rs.getString("child_id");
                                            genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
                                            ResultSet rs2 = stmt2.executeQuery(genderQuery);
                                            while (rs2.next()) {
                                                gender = rs2.getString("gender");
                                                if (gender.equals("Male")) {
                                                    male++;
                                                } else if (gender.equals("Female")) {
                                                    female++;
                                                }
                                            }
                                        }
                                    %>
                                    <h4>Daily Births : <%= counter%></h4>
                                    <h4>Male : <%= male%></h4>
                                    <h4>Female : <%= female%></h4>
                                </div>
                            </diV>
                            <diV id="dBirthWeekly" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%

                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        Calendar originalDate = Calendar.getInstance();
                                        Calendar previousWeekDay = (Calendar) originalDate.clone();
                                        previousWeekDay.add(Calendar.WEEK_OF_YEAR, -1);
                                        String last_week = String.valueOf(tf.format(previousWeekDay.getTime()));

                                        data = "select * from birth where reg_date > " + "'" + last_week + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        stmt2 = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;

                                        male = 0;
                                        female = 0;
                                        while (rs.next()) {
                                            counter++;
                                            child_id = rs.getString("child_id");
                                            genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
                                            ResultSet rs2 = stmt2.executeQuery(genderQuery);
                                            while (rs2.next()) {
                                                gender = rs2.getString("gender");
                                                if (gender.equals("Male")) {
                                                    male++;
                                                } else if (gender.equals("Female")) {
                                                    female++;
                                                }
                                            }
                                        }
                                    %>
                                    <h4>Weekly Births : <%= counter%></h4>
                                    <h4>Male : <%= male%></h4>
                                    <h4>Female : <%= female%></h4>
                                </div>
                            </diV>
                            <diV id="dBirthMonthly" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        originalDate.add(Calendar.MONTH, -1);
                                        String last_month = String.valueOf(tf.format(originalDate.getTime()));

                                        data = "select * from birth where reg_date > " + "'" + last_month + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        stmt2 = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;

                                        male = 0;
                                        female = 0;
                                        while (rs.next()) {
                                            counter++;
                                            child_id = rs.getString("child_id");
                                            genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
                                            ResultSet rs2 = stmt2.executeQuery(genderQuery);
                                            while (rs2.next()) {
                                                gender = rs2.getString("gender");
                                                if (gender.equals("Male")) {
                                                    male++;
                                                } else if (gender.equals("Female")) {
                                                    female++;
                                                }
                                            }
                                        }
                                    %>
                                    <h4>Monthly Births : <%= counter%></h4>
                                    <h4>Male : <%= male%></h4>
                                    <h4>Female : <%= female%></h4>
                                </div>
                            </diV>
                            <diV id="dBirthAnnually" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        originalDate.add(Calendar.YEAR, -1);
                                        String last_year = String.valueOf(tf.format(originalDate.getTime()));

                                        data = "select * from birth where reg_date > " + "'" + last_year + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        stmt2 = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;

                                        male = 0;
                                        female = 0;
                                        while (rs.next()) {
                                            counter++;
                                            child_id = rs.getString("child_id");
                                            genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
                                            ResultSet rs2 = stmt2.executeQuery(genderQuery);
                                            while (rs2.next()) {
                                                gender = rs2.getString("gender");
                                                if (gender.equals("Male")) {
                                                    male++;
                                                } else if (gender.equals("Female")) {
                                                    female++;
                                                }
                                            }
                                        }
                                    %>
                                    <h4>Annual Births : <%= counter%></h4>
                                    <h4>Male : <%= male%></h4>
                                    <h4>Female : <%= female%></h4>
                                </div>
                            </diV>
                        </div>
                        <div class="col-3">
                            <diV id="dDeathDaily" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        today = String.valueOf(tf.format(new java.util.Date().getTime()));

                                        data = "select * from death where reg_date = " + "'" + today + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        stmt2 = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        String deceased_id;
                                        counter = 0;

                                        male = 0;
                                        female = 0;
                                        while (rs.next()) {
                                            counter++;
                                            deceased_id = rs.getString("deceased_id");
                                            genderQuery = "select gender from people where national_id = " + "'" + deceased_id + "'";
                                            ResultSet rs2 = stmt2.executeQuery(genderQuery);
                                            while (rs2.next()) {
                                                gender = rs2.getString("gender");
                                                if (gender.equals("Male")) {
                                                    male++;
                                                } else if (gender.equals("Female")) {
                                                    female++;
                                                }
                                            }
                                        }
                                    %>
                                    <h4>Daily Death : <%= counter%></h4>
                                    <h4>Male : <%= male%></h4>
                                    <h4>Female : <%= female%></h4>
                                </div>
                            </diV>
                            <diV id="dDeathWeekly" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%

                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        previousWeekDay = (Calendar) originalDate.clone();
                                        previousWeekDay.add(Calendar.WEEK_OF_YEAR, -1);
                                        last_week = String.valueOf(tf.format(previousWeekDay.getTime()));

                                        data = "select * from death where reg_date > " + "'" + last_week + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        stmt2 = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;

                                        male = 0;
                                        female = 0;
                                        while (rs.next()) {
                                            counter++;
                                            deceased_id = rs.getString("deceased_id");
                                            genderQuery = "select gender from people where national_id = " + "'" + deceased_id + "'";
                                            ResultSet rs2 = stmt2.executeQuery(genderQuery);
                                            while (rs2.next()) {
                                                gender = rs2.getString("gender");
                                                if (gender.equals("Male")) {
                                                    male++;
                                                } else if (gender.equals("Female")) {
                                                    female++;
                                                }
                                            }
                                        }
                                    %>
                                    <h4>Weekly Death : <%= counter%></h4>
                                    <h4>Male : <%= male%></h4>
                                    <h4>Female : <%= female%></h4>
                                </div>
                            </diV>
                            <diV id="dDeathMonthly" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        originalDate.add(Calendar.MONTH, -1);
                                        last_month = String.valueOf(tf.format(originalDate.getTime()));

                                        data = "select * from death where reg_date > " + "'" + last_month + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        stmt2 = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;

                                        male = 0;
                                        female = 0;
                                        while (rs.next()) {
                                            counter++;
                                            deceased_id = rs.getString("deceased_id");
                                            genderQuery = "select gender from people where national_id = " + "'" + deceased_id + "'";
                                            ResultSet rs2 = stmt2.executeQuery(genderQuery);
                                            while (rs2.next()) {
                                                gender = rs2.getString("gender");
                                                if (gender.equals("Male")) {
                                                    male++;
                                                } else if (gender.equals("Female")) {
                                                    female++;
                                                }
                                            }
                                        }
                                    %>
                                    <h4>Monthly Death : <%= counter%></h4>
                                    <h4>Male : <%= male%></h4>
                                    <h4>Female : <%= female%></h4>
                                </div>
                            </diV>
                            <diV id="dDeathAnually" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        originalDate.add(Calendar.YEAR, -1);
                                        last_year = String.valueOf(tf.format(originalDate.getTime()));

                                        data = "select * from death where reg_date > " + "'" + last_year + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        stmt2 = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;

                                        male = 0;
                                        female = 0;
                                        while (rs.next()) {
                                            counter++;
                                            deceased_id = rs.getString("deceased_id");
                                            genderQuery = "select gender from people where national_id = " + "'" + deceased_id + "'";
                                            ResultSet rs2 = stmt2.executeQuery(genderQuery);
                                            while (rs2.next()) {
                                                gender = rs2.getString("gender");
                                                if (gender.equals("Male")) {
                                                    male++;
                                                } else if (gender.equals("Female")) {
                                                    female++;
                                                }
                                            }
                                        }
                                    %>
                                    <h4>Annual Death : <%= counter%></h4>
                                    <h4>Male : <%= male%></h4>
                                    <h4>Female : <%= female%></h4>
                                </div>
                            </diV>
                        </div>
                        <div class="col-3">
                            <div id="dMarriageDaily" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        today = String.valueOf(tf.format(new java.util.Date().getTime()));

                                        data = "select * from marriage where reg_date = " + "'" + today + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;
                                        while (rs.next()) {
                                            counter++;
                                        }
                                    %>
                                    <h4>Daily Marriage : <%= counter%></h4>
                                </div>
                            </div>
                            <div id="dMarriageWeekly" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        previousWeekDay = (Calendar) originalDate.clone();
                                        previousWeekDay.add(Calendar.WEEK_OF_YEAR, -1);
                                        last_week = String.valueOf(tf.format(previousWeekDay.getTime()));

                                        data = "select * from marriage where reg_date > " + "'" + last_week + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;
                                        while (rs.next()) {
                                            counter++;
                                        }
                                    %>
                                    <h4>Weekly Marriage : <%= counter%></h4>
                                </div>
                            </div>
                            <div id="dMarriageMonthly" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        originalDate.add(Calendar.MONTH, -1);
                                        last_month = String.valueOf(tf.format(originalDate.getTime()));

                                        data = "select * from marriage where reg_date > " + "'" + last_month + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;
                                        while (rs.next()) {
                                            counter++;
                                        }
                                    %>
                                    <h4>Monthly Marriage : <%= counter%></h4>
                                </div>
                            </div>
                            <div id="dMarriageAnually" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        originalDate.add(Calendar.YEAR, -1);
                                        last_year = String.valueOf(tf.format(originalDate.getTime()));

                                        data = "select * from death where reg_date > " + "'" + last_year + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;
                                        while (rs.next()) {
                                            counter++;
                                        }
                                    %>
                                    <h4>Annual Marriage : <%= counter%></h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <diV id="dDivorceDaily" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        today = String.valueOf(tf.format(new java.util.Date().getTime()));

                                        data = "select * from divorce where reg_date = " + "'" + today + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;
                                        while (rs.next()) {
                                            counter++;
                                        }
                                    %>
                                    <h4>Daily Divorce : <%= counter%></h4>
                                </div>
                            </diV>
                            <div id="dDivorceWeekly" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        previousWeekDay = (Calendar) originalDate.clone();
                                        previousWeekDay.add(Calendar.WEEK_OF_YEAR, -1);
                                        last_week = String.valueOf(tf.format(previousWeekDay.getTime()));

                                        data = "select * from divorce where reg_date > " + "'" + last_week + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;
                                        while (rs.next()) {
                                            counter++;
                                        }
                                    %>
                                    <h4>Weekly Divorce : <%= counter%></h4>
                                </div>
                            </div>
                            <div id="dDivorceMonthly" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        originalDate.add(Calendar.MONTH, -1);
                                        last_month = String.valueOf(tf.format(originalDate.getTime()));

                                        data = "select * from divorce where reg_date > " + "'" + last_month + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;
                                        while (rs.next()) {
                                            counter++;
                                        }
                                    %>
                                    <h4>Monthly Divorce : <%= counter%></h4>
                                </div>
                            </div>
                            <div id="dDivorceAnually" style="display: none">
                                <br>
                                <div class="alert alert-primary" role="alert">
                                    <%
                                        tf = new SimpleDateFormat("yyyy-MM-dd");
                                        originalDate = Calendar.getInstance();
                                        originalDate.add(Calendar.YEAR, -1);
                                        last_year = String.valueOf(tf.format(originalDate.getTime()));

                                        data = "select * from divorce where reg_date > " + "'" + last_year + "'";
                                        con = DB.getConn();
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(data);
                                        counter = 0;
                                        while (rs.next()) {
                                            counter++;
                                        }
                                    %>
                                    <h4>Annual Divorce : <%= counter%></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="dChangeMail" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changemail.jsp" %>
                <script>
                    $(function () {
                        $("#cmWeburl").val("csa.jsp");
                    });
                </script>
            </div>
            <div id="dChangePass" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changepass.jsp" %>
                <script>
                    $(function () {
                        $("#cpWeburl").val("csa.jsp");
                    });
                </script>
            </div>

            <div class="push"></div>
        </div>
        <%@include file="nm2h41rnr6/minifooter.jsp" %>
    </body>
</html>
