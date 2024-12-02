package com.vris.db;

import com.lambdaworks.crypto.SCryptUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegCSADao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into mgt (first_name,middle_name,last_name,username,password,role,reg_date,status) values (?,?,?,?,?,?,?,?)";
    ResultSet rs;

    public boolean sendToDB(String fname, String mname, String lname, String username, String password, String emptype) {
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
            pstmt.setString(6, emptype);
            pstmt.setDate(7, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.setString(8, "active");
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
