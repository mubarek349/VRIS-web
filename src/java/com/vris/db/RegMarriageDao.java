package com.vris.db;

import com.vris.helper.IDGen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class RegMarriageDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into marriage values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String rowquery = "insert into place (region,zone,city,subcity,wereda,kebele,identifier) values (?,?,?,?,?,?,?)";

    public String sendToDB(int marriage_reg_place_id, String bNidentity, String bBirthID, String bXmstatus, String gNidentity, String gBirthID, String gXmstatus, String dom, String mOrder, String bWitOneID, String bWitTwoID, String gWitOneID, String gWitTwoID, String rtNidentity) throws ParseException {
        String marriage_reg_id;
        String rnd_marriage_reg_id = IDGen.getNationalID();
        marriage_reg_id = "ET-MRN-" + rnd_marriage_reg_id;
        String startDateStr = dom;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date marriageDate = sdf.parse(startDateStr);
        con = DB.getConn();
        try {
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, marriage_reg_id);
            pstmt.setInt(2, marriage_reg_place_id);
            pstmt.setString(3, bNidentity);
            pstmt.setString(4, bBirthID);
            pstmt.setString(5, bXmstatus);
            pstmt.setString(6, gNidentity);
            pstmt.setString(7, gBirthID);
            pstmt.setString(8, gXmstatus);
            pstmt.setDate(9, new java.sql.Date(marriageDate.getTime()));
            pstmt.setString(10, mOrder);
            pstmt.setString(11, bWitOneID);
            pstmt.setString(12, bWitTwoID);
            pstmt.setString(13, gWitOneID);
            pstmt.setString(14, gWitTwoID);
            pstmt.setString(15, rtNidentity);
            pstmt.setDate(16, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.execute();

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return marriage_reg_id;
    }

    public int getMarriageRegPlaceID(String rRegion, String rZone, String rCity, String rSubcity, String rDistrict, String rKebele) {
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
    public boolean checkNonDeathness(String bNidentity,String gNidentity) throws SQLException{
            boolean cheched=true;
            con = DB.getConn();
            Statement stmt = con.createStatement();
            ResultSet rs=stmt.executeQuery("select deceased_id from death where deceased_id like '%"+bNidentity+"%' or deceased_id like '%" + gNidentity + "%'");
            if(rs.next()){
                cheched=false;
            }
            
        return cheched;
    }
}
/*public boolean checkNonDeathness(String bNidentity,String gNidentity) throws SQLException{
            boolean cheched=true;
            con = DB.getConn();
            Statement stmt = con.createStatement();
            ResultSet rs=stmt.executeQuery("select deceased_id from death where deceased_id like '%"+bNidentity+"%' or deceased_id like '%" + gNidentity + "%'");
            if(rs.next()){
                cheched=false;
            }
            
        return cheched;
    }*/