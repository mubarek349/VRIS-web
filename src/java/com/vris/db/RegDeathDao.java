package com.vris.db;

import com.vris.helper.IDGen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class RegDeathDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into death values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String rowquery = "insert into place (region,zone,city,subcity,wereda,kebele,identifier) values (?,?,?,?,?,?,?)";

    public String sendToDB(int death_reg_place_id, String decNidentity, String decBirthID, String title, String mstatus, String dod, String institution, int death_place_id, String cause, String evidencetype, String evidenceid, String burial, String relNidentity, String relation, String rtNidentity) throws ParseException {
        String death_reg_id;
        String rnd_death_reg_id = IDGen.getNationalID();
        death_reg_id = "ET-DeRN-" + rnd_death_reg_id;
        String startDateStr = dod;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date deathDate = sdf.parse(startDateStr);
        con = DB.getConn();
        try {
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, death_reg_id);
            pstmt.setInt(2, death_reg_place_id);
            pstmt.setString(3, decNidentity);
            pstmt.setString(4, decBirthID);
            pstmt.setString(5, title);
            pstmt.setString(6, mstatus);
            pstmt.setDate(7, new java.sql.Date(deathDate.getTime()));
            pstmt.setString(8, institution);
            pstmt.setInt(9, death_place_id);
            pstmt.setString(10, cause);
            pstmt.setString(11, evidencetype);
            pstmt.setString(12, evidenceid);
            pstmt.setString(13, burial);
            pstmt.setString(14, relNidentity);
            pstmt.setString(15, relation);
            pstmt.setString(16, rtNidentity);
            pstmt.setDate(17, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.execute();

            updateStatus(decNidentity);

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return death_reg_id;
    }

    public int getDeathRegPlaceID(String rRegion, String rZone, String rCity, String rSubcity, String rDistrict, String rKebele) {
        int rowID = -1;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(rowquery, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, rRegion);
            pstmt.setString(2, rZone);
            pstmt.setString(3, rCity);
            pstmt.setString(4, rSubcity);
            pstmt.setString(5, rDistrict);
            pstmt.setString(6, rKebele);
            pstmt.setString(7, "reg");

            pstmt.execute();
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                rowID = rs.getInt(1);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rowID;
    }

    public int getDeathPlaceID(String dRegion, String dZone, String dCity, String dSubcity, String dDistrict, String dKebele) {
        int rowID = -1;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(rowquery, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, dRegion);
            pstmt.setString(2, dZone);
            pstmt.setString(3, dCity);
            pstmt.setString(4, dSubcity);
            pstmt.setString(5, dDistrict);
            pstmt.setString(6, dKebele);
            pstmt.setString(7, "death");

            pstmt.execute();
            ResultSet rs;
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                rowID = rs.getInt(1);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rowID;
    }

    private void updateStatus(String decNidentity) {
        String statusquery = "update `people` set `status` = ? where national_id = ?";
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(statusquery);
            pstmt.setString(1, "dead");
            pstmt.setString(2, decNidentity);

            pstmt.executeUpdate();

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
