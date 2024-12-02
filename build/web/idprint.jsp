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
        <title>ID Printer</title>
        <style>
            table {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <div style="width: 10cm;height: 5cm" class="to-be-printed">
            <table>
                <div class="text-center">
                    FDRE National ID Card
                </div>
                <%
                    Connection con;
                    Statement stmt;
                    ResultSet rs;

                    con = DB.getConn();
                    stmt = con.createStatement();
                    String per_id = session.getAttribute("perid").toString();

                    String quest = "select * from people where national_id = '" + per_id + "'";

                    rs = stmt.executeQuery(quest);

                    while (rs.next()) {
                        String fileName = rs.getString("photo_name");
                %>
                <br>
                <div class="row">
                    <div class="col-8">
                        National ID:&nbsp;<%= rs.getString("national_id")%><br>
                        Name:&nbsp;<%= rs.getString("first_name") + " " + rs.getString("middle_name") + " " + rs.getString("last_name")%><br>
                        Gender:&nbsp;<%= rs.getString("gender")%> &nbsp;&nbsp;&nbsp; Nationality:&nbsp;<%= rs.getString("nationality")%><br>
                        Occupation:&nbsp;<%= rs.getString("occupation")%><br>
                        Date of Birth:&nbsp;<%= rs.getString("dob")%>
                    </div>
                    <div class="col-4">
                        <img src="photos/<%=fileName%>" width="100" height="120" />
                    </div>
                </div>
                <%
                    }
                %>
            </table>
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
