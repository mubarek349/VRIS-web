package com.vris.db;

import com.lambdaworks.crypto.SCryptUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    String miniquery = "select * from mgt where username=?";

    public boolean check(String email, String pword) {
        String pwd;
        boolean matched = false;
        try {
            con = DB.getConn();

            pstmt = con.prepareStatement(miniquery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                pwd = rs.getString("password");
                matched = SCryptUtil.check(pword, pwd);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return matched;
    }

    public String checkRole(String email) {
        String role = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                role = rs.getString("role");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return role;
    }

    public String getUsername(String email) {

        String username = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                username = rs.getString("username");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return username;
    }

    public String getStatus(String email) {

        String status = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                status = rs.getString("status");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return status;
    }

    public String getUserID(String email) {
        String status = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                status = rs.getString("emp_id");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return status;
    }

    public String getRegionID(String email) {
        String status = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                status = rs.getString("region");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return status;
    }

    public String getZoneID(String email) {
        String status = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                status = rs.getString("zone");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return status;
    }

    public String getWereda(String email) {
        String status = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                status = rs.getString("wereda");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return status;
    }
}
