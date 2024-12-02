package com.vris;

import com.vris.db.RegPersonDao;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/RegPerson")
public class RegPerson extends HttpServlet {

    private String first_name, middle_name, last_name, nationality, national_id, gender,
            dob, birthplace, residence, ethnicity, religion, education, occupation, weburl, idtype, birth_reg;
    Part part;

    RegPersonDao dao = new RegPersonDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            first_name = request.getParameter("first_name");
            middle_name = request.getParameter("middle_name");
            last_name = request.getParameter("last_name");
            nationality = request.getParameter("nationality");
            national_id = request.getParameter("national_id");
            gender = request.getParameter("gender");
            dob = request.getParameter("dob");
            birthplace = request.getParameter("birthplace");
            residence = request.getParameter("residence");
            ethnicity = request.getParameter("ethnicity");
            religion = request.getParameter("religion");
            education = request.getParameter("education");
            occupation = request.getParameter("occupation");
            birth_reg = request.getParameter("birth_reg_no");
            idtype = request.getParameter("idtype");
            weburl = request.getParameter("weburl");

            part = request.getPart("photo");

            switch (idtype) {
                case "idonly":
                    if (dao.sendToDB(first_name, middle_name, last_name, nationality, national_id, gender, dob, birthplace, residence, ethnicity, religion, education, occupation, part)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("msg", "Successful");
                        session.setAttribute("perid", national_id);

                        response.sendRedirect("idprint.jsp");
                    }
                    break;
                case "idwithbirth":
                    if (dao.sendToDBMini(birth_reg, birthplace, residence, ethnicity, religion, education, occupation, part)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("msg", "Successful");
                        session.setAttribute("perid", dao.getNationalID(birth_reg));

                        response.sendRedirect("idprint.jsp");
                    }
                    break;
            }

        } catch (ParseException | SQLException ex) {
            System.out.println(ex);
        }
    }
}
