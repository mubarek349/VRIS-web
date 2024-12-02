<%@page import="com.vris.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<option value="0">Select Region</option>
<%
    try {
        String query = "select * from region";
        Connection conn = DB.getConn();
        PreparedStatement pstmt = conn.prepareStatement(query);

        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
%>
<option value="<%= rs.getInt("regionid")%>"><%= rs.getString("region_name")%></option>
<%
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>