package com.vris;

import com.vris.db.CertifyDeathDao;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CertifyDeath")
public class CertifyDeath extends HttpServlet {

    CertifyDeathDao dao = new CertifyDeathDao();
    String death_reg_id;
    int death_place_id;
    String personID, registrantID, personBirthReg;
    String personFname, personMname, personLname;
    String gender, dateOfBirth, title;
    String nationality;
    String deathPlace, dod;
    String regtName;
    String reg_date;
    String today;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        death_reg_id = request.getParameter("deathID");

        personID = dao.getDeathInfo(death_reg_id, "deceased_id");
        registrantID = dao.getDeathInfo(death_reg_id, "registrant_id");
        personBirthReg = dao.getDeathInfo(death_reg_id, "deceased_birth_reg_id");
        death_place_id = Integer.parseInt(dao.getDeathInfo(death_reg_id, "death_place_id"));
        deathPlace = dao.getFullDeathPlace(death_place_id);
        title = dao.getDeathInfo(death_reg_id, "title");
        reg_date = dao.getDeathInfo(death_reg_id, "reg_date");
        dod = dao.getDeathInfo(death_reg_id, "dod");

        personFname = dao.getPeopleInfo(personID, "first_name");
        personMname = dao.getPeopleInfo(personID, "middle_name");
        personLname = dao.getPeopleInfo(personID, "last_name");
        gender = dao.getPeopleInfo(personID, "gender");
        dateOfBirth = dao.getPeopleInfo(personID, "dob");
        nationality = dao.getPeopleInfo(personID, "nationality");

        regtName = dao.getRegFullName(registrantID);

        SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");

        today = String.valueOf(tf.format(new java.util.Date().getTime()));

        HttpSession session = request.getSession();

        session.setAttribute("deathid", death_reg_id);
        session.setAttribute("birthid", personBirthReg);
        session.setAttribute("dfname", personFname);
        session.setAttribute("dmname", personMname);
        session.setAttribute("dlname", personLname);
        session.setAttribute("title", title);
        session.setAttribute("gender", gender);
        session.setAttribute("dob", dateOfBirth);
        session.setAttribute("dnat", nationality);
        session.setAttribute("pod", deathPlace);
        session.setAttribute("deathdate", dod);
        session.setAttribute("regdate", reg_date);
        session.setAttribute("certdate", today);
        session.setAttribute("rtname", regtName);

        response.sendRedirect("certdeath.jsp");
    }
}
