package com.vris.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegZoneDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into zone values (?,?,?)";

    public boolean sendToDB(String zone_name, String regionID) {
        boolean res = false;

        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, null);
            pstmt.setString(2, zone_name);
            pstmt.setString(3, regionID);
            pstmt.execute();
            res = true;

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
        }
        return res;
    }
}
