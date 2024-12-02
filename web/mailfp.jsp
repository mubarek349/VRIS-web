<%@include file="nm2h41rnr6/config.jsp" %>
<%@page import="com.vris.db.DB"%>
<%@page import="com.vris.helper.MD5Hash"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%
    MD5Hash md = new MD5Hash();
    String smail = request.getParameter("email");
    String id = request.getParameter("id");
    int profile_id = 0;
    if (smail != null) {
        try {
            Connection conn = DB.getConn();

            Statement stmt = conn.createStatement();

            String sql1;
            sql1 = "SELECT  username FROM mgt WHERE username = '" + smail + "'";

            ResultSet rs1 = stmt.executeQuery(sql1);

            if (rs1.first()) {
                String sql;
                sql = "SELECT emp_id FROM mgt where username='" + smail + "'";
                ResultSet rs2 = stmt.executeQuery(sql);

                // Extract data from result set
                while (rs2.next()) {
                    //Retrieve by column name
                    profile_id = rs2.getInt("emp_id");
                }

//                java.sql.Timestamp intime = new java.sql.Timestamp(new java.util.Date().getTime());
//                Calendar cal = Calendar.getInstance();
//                cal.setTimeInMillis(intime.getTime());
//                cal.add(Calendar.MINUTE, 20);
//                java.sql.Timestamp exptime = new Timestamp(cal.getTime().getTime());
//
//                int rand_num = (int) (Math.random() * 1000000);
//                String rand = Integer.toString(rand_num);
//                String finale = (rand + "" + intime); // 
//                String hash = md.getHashPass(finale); //hash code
//
//                String save_hash = "insert into  reset_password (profile_id, hash_code, exptime, datetime ) values(" + profile_id + ", '" + hash + "'  , '" + exptime + "', '" + intime + "'  )";
//
//                int saved = stmt.executeUpdate(save_hash);

//                if (saved > 0) {
//                    String link = "http://localhost:8082/VRIS-web/resetpass.jsp";
                    
                    //bhagawat till here, you have fetch email and verified with the email from datbase and retrived password from the db.
                    //-----------------------------------------------
//                    String host = "", user = "", pass = "";
//                    host = "smtp.gmail.com";
//                    user = "mubarekahmed978@gmail.com";
//"email@removed" // email id to send the emails 
//                    pass = "Mubi42303571@"; //Your gmail password 
//                    String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
//                    String to = smail;
//                    String from = "mubarekahmed978@gmail.com";
//                    String subject = "Password Reset";
//                    String messageText = " Click <a href=" + link + "?key=" + hash + ">Here</a> To Reset your Password. You must reset your password within 20 minutes.";//messageString; 
//                    String fileAttachment = "";
//                    boolean WasEmailSent;
//                    boolean sessionDebug = true;
//                    Properties props = System.getProperties();
//                    props.put("mail.host", host);
//                    props.put("mail.transport.protocol.", "smtp");
//                    props.put("mail.smtp.auth", "true");
//                    props.put("mail.smtp.", "true");
//                    props.put("mail.smtp.port", "465");
//                    props.put("mail.smtp.socketFactory.fallback", "false");
//                    props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
                    
//                    Session mailSession = Session.getDefaultInstance(props, null);
//                    out.print("hello");
//                    mailSession.setDebug(sessionDebug);
//                    
//                    Message msg = new MimeMessage(mailSession);
//                    
//                    msg.setFrom(new InternetAddress(from));
//                    InternetAddress[] address = {new InternetAddress(to)};
//                    msg.setRecipients(Message.RecipientType.TO, address);
//                    msg.setSubject(subject);
//                    msg.setContent(messageText, "text/html");
//                    Transport transport = mailSession.getTransport("smtp");
//                    transport.connect(host, user, pass);
if (id.equals(""+profile_id)) {
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
       
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Reset Password</button>
    </form>
</div>
<!--<div class="alert alert-primary col-5" role="alert" style="padding: 30px; margin: 10% 5% 15% 25%;">
    <a href="forgotpass.jsp"> 
        <span class="close" style="float: right; font-size: 40px; line-height: 35px;">&times;</span> 
    </a> 
    <h1 style="font-size:30px;">&nbsp;&nbsp; 
        <strong>Check Your Email. Link To Reset Your Password Is Sent To : <%out.println(" " + smail); %></strong>  
    </h1>
    <center><a href="forgotpass.jsp"><h2><input type="button" class="btn btn-primary" value="OK"> </h2></a></center>
</div>-->
<%
//        try {
//            transport.sendMessage(msg, msg.getAllRecipients());
//            WasEmailSent = true; // assume it was sent 
//        } catch (Exception err) {
//            WasEmailSent = false; // assume it's a fail 
//        }
//        transport.close();
//        //-----------------------------------------------
//    }
}else{
  request.getRequestDispatcher("/forgotpass.jsp").forward(request,response);
}
} else {
%>
<div class="alert alert-warning col-5" role="alert" style="padding: 30px; margin: 10% 5% 15% 25%;">
    <a href="forgotpass.jsp"> 
        <span class="close" style="float: right; font-size: 40px; line-height: 35px;">&times;</span>
    </a> 
    <h1 style="font-size:30px;">&nbsp;&nbsp; <strong>There Is No Email As Such <%out.println(" " + smail); %></strong>Try Again</h1>
    <center><a href="forgotpass.jsp"><h2><input type="button" class="btn btn-primary" value="OK"></h2></a></center>
</div>
<%
        }

        stmt.close();
        rs1.close();
        conn.close();
    }
catch (SQLException se) {
//Handle errors for JDBC
        se.printStackTrace();
    }
catch (Exception e) {
////Handle errors for Class.forName
        e.printStackTrace();
    }
}
else {
%>
<div class="alert alert-danger col-5" role="alert" style="padding: 30px; margin: 10% 5% 15% 25%;">
    <a href="forgotpass.jsp"> 
        <span class="close" style="float: right; font-size: 40px; line-height: 35px;">&times;</span>
    </a> 
    <h1 style="font-size:30px;">&nbsp;&nbsp; <strong>Please Enter The Valid Email Address</strong></h1>
    <center><a href="forgotpass.jsp"><h2><input type="button" class="btn btn-primary" value="OK"> </h2></a></center>
</div>
<%
    }
%> 