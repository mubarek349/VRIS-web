package com.vris.db;

import com.lambdaworks.crypto.SCryptUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegZoneAdminDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into mgt (first_name,middle_name,last_name,username,password,region,zone,role,reg_date,status) values (?,?,?,?,?,?,?,?,?,?)";
    String regquery = "select * from mgt where username=?";
    ResultSet rs;

    public boolean sendToDB(String fname, String mname, String lname, String username, String password, String zone, String adminname) {
        boolean res = false;
        String encryptedPass = SCryptUtil.scrypt(password, 16, 16, 16);
        String region = getRegion(adminname);
        con = DB.getConn();
        try {
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, fname);
            pstmt.setString(2, mname);
            pstmt.setString(3, lname);
            pstmt.setString(4, username);
            pstmt.setString(5, encryptedPass);
            pstmt.setString(6, region);
            pstmt.setString(7, zone);
            pstmt.setString(8, "zone_admin");
            pstmt.setDate(9, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.setString(10, "active");
            pstmt.execute();
            res = true;

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return res;
    }

    public String getRegion(String uname) {

        String region = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(regquery);

            pstmt.setString(1, uname);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                region = rs.getString("region");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return region;
    }
}
