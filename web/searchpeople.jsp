<%@page import="com.vris.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@include file="nm2h41rnr6/config.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search People</title>
    </head>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");

        if (session.getAttribute("username") == null) {
            response.sendRedirect("index.jsp");
        }
    %>
    <body>
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
                    <%@include file="nm2h41rnr6/specpage.jsp" %> 
                </ul>
                <div class="my-2 my-lg-0">
                    <a class="btn btn-outline-danger my-2 my-sm-0" href="Logout">Logout</a>
                </div>
            </div>
        </nav>
        <br>
        <div class="wrapper">
            <form action="" method="get">
                <div class="col-5 offset-4">
                    <div class="form-row">
                        <div class="col-8">
                            <input type="text" class="form-control" name="quest" placeholder="Search Here ...">
                        </div>
                        <div class="col-4">
                            <button type="submit" id="searchbtn" class="btn btn-primary btn-block" >Search</button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="container">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>First name</th>
                            <th>Middle name</th>
                            <th>Last name</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection con;
                            Statement stmt;
                            ResultSet rs;

                            con = DB.getConn();
                            stmt = con.createStatement();
                            String quest = request.getParameter("quest");

                            String data = null;
                            if (quest != null) {
                                data = "select * from people where national_id like '%" + quest + "%' or first_name like '%" + quest + "%' or middle_name like '%" + quest + "%' or last_name like '%" + quest + "%'";
                            } else {
                                data = "select * from people where national_id = 'HELOOOOOO'";
                            }
                            if (quest != null) {
                                rs = stmt.executeQuery(data);

                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("national_id")%></td>
                            <td><%= rs.getString("first_name")%></td>
                            <td><%= rs.getString("middle_name")%></td>
                            <td><%= rs.getString("last_name")%></td>
                            <td class="text-center">
                                <a href="detailinfo.jsp?per=<%= rs.getString("national_id")%>">View Details</a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="push"></div>
        <%@include file="nm2h41rnr6/minifooter.jsp" %>
    </body>
</html>
