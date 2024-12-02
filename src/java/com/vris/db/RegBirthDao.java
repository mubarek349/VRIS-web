package com.vris.db;

import com.vris.helper.IDGen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class RegBirthDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into birth values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String rowquery = "insert into place (region,zone,city,subcity,wereda,kebele,identifier) values (?,?,?,?,?,?,?)";

    String topeopleQuery = "insert into people(first_name,middle_name,last_name,nationality,national_id,gender,dob,status)"
            + " values (?,?,?,?,?,?,?,?)";

    public String sendToDB(int birth_reg_place_id, String child_id, int birth_place_id, String institution, String weight, String assistance, String mother_id, String mom_marital,
            String father_id, String dad_marital, String guardian_id, String guardian_relation, String midwife_id, String midwife_crd, String registrant_id) throws ParseException {
        String birth_reg_id;
        String rnd_birth_reg_id = IDGen.getNationalID();
        birth_reg_id = "ET-BRN-" + rnd_birth_reg_id;
        con = DB.getConn();
        try {
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, birth_reg_id);
            pstmt.setInt(2, birth_reg_place_id);
            pstmt.setString(3, child_id);
            pstmt.setInt(4, birth_place_id);
            pstmt.setString(5, institution);
            pstmt.setString(6, weight);
            pstmt.setString(7, assistance);
            pstmt.setString(8, mother_id);
            pstmt.setString(9, mom_marital);
            pstmt.setString(10, father_id);
            pstmt.setString(11, dad_marital);
            pstmt.setString(12, guardian_id);
            pstmt.setString(13, guardian_relation);
            pstmt.setString(14, midwife_id);
            pstmt.setString(15, midwife_crd);
            pstmt.setString(16, registrant_id);
            pstmt.setDate(17, new java.sql.Date(new java.util.Date().getTime()));
            pstmt.execute();

            pstmt.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return birth_reg_id;
    }

    public int getBirthPlaceID(String region, String zone, String city, String subcity, String wereda, String kebele) {
        int rowID = -1;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(rowquery, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, region);
            pstmt.setString(2, zone);
            pstmt.setString(3, city);
            pstmt.setString(4, subcity);
            pstmt.setString(5, wereda);
            pstmt.setString(6, kebele);
            pstmt.setString(7, "birth");

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

    public int getBirthRegPlaceID(String region, String zone, String city, String subcity, String wereda, String kebele) {
        int rowID = -1;
        try {
            con = DB.getConn();
            pstmt = con.prepareStatement(rowquery, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, region);
            pstmt.setString(2, zone);
            pstmt.setString(3, city);
            pstmt.setString(4, subcity);
            pstmt.setString(5, wereda);
            pstmt.setString(6, kebele);
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

    public void insertToPeople(String cFname, String cMname, String cLname, String cNationality, String cNationalID, String cSex, String cDob) throws ParseException {
        con = DB.getConn();
        String startDateStr = cDob;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date startDate = sdf.parse(startDateStr);
        try {
            pstmt = con.prepareStatement(topeopleQuery);

            pstmt.setString(1, cFname);
            pstmt.setString(2, cMname);
            pstmt.setString(3, cLname);
            pstmt.setString(4, cNationality);
            pstmt.setString(5, cNationalID);
            pstmt.setString(6, cSex);
            pstmt.setDate(7, new java.sql.Date(startDate.getTime()));
            pstmt.setString(8, "alive");

            pstmt.execute();

            pstmt.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
