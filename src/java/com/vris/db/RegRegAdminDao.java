package com.vris.db;

import com.lambdaworks.crypto.SCryptUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegRegAdminDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into mgt (first_name,middle_name,last_name,username,password,region,role,reg_date,status) values (?,?,?,?,?,?,?,?,?)";
    String currentDate;

    public boolean sendToDB(String fname, String mname, String lname, String username, String password, String region) {
        boolean res = false;
        String encryptedPass = SCryptUtil.scrypt(password, 16, 16, 16);
        con = DB.getConn();
        try {
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, fname);
            pstmt.setString(2, mname);
            pstmt.setString(3, lname);
            pstmt.setString(4, username);
            pstmt.setString(5, encryptedPass);
            pstmt.setString(6, region);
            pstmt.setString(7, "reg_admin");
            pstmt.setDate(8, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.setString(9, "active");
            pstmt.execute();
            res = true;

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return res;
    }
}
