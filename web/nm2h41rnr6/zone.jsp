<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.vris.db.DB"%>
<%@page import="java.sql.Connection"%>

<option value="0">Select Zone</option>
<%
    int regionid = Integer.parseInt(request.getParameter("region_id"));
    Connection conn = DB.getConn();
    String query = "select * from zone where regionid = ?";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, String.valueOf(regionid));

    ResultSet rs = pstmt.executeQuery();
    while (rs.next()) {
%>
<option value="<%= rs.getInt("zoneid")%>"><%=rs.getString("zone_name")%></option>
<%
    }
%>
