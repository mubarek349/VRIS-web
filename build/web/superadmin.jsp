<%@page import="java.sql.Statement"%>
<%@include file="nm2h41rnr6/config.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Federal Administrator</title>
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/superadmin.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("username") == null || !session.getAttribute("uType").equals("superadmin")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="sidenav">
            <h5 style="color: white; text-align: center">Services</h5>
            <a href="#" id="createAdm">Add new Regional Admin</a>
            <a href="#" id="createCsa">Add CSA</a>
            <a href="#" id="createMoe">Add MOE</a>
            <a href="#" id="mgtAdm">Manage Admin</a>
            <a href="#" id="regRegion">Add new Region</a>
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
            <div id="dRegAdm" style="display: none">
                <br>
                <div>
                    <form class="col-4 offset-4" action="RegRegAdmin" method="post">
                        <%@include file="nm2h41rnr6/regtadmin.jsp" %>
                        <select name="region" class="form-control">
                            <%@include file="nm2h41rnr6/region.jsp" %>
                        </select><br>
                        <input type="text" name="weburl" hidden value="superadmin.jsp">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
                    </form>
                </div>
            </div>
            <div id="dRegCsa" style="display: none">
                <br>
                <div>
                    <form class="col-4 offset-4" action="RegCSA" method="post">
                        <%@include file="nm2h41rnr6/regtadmin.jsp"%><br>
                        <input type="text" name="emptype" hidden value="csa">
                        <input type="text" name="weburl" hidden value="superadmin.jsp">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
                    </form>
                </div>
            </div>
            <div id="dRegMoe" style="display: none">
                <br>
                <div>
                    <form class="col-4 offset-4" action="RegCSA" method="post">
                        <%@include file="nm2h41rnr6/regtadmin.jsp"%><br>
                        <input type="text" name="emptype" hidden value="moe">
                        <input type="text" name="weburl" hidden value="superadmin.jsp">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
                    </form>
                </div>
            </div>

            <div id="dMgtAdm" style="display: none">
                <div class="container">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Region</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  Connection con = null;
                                Statement stmt = null;
                                ResultSet rs = null;
                                String data = "select * from mgt where role = 'reg_admin'";
                                con = DB.getConn();
                                stmt = con.createStatement();
                                rs = stmt.executeQuery(data);

                                while (rs.next()) {
                                    String fname = rs.getString("first_name");
                                    String mname = rs.getString("middle_name");
                                    String lname = rs.getString("last_name");

                                    String fullname = fname + " " + mname + " " + lname;
                                    String region = rs.getString("region");
                                    String emp_id = rs.getString("emp_id");
                                    String status = rs.getString("status");
                                    String regionname = null;

                                    String regionsql = "select * from region where regionid = " + region;
                                    Statement stmt2 = con.createStatement();
                                    ResultSet rs2 = stmt2.executeQuery(regionsql);
                                    while (rs2.next()) {
                                        regionname = rs2.getString("region_name");
                                    }
                            %>
                            <tr>
                                <td><%= fullname%></td>
                                <td><%= rs.getString("username")%></td>
                                <td><%= regionname%></td>
                                <td><%= status%></td>
                                <td>
                                    <div class="row">
                                        <%
                                            if (status.equals("active")) {%>
                                        <form action="ChangeStatus" method="POST">
                                            <input type="text" name="emp_id" value="<%= emp_id%>" hidden>
                                            <input type="text" name="weburl" value="superadmin.jsp" hidden>
                                            <input type="text" name="act" value="suspend" hidden>
                                            <button class="btn btn-warning" type="submit">Suspend</button>
                                        </form>
                                        <%} else {%>
                                        <form action="ChangeStatus" method="POST">
                                            <input type="text" name="emp_id" value="<%= emp_id%>" hidden>
                                            <input type="text" name="weburl" value="superadmin.jsp" hidden>
                                            <input type="text" name="act" value="resume" hidden>
                                            <button class="btn btn-success" type="submit">Resume</button>
                                        </form>
                                        <%

                                            }
                                        %>
                                        &nbsp;
                                        <form action="ChangeStatus" method="POST">
                                            <input type="text" name="emp_id" value="<%= emp_id%>" hidden>
                                            <input type="text" name="weburl" value="superadmin.jsp" hidden>
                                            <input type="text" name="act" value="remove" hidden>
                                            <button class="btn btn-danger" type="submit">Remove</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }

                            %>
                        </tbody>
                    </table>            
                </div>
            </div>

            <div id="dRegRegion" style="display: none">
                <br>
                <form class="col-4 offset-4" action="RegRegion" method="post">
                    <input type="text" name="region_name" class="form-control" placeholder="Region Name" autofocus><br>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Add</button>
                </form>
            </div>

            <div id="dChangeMail" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changemail.jsp" %>
                <script>
                    $(function () {
                        $("#cmWeburl").val("superadmin.jsp");
                    });
                </script>
            </div>
            <div id="dChangePass" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changepass.jsp" %>
                <script>
                    $(function () {
                        $("#cpWeburl").val("superadmin.jsp");
                    });
                </script>
            </div>

            <div class="push"></div>
        </div>
        <%@include file="nm2h41rnr6/minifooter.jsp" %>
    </body>
</html>
