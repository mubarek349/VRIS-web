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
        <title>MOE Administrator</title>
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/moe.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("username") == null || !session.getAttribute("uType").equals("moe")) {
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
                        <div class="col-4">
                            <br>
                            <h3>Nursery</h3>
                            <div class="alert alert-primary" role="alert">
                                <%
                                    SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");
                                    Calendar originalDate = Calendar.getInstance();
                                    originalDate.add(Calendar.YEAR, -3);
                                    String nursery_year = String.valueOf(tf.format(originalDate.getTime()));

                                    String data = "select * from people where dob > " + "'" + nursery_year + "'";
                                    Connection con = DB.getConn();
                                    Statement stmt = con.createStatement();
                                    Statement stmt2 = con.createStatement();
                                    ResultSet rs = stmt.executeQuery(data);
                                    int counter = 0;
                                    String child_id;
                                    String gender;
                                    int male = 0;
                                    int female = 0;
                                    while (rs.next()) {
                                        counter++;
                                        child_id = rs.getString("national_id");
                                        String genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
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
                                <h4>Total : <%= counter%></h4>
                                <h4>Male : <%= male%></h4>
                                <h4>Female : <%= female%></h4>
                            </div>
                        </div>
                        <div class="col-4">
                            <br>
                            <h3>Kindergarten</h3>
                            <div class="alert alert-primary" role="alert">
                                <%
                                    tf = new SimpleDateFormat("yyyy-MM-dd");
                                    originalDate = Calendar.getInstance();
                                    originalDate.add(Calendar.YEAR, -3);
                                    nursery_year = String.valueOf(tf.format(originalDate.getTime()));

                                    originalDate.add(Calendar.YEAR, -3);
                                    String kg_year = String.valueOf(tf.format(originalDate.getTime()));

                                    data = "select * from people where dob between " + "'" + kg_year + "' and " + "'" + nursery_year + "'";
                                    con = DB.getConn();
                                    stmt = con.createStatement();
                                    stmt2 = con.createStatement();
                                    rs = stmt.executeQuery(data);
                                    counter = 0;
                                    male = 0;
                                    female = 0;
                                    while (rs.next()) {
                                        counter++;
                                        child_id = rs.getString("national_id");
                                        String genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
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
                                <h4>Total : <%= counter%></h4>
                                <h4>Male : <%= male%></h4>
                                <h4>Female : <%= female%></h4>
                            </div>
                        </div>
                        <div class="col-4">
                            <br>
                            <h3>Primary School</h3>
                            <div class="alert alert-primary" role="alert">
                                <%
                                    tf = new SimpleDateFormat("yyyy-MM-dd");
                                    originalDate = Calendar.getInstance();
                                    originalDate.add(Calendar.YEAR, -6);
                                    kg_year = String.valueOf(tf.format(originalDate.getTime()));

                                    originalDate.add(Calendar.YEAR, -8);
                                    String primary_year = String.valueOf(tf.format(originalDate.getTime()));

                                    data = "select * from people where dob between " + "'" + primary_year + "' and " + "'" + kg_year + "'";
                                    con = DB.getConn();
                                    stmt = con.createStatement();
                                    stmt2 = con.createStatement();
                                    rs = stmt.executeQuery(data);
                                    counter = 0;

                                    male = 0;
                                    female = 0;
                                    while (rs.next()) {
                                        counter++;
                                        child_id = rs.getString("national_id");
                                        String genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
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
                                <h4>Total : <%= counter%></h4>
                                <h4>Male : <%= male%></h4>
                                <h4>Female : <%= female%></h4>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-4">
                            <br>
                            <h3>High School</h3>
                            <div class="alert alert-primary" role="alert">
                                <%
                                    tf = new SimpleDateFormat("yyyy-MM-dd");
                                    originalDate = Calendar.getInstance();
                                    originalDate.add(Calendar.YEAR, -14);
                                    primary_year = String.valueOf(tf.format(originalDate.getTime()));

                                    originalDate.add(Calendar.YEAR, -2);
                                    String high_year = String.valueOf(tf.format(originalDate.getTime()));

                                    data = "select * from people where dob between " + "'" + high_year + "' and " + "'" + primary_year + "'";
                                    con = DB.getConn();
                                    stmt = con.createStatement();
                                    stmt2 = con.createStatement();
                                    rs = stmt.executeQuery(data);
                                    counter = 0;

                                    male = 0;
                                    female = 0;
                                    while (rs.next()) {
                                        counter++;
                                        child_id = rs.getString("national_id");
                                        String genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
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
                                <h4>Total : <%= counter%></h4>
                                <h4>Male : <%= male%></h4>
                                <h4>Female : <%= female%></h4>
                            </div>
                        </div>
                        <div class="col-4">
                            <br>
                            <h3>Preparatory</h3>
                            <div class="alert alert-primary" role="alert">
                                <%
                                    tf = new SimpleDateFormat("yyyy-MM-dd");
                                    originalDate = Calendar.getInstance();
                                    originalDate.add(Calendar.YEAR, -16);
                                    high_year = String.valueOf(tf.format(originalDate.getTime()));

                                    originalDate.add(Calendar.YEAR, -2);
                                    String prep_year = String.valueOf(tf.format(originalDate.getTime()));

                                    data = "select * from people where dob between " + "'" + prep_year + "' and " + "'" + high_year + "'";
                                    con = DB.getConn();
                                    stmt = con.createStatement();
                                    stmt2 = con.createStatement();
                                    rs = stmt.executeQuery(data);
                                    counter = 0;

                                    male = 0;
                                    female = 0;
                                    while (rs.next()) {
                                        counter++;
                                        child_id = rs.getString("national_id");
                                        String genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
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
                                <h4>Total : <%= counter%></h4>
                                <h4>Male : <%= male%></h4>
                                <h4>Female : <%= female%></h4>
                            </div>
                        </div>
                        <div class="col-4">
                            <br>
                            <h3>Higher Education</h3>
                            <div class="alert alert-primary" role="alert">
                                <%
                                    tf = new SimpleDateFormat("yyyy-MM-dd");
                                    originalDate = Calendar.getInstance();
                                    originalDate.add(Calendar.YEAR, -18);
                                    String colg_year = String.valueOf(tf.format(originalDate.getTime()));

                                    data = "select * from people where dob < " + "'" + colg_year + "'";
                                    con = DB.getConn();
                                    stmt = con.createStatement();
                                    stmt2 = con.createStatement();
                                    rs = stmt.executeQuery(data);
                                    counter = 0;

                                    male = 0;
                                    female = 0;
                                    while (rs.next()) {
                                        counter++;
                                        child_id = rs.getString("national_id");
                                        String genderQuery = "select gender from people where national_id = " + "'" + child_id + "'";
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
                                <h4>Total : <%= counter%></h4>
                                <h4>Male : <%= male%></h4>
                                <h4>Female : <%= female%></h4>
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
                        $("#cmWeburl").val("moe.jsp");
                    });
                </script>
            </div>
            <div id="dChangePass" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changepass.jsp" %>
                <script>
                    $(function () {
                        $("#cpWeburl").val("moe.jsp");
                    });
                </script>
            </div>

            <div class="push"></div>
        </div>
        <%@include file="nm2h41rnr6/minifooter.jsp" %>
    </body>
</html>
