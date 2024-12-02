package com.vris;

import com.vris.db.CertifyMarriageDao;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CertifyMarriage")
public class CertifyMarriage extends HttpServlet {

    CertifyMarriageDao dao = new CertifyMarriageDao();
    int b_bplace_id, g_bplace_id;
    String marriage_reg_id;
    String bBirthID, gBirthID;
    String bID, registrantID, gID, bName, gName, bNat, gNat, bDob, gDob;
    String b_bplace, g_bplace;
    String marriagePlace, dom;
    String regtName;
    String reg_date;
    String today;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        marriage_reg_id = request.getParameter("marriageID");
        if (marriage_reg_id.trim() == null) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Something Went Wrong");
            response.sendRedirect("kebele.jsp");
        }

        bID = dao.getMarriageInfo(marriage_reg_id, "bride_id");
        bBirthID = dao.getMarriageInfo(marriage_reg_id, "bride_birth_reg_id");
        gID = dao.getMarriageInfo(marriage_reg_id, "groom_id");
        gBirthID = dao.getMarriageInfo(marriage_reg_id, "groom_birth_reg_id");
        registrantID = dao.getMarriageInfo(marriage_reg_id, "registrant_id");
        dom = dao.getMarriageInfo(marriage_reg_id, "dom");
        marriagePlace = dao.getMarriageInfo(marriage_reg_id, "marriage_order");
        reg_date = dao.getMarriageInfo(marriage_reg_id, "reg_date");

        b_bplace_id = Integer.parseInt(dao.getBirthInfo(bBirthID, "birth_place_id"));
        g_bplace_id = Integer.parseInt(dao.getBirthInfo(gBirthID, "birth_place_id"));

        b_bplace = dao.getFullPlace(b_bplace_id);
        g_bplace = dao.getFullPlace(g_bplace_id);

        bDob = dao.getPeopleInfo(bID, "dob");
        gDob = dao.getPeopleInfo(gID, "dob");

        bNat = dao.getPeopleInfo(bID, "nationality");
        gNat = dao.getPeopleInfo(gID, "nationality");

        bName = dao.getFullName(bID);
        gName = dao.getFullName(gID);
        regtName = dao.getRegFullName(registrantID);

        SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");

        today = String.valueOf(tf.format(new java.util.Date().getTime()));

        HttpSession session = request.getSession();

        session.setAttribute("marriageid", marriage_reg_id);
        session.setAttribute("bbirthid", bBirthID);
        session.setAttribute("gbirthid", gBirthID);
        session.setAttribute("bfname", bName);
        session.setAttribute("bdob", bDob);
        session.setAttribute("bpob", b_bplace);
        session.setAttribute("bnat", bNat);
        session.setAttribute("gfname", gName);
        session.setAttribute("gdob", gDob);
        session.setAttribute("gpob", g_bplace);
        session.setAttribute("gnat", gNat);
        session.setAttribute("dom", dom);
        session.setAttribute("pom", marriagePlace);
        session.setAttribute("regdate", reg_date);
        session.setAttribute("certdate", today);
        session.setAttribute("rtname", regtName);

        response.sendRedirect("certmarriage.jsp");
    }
}
