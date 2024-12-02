package com.vris.db;

import com.lambdaworks.crypto.SCryptUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ChangePassDao {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    String miniquery = "select * from mgt where emp_id=?";

    public boolean sendToDB(String emp_id, String pass) {
        boolean stat = false;
        String statusquery = "update `mgt` set `password` = ?   where emp_id = ?";
        String encryptedPass = SCryptUtil.scrypt(pass, 16, 16, 16);
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(statusquery);
            pstmt.setString(1, encryptedPass);
            pstmt.setString(2, emp_id);

            pstmt.executeUpdate();
            stat = true;
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return stat;
    }

    public boolean matchPass(String emp_id, String oldpass) {
        String pwd;
        boolean matched = false;
        try {
            con = DB.getConn();

            pstmt = con.prepareStatement(miniquery);
            pstmt.setString(1, emp_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                pwd = rs.getString("password");
                matched = SCryptUtil.check(oldpass, pwd);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return matched;
    }
}
