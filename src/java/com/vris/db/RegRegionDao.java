package com.vris.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegRegionDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into region values (?,?)";

    public boolean sendToDB(String region_name) {
        boolean res = false;

        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, null);
            pstmt.setString(2, region_name);
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
