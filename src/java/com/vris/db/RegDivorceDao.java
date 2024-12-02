package com.vris.db;

import com.vris.helper.IDGen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class RegDivorceDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into divorce values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String rowquery = "insert into place (region,zone,city,subcity,wereda,kebele,identifier) values (?,?,?,?,?,?,?)";

    public String sendToDB(int div_reg_place_id, String xhNidentity, String xhBirthID, String xwNidentity, String xwBirthID, String xdom, String mOrder, String diCause, String dodi, String diCourt, String diDocNum, String children, String rtNidentity) throws ParseException {
        String divorce_reg_id;
        String rnd_divorce_reg_id = IDGen.getNationalID();
        divorce_reg_id = "ET-DiRN-" + rnd_divorce_reg_id;
        String startDateStr = xdom;
        String startDateStr2 = dodi;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date xMarriageDate = sdf.parse(startDateStr);
        java.util.Date divorceDate = sdf.parse(startDateStr2);
        con = DB.getConn();
        try {
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, null);
            pstmt.setInt(2, div_reg_place_id);
            pstmt.setString(3, xhNidentity);
            pstmt.setString(4, xhBirthID);
            pstmt.setString(5, xwNidentity);
            pstmt.setString(6, xwBirthID);
            pstmt.setDate(7, new java.sql.Date(xMarriageDate.getTime()));
            pstmt.setString(8, mOrder);
            pstmt.setString(9, diCause);
            pstmt.setDate(10, new java.sql.Date(divorceDate.getTime()));
            pstmt.setString(11, diCourt);
            pstmt.setString(12, diDocNum);
            pstmt.setString(13, children);
            pstmt.setString(14, rtNidentity);
            pstmt.setDate(15, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.execute();

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return divorce_reg_id;
    }

    public int getDivorceRegPlaceID(String rRegion, String rZone, String rCity, String rSubcity, String rDistrict, String rKebele) {
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
    public boolean checkMariagness(String xhNidentity,String xwNidentity) throws SQLException{
            boolean cheched=false;
            con = DB.getConn();
            Statement stmt = con.createStatement();
            ResultSet rs=stmt.executeQuery("select marriage_reg_id from marriage where groom_id like '%"+xhNidentity+"%' and bride_id like '%" + xwNidentity + "%'");
            if(rs.next()){
                cheched=true;
            }
            
        return cheched;
    }
}

/*
public boolean checkMariagness(String xhNidentity,String xwNidentity) throws SQLException{
            boolean cheched=false;
            con = DB.getConn();
            Statement stmt = con.createStatement();
            ResultSet rs=stmt.executeQuery("select marriage_reg_id from marriage where groom_id like '%"+xhNidentity+"%' and bride_id like '%" + xwNidentity + "%'");
            if(rs.next()){
                cheched=true;
            }
            
        return cheched;
    }
*/