package com.vris.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ChangeStatusDao {

    Connection con;
    PreparedStatement pstmt;
    String statusquery = "update `mgt` set `status` = ? where emp_id = ?";
    String delquery = "delete from `mgt` where emp_id = ?";

    public boolean updateStatus(String emp_id, String status) {
        boolean res = false;

        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(statusquery);
            pstmt.setString(1, status);
            pstmt.setString(2, emp_id);

            pstmt.executeUpdate();
            res = true;
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return res;
    }

    public boolean removeAdmin(String emp_id) {
        boolean res = false;

        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(delquery);
            pstmt.setString(1, emp_id);

            pstmt.executeUpdate();
            res = true;
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return res;
    }

}
