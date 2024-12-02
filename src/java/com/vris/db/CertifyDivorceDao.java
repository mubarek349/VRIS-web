package com.vris.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CertifyDivorceDao {

    Connection con;
    PreparedStatement pstmt;
    String miniquery = "select * from divorce where divorce_reg_id=?";
    String birthquery = "select * from birth where birth_reg_id=?";
    String peoplequery = "select * from people where national_id = ?";
    String mgtquery = "select * from mgt where emp_id = ?";
    String placequery = "select * from place where id=?";
    String regionquery = "select * from region where regionid=?";
    String zonequery = "select * from zone where zoneid=?";

    public String getBirthInfo(String birth_reg_id, String need) {
        String childId = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(birthquery);

            pstmt.setString(1, birth_reg_id);

            ResultSet rs;

            rs = pstmt.executeQuery();

            if (rs.next()) {
                childId = rs.getString(need);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return childId;
    }

    public String getDivorceInfo(String death_reg_id, String need) {
        String res = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, death_reg_id);

            ResultSet rs;

            rs = pstmt.executeQuery();

            if (rs.next()) {
                res = rs.getString(need);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return res;
    }

    public String getPeopleInfo(String personID, String need) {
        String fname = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(peoplequery);

            pstmt.setString(1, personID);
            ResultSet rs;
            rs = pstmt.executeQuery();

            if (rs.next()) {
                fname = rs.getString(need);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return fname;
    }

    public String getFullPlace(int birth_place_id) {
        String fullplace = null;

        int regionID, zoneID;
        regionID = getLocationID(birth_place_id, "region");
        zoneID = getLocationID(birth_place_id, "zone");

        String region, zone, wereda = null;

        region = getRegion(regionID);
        zone = getZone(zoneID);

        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(placequery);

            pstmt.setInt(1, birth_place_id);
            ResultSet rs;

            rs = pstmt.executeQuery();

            if (rs.next()) {
                wereda = rs.getString("wereda");
            }
            fullplace = region + " region, " + zone + " zone, " + wereda + " wereda";
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return fullplace;
    }

    public int getLocationID(int birth_place_id, String need) {
        int locID = -1;

        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(placequery);

            pstmt.setInt(1, birth_place_id);
            ResultSet rs;

            rs = pstmt.executeQuery();

            if (rs.next()) {
                locID = rs.getInt(need);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return locID;
    }

    public String getRegion(int regionid) {
        String region = null;

        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(regionquery);

            pstmt.setInt(1, regionid);
            ResultSet rs;

            rs = pstmt.executeQuery();

            if (rs.next()) {
                region = rs.getString("region_name");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return region;
    }

    public String getZone(int zoneid) {
        String zone = null;

        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(zonequery);

            pstmt.setInt(1, zoneid);
            ResultSet rs;

            rs = pstmt.executeQuery();

            if (rs.next()) {
                zone = rs.getString("zone_name");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return zone;
    }

    public String getFullName(String national_id) {
        String fullname = null, fname = null, mname = null, lname = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(peoplequery);

            pstmt.setString(1, national_id);
            ResultSet rs;

            rs = pstmt.executeQuery();

            if (rs.next()) {
                fname = rs.getString("first_name");
                mname = rs.getString("middle_name");
                lname = rs.getString("last_name");
            }

            fullname = fname + " " + mname + " " + lname;

            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return fullname;
    }
       public String getRegFullName(String mgt_id) {
        String fullname = null, fname = null, mname = null, lname = null;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(mgtquery);

            pstmt.setString(1, mgt_id);
            ResultSet rs;

            rs = pstmt.executeQuery();

            if (rs.next()) {
                fname = rs.getString("first_name");
                mname = rs.getString("middle_name");
                lname = rs.getString("last_name");
            }

            fullname = fname + " " + mname + " " + lname;

            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return fullname;
    }
}
