<%@include file="nm2h41rnr6/config.jsp" %>
<%@page import="com.vris.db.DB"%>
<%@page import="com.lambdaworks.crypto.SCryptUtil"%>
<%@page import="java.sql.*"%>
<%
    String profile_id = request.getParameter("profile_id");
    String hash_code = request.getParameter("hash_code");
    String np = request.getParameter("newpassword");
    String cp = request.getParameter("confirmpassword");

    if (np.equals(" ") || cp.equals(" ")) {%>
<div class="alert alert-warning" style="padding: 30px; margin: 10% 5% 15% 20%;">
    <a href="resetpass.jsp?key=<%=hash_code%>"> 
        <span class="close" style="color: white; float: right; font-size: 40px; line-height: 35px;">&times;</span> 
    </a> 
    <h1 style="font-size:30px;">&nbsp;&nbsp; Please Fill Both The Fields </h1>
    <center><a href="resetpass.jsp?key=<%=hash_code%>"><h2><input type="button" value="OK" class="btn btn-primary"></h2></a></center>
</div>   
<% } else if (!np.equals(cp)) {
%>
<div class="alert alert-warning" style="padding: 30px; margin: 10% 5% 15% 20%;">
    <a href="resetpass.jsp?key=<%=hash_code%>"> 
        <span class="close" style="float: right; font-size: 40px; line-height: 35px;">&times;</span> 
    </a> 
    <h1 style="font-size:30px;">&nbsp;&nbsp; The Two Passwords Do Not Match. Try Again </h1>
    <center><a href="resetpass.jsp?key=<%=hash_code%>"><h2> <input type="button" value="OK" class="btn btn-primary"></h2></a></center>
</div>
<%
} else {
    try {
        Connection conn = DB.getConn();
        // Execute SQL query
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("update mgt set password ='" + SCryptUtil.scrypt(np, 16, 16, 16) + "'  where emp_id=" + profile_id + "  ");

        stmt.executeUpdate("delete from reset_password where hash_code = '" + hash_code + "'"); //response.sendRedirect("mainpage.jsp");
%>
<div class="alert alert-success col-5" style="padding: 30px; margin: 10% 5% 15% 25%;">
    <a href="index.jsp"> 
        <span class="close" style="color: white;float: right; font-size: 40px; line-height: 35px;">&times;</span> 
    </a> 
    <h1 style="font-size:30px;">&nbsp;&nbsp; The Password Is Successfully Reset.<br>&nbsp;&nbsp; Try Login With New Password</h1>
    <br><br>
    <center><a href="index.jsp"><p style="font-size:20px"> <input type="button" class="btn btn-primary"  value="OK"></p></a></center>
</div>                   
<%
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
    }
%>