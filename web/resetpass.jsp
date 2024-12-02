<%@include file="nm2h41rnr6/config.jsp" %>
<%@page import="com.vris.db.DB"%>
<%@page import="java.sql.*"%>
<%
    String hash = (request.getParameter("key"));

    java.sql.Timestamp curtime = new java.sql.Timestamp(new java.util.Date().getTime());

    int profile_id = 0;
    java.sql.Timestamp exptime;

    try {
        Connection conn = DB.getConn();
        Statement stmt = conn.createStatement();

        String sql = "select profile_id, exptime from reset_password where hash_code ='" + hash + "'  ";

        ResultSet rs = stmt.executeQuery(sql);
        if ( rs.first()) {
            profile_id = rs.getInt("profile_id");
            exptime = rs.getTimestamp("exptime");

            //out.println(exptime+"/"+curtime);
            if ((curtime).before(exptime)) {
%>
<div class="container">
    <form class="form-signin col-4 offset-4" action="updatepass.jsp" method="Post"> 
        <br/><br/>
        <h4 class="form-signin-heading">Reset Your Password Here</h4>
        <br> 
        <text style="font-size:13px;"><span class="req" style="color:red">* </span>Enter New Password</text>
        <input type="password" name="newpassword" class="form-control" placeholder="New Password" required autofocus>
        <br>
        <text style="font-size:13px;"><span class="req" style="color:red">* </span>Enter New Password Again</text>
        <input type="password" name="confirmpassword" class="form-control" placeholder="New Password Again" required>
        <input type="hidden" name="profile_id" value=<%=profile_id%>>
        <input type="hidden" name="hash_code" value=<%=hash%>>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Reset Password</button>
    </form>
</div> <!-- /container -->
<% } else {
%>
<div class="alert alert-warning" style="padding: 30px; margin: 10% 5% 15% 20%;">
    <a href="forgotpass.jsp"> 
        <span class="close" style="color: white;float: right; font-size: 40px; line-height: 35px;">&times;</span> 
    </a> 
    <h1 style="font-size:30px;">&nbsp;&nbsp; The Time To Reset Password Has Expired.<br> &nbsp;&nbsp; Try Again </h1>
    <center><a href="forgotpass.jsp"><h2><input type="button" value="OK"></h2></a></center>
</div>
<%
    }
} else {
%>
<div class="alert alert-warning" style="padding: 30px; margin: 10% 5% 15% 20%;">
    <a href="forgotpass.jsp"> 
        <span class="close" style="color: white;float: right; font-size: 40px; line-height: 35px;">&times;</span> 
    </a> 
    <h1 style="font-size:30px;">&nbsp;&nbsp; The Hash Key DO Not Match. <br/> &nbsp;&nbsp;&nbsp;Try Again!! </h1>
    <center><a href="forgotpass.jsp"><h2><input type="button" value="OK"></h2></a></center>
</div>
<%
        }
        // Clean-up environment
        rs.close();
        stmt.close();
        conn.close();
    } catch (SQLException se) {
        //Handle errors for JDBC
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }
%> 