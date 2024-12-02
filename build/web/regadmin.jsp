<%@page import="java.sql.Statement"%>
<%@page import="com.vris.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.vris.helper.IDGen"%>
<%@include file="nm2h41rnr6/config.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Regional Administrator</title>
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/regadmin.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("username") == null || !session.getAttribute("uType").equals("reg_admin")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="sidenav">
            <h5 style="color: white; text-align: center">Services</h5>
            <a href="#" id="createAdm">Add new Zone Admin</a>
            <a href="#" id="mgtAdm">Manage Zone Admin</a>
            <a href="#" id="regZone">Add new Zone</a>
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
                <div>
                    <br>
                    <form class="col-4 offset-4" action="RegZoneAdmin" method="post">
                        <%@include file="nm2h41rnr6/regtadmin.jsp" %>
                        <select name="zone" class="form-control">
                            <option value="0">Select Zone</option>
                            <%
                                try {
                                    String query = "select * from zone where regionid = ?";
                                    String region_id = session.getAttribute("regionID").toString();
                                    Connection conn = DB.getConn();
                                    PreparedStatement pstmt = conn.prepareStatement(query);
                                    pstmt.setString(1, region_id);

                                    ResultSet rs = pstmt.executeQuery();
                                    while (rs.next()) {
                            %>
                            <option value="<%= rs.getInt("zoneid")%>"><%= rs.getString("zone_name")%></option>
                            <%
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        </select>
                        <br>
                        <input type="text" name="weburl" hidden value="regadmin.jsp">
                        <input type="text" name="adminname" value="${username}" hidden>
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
                                <th>Zone</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                            String region_id = session.getAttribute("regionID").toString();
                                Connection con = null;
                                Statement stmt = null;
                                ResultSet rs = null;
                                String data = "select * from mgt where role = 'zone_admin' and region = " + region_id;
                                con = DB.getConn();
                                stmt = con.createStatement();
                                rs = stmt.executeQuery(data);

                                while (rs.next()) {
                                    String fname = rs.getString("first_name");
                                    String mname = rs.getString("middle_name");
                                    String lname = rs.getString("last_name");

                                    String fullname = fname + " " + mname + " " + lname;
                                    String zone = rs.getString("zone");
                                    String emp_id = rs.getString("emp_id");
                                    String status = rs.getString("status");
                                    String regionname = null;

                                    String regionsql = "select * from zone where zoneid = " + zone;
                                    Statement stmt2 = con.createStatement();
                                    ResultSet rs2 = stmt2.executeQuery(regionsql);
                                    while (rs2.next()) {
                                        regionname = rs2.getString("zone_name");
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
                                            <input type="text" name="weburl" value="regadmin.jsp" hidden>
                                            <input type="text" name="act" value="suspend" hidden>
                                            <button class="btn btn-warning" type="submit">Suspend</button>
                                        </form>
                                        <%} else {%>
                                        <form action="ChangeStatus" method="POST">
                                            <input type="text" name="emp_id" value="<%= emp_id%>" hidden>
                                            <input type="text" name="weburl" value="regadmin.jsp" hidden>
                                            <input type="text" name="act" value="resume" hidden>
                                            <button class="btn btn-success" type="submit">Resume</button>
                                        </form>
                                        <%

                                            }
                                        %>
                                        &nbsp;
                                        <form action="ChangeStatus" method="POST">
                                            <input type="text" name="emp_id" value="<%= emp_id%>" hidden>
                                            <input type="text" name="weburl" value="regadmin.jsp" hidden>
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

            <div id="dRegZone" style="display: none">
                <br>
                <form class="col-4 offset-4" action="RegZone" method="post">
                    <input type="text" name="zone_name" class="form-control" placeholder="Zone Name" autofocus><br>
                    <input type="text" name="regionID" value="${regionID}" class="form-control" hidden>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Add</button>
                </form>
            </div>
            <div id="dChangeMail" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changemail.jsp" %>
                <script>
                    $(function () {
                        $("#cmWeburl").val("regadmin.jsp");
                    });
                </script>
            </div>
            <div id="dChangePass" style="display: none">
                <br>
                <%@include file="nm2h41rnr6/changepass.jsp" %>
                <script>
                    $(function () {
                        $("#cpWeburl").val("regadmin.jsp");
                    });
                </script>
            </div>
            <div class="push"></div>
        </div>
        <%@include file="nm2h41rnr6/minifooter.jsp" %>
    </body>
</html>
