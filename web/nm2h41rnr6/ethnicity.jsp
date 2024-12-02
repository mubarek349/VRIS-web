<%@page import="com.vris.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<option value="">Select Ethnicity</option>
<%
    try {
        String query = "select * from ethnicity";
        Connection conn = DB.getConn();
        PreparedStatement pstmt = conn.prepareStatement(query);

        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
%>
<option value="<%= rs.getInt("id")%>"><%= rs.getString("ethnic_group")%></option>
<%
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>