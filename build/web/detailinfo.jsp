<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
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
        <title>Detail Information</title>
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
        <div class="wrapper main">
            <%
                Connection con;
                Statement stmt;
                ResultSet rs;

                con = DB.getConn();
                stmt = con.createStatement();
                Statement stmt2 = con.createStatement();
                String person = request.getParameter("per");

                String data = null;
                data = "select * from people where national_id = '" + person + "'";
                String ethquery;
                String ethnicity = null;
                rs = stmt.executeQuery(data);

                while (rs.next()) {
                    String photo = rs.getString("photo_name");
                    int ethnic_id = rs.getInt("ethnicity");

                    ethquery = "select * from ethnicity where id = " + ethnic_id;
                    ResultSet rs2 = stmt2.executeQuery(ethquery);
                    if (rs2.next()) {
                        ethnicity = rs2.getString("ethnic_group");
                    }
            %>
            <div class="col-5 offset-4 to-be-printed">
                <br><img src="photos/<%= photo%>" width="225" height="300" /><br><br>
                <h5>Full Name : &nbsp;<%= rs.getString("first_name") + " " + rs.getString("middle_name") + " " + rs.getString("last_name")%> </h5>
                <h5>National ID: &nbsp;<%= rs.getString("national_id")%></h5>
                <h5>Nationality: &nbsp;<%= rs.getString("nationality")%></h5>
                <h5>Gender: &nbsp;<%= rs.getString("gender")%></h5>
                <h5>Date of Birth: &nbsp;<%= rs.getString("dob")%></h5>
                <h5>Ethnicity: &nbsp;<%= ethnicity%></h5>
                <h5>Religion: &nbsp;<%= rs.getString("religion")%></h5>
                <h5>Educational Status: &nbsp;<%= rs.getString("education")%></h5>
                <h5>Occupation: &nbsp;<%= rs.getString("occupation")%></h5>
            </div>

            <%
                }
            %>
            <br>

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
                <a href="searchpeople.jsp"><button class="btn btn-primary"> Back</button></a>&nbsp;&nbsp;
                <button onclick="window.print();" class="btn btn-success">Print</button>
            </div>
            <div class="push"></div>
        </div>
        <%@include file="nm2h41rnr6/minifooter.jsp" %>
    </body>
</html>
