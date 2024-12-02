package com.vris.db;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.http.Part;

public class RegPersonDao {

    Connection con;
    PreparedStatement pstmt;
    String query = "insert into people values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String miniquery = "update people set birthplace = ?, residence = ?, ethnicity = ?, religion = ?, education = ?, occupation = ?, photo_name = ?, path = ? where national_id = ?";

    public boolean sendToDB(String first_name, String middle_name, String last_name, String nationality, String national_id, String gender, String dob, String birthplace, String residence, String ethnicity, String religion, String education, String occupation, Part part) throws ParseException, IOException {
        boolean res = false;

        String startDateStr = dob;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date startDate = sdf.parse(startDateStr); // you will get date here    

        String fileName = extractFileName(part);
        String savePath = "C:\\Users\\HP-PC\\Documents\\NetBeansProjects\\VRIS-web\\web\\photos" + File.separator + fileName;

        File fileSaveDir = new File(savePath);

        part.write(savePath + File.separator);

        con = DB.getConn();
        try {
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, first_name);
            pstmt.setString(2, middle_name);
            pstmt.setString(3, last_name);
            pstmt.setString(4, nationality);
            pstmt.setString(5, national_id);
            pstmt.setString(6, gender);
            pstmt.setDate(7, new java.sql.Date(startDate.getTime()));
            pstmt.setString(8, birthplace);
            pstmt.setString(9, residence);
            pstmt.setString(10, ethnicity);
            pstmt.setString(11, religion);
            pstmt.setString(12, education);
            pstmt.setString(13, occupation);
            pstmt.setString(14, fileName);
            pstmt.setString(15, savePath);
            pstmt.setString(16, "alive");

            pstmt.execute();

            res = true;

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return res;
    }

    public boolean sendToDBMini(String birth_reg, String birthplace, String residence, String ethnicity, String religion, String education, String occupation, Part part) throws SQLException, IOException {
        boolean res = false;
        String national_id = getNationalID(birth_reg);
        String fileName = extractFileName(part);
        String savePath = "C:\\Users\\HP-PC\\Documents\\NetBeansProjects\\VRIS-web\\web\\photos" + File.separator + fileName;

        File fileSaveDir = new File(savePath);

        part.write(savePath + File.separator);
        con = DB.getConn();
        try {
            pstmt = con.prepareStatement(miniquery);

            pstmt.setString(1, birthplace);
            pstmt.setString(2, residence);
            pstmt.setString(3, ethnicity);
            pstmt.setString(4, religion);
            pstmt.setString(5, education);
            pstmt.setString(6, occupation);
            pstmt.setString(7, fileName);
            pstmt.setString(8, savePath);
            pstmt.setString(9, national_id);

            pstmt.execute();

            res = true;

            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return res;
    }

    public String getNationalID(String birth_reg) throws SQLException {
        String res = null;
        con = DB.getConn();
        Statement stmt = con.createStatement();

        String natquery = "select * from birth where birth_reg_id = '" + birth_reg + "'";

        ResultSet natrs = stmt.executeQuery(natquery);

        while (natrs.next()) {
            res = natrs.getString("child_id");
        }
        return res;
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
