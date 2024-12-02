package com.vris;

import com.vris.db.CertifyDivorceDao;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CertifyDivorce")
public class CertifyDivorce extends HttpServlet {

    CertifyDivorceDao dao = new CertifyDivorceDao();
    int xw_bplace_id, xh_bplace_id;
    String div_reg_id;
    String xwBirthID, xhBirthID;
    String xwID, registrantID, xhID, xwName, xhName, xwNat, xhNat, xwDob, xhDob;
    String xw_bplace, xh_bplace;
    String divorcePlace, dodi;
    String regtName;
    String reg_date;
    String today;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        div_reg_id = request.getParameter("divorceID");
        if (div_reg_id.trim() == null) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Something Went Wrong");
            response.sendRedirect("kebele.jsp");
        }

        xwID = dao.getDivorceInfo(div_reg_id, "xwife_id");
        xwBirthID = dao.getDivorceInfo(div_reg_id, "xwife_birth_reg_id");
        xhID = dao.getDivorceInfo(div_reg_id, "xhusband_id");
        xhBirthID = dao.getDivorceInfo(div_reg_id, "xhusband_birth_reg_id");
        registrantID = dao.getDivorceInfo(div_reg_id, "registrant_id");
        dodi = dao.getDivorceInfo(div_reg_id, "dod");
        divorcePlace = dao.getDivorceInfo(div_reg_id, "divorce_court");
        reg_date = dao.getDivorceInfo(div_reg_id, "reg_date");

        xw_bplace_id = Integer.parseInt(dao.getBirthInfo(xwBirthID, "birth_place_id"));
        xh_bplace_id = Integer.parseInt(dao.getBirthInfo(xhBirthID, "birth_place_id"));

        xw_bplace = dao.getFullPlace(xw_bplace_id);
        xh_bplace = dao.getFullPlace(xh_bplace_id);

        xwDob = dao.getPeopleInfo(xwID, "dob");
        xhDob = dao.getPeopleInfo(xhID, "dob");

        xwNat = dao.getPeopleInfo(xwID, "nationality");
        xhNat = dao.getPeopleInfo(xhID, "nationality");

        xwName = dao.getFullName(xwID);
        xhName = dao.getFullName(xhID);
        regtName = dao.getRegFullName(registrantID);

        SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");

        today = String.valueOf(tf.format(new java.util.Date().getTime()));

        HttpSession session = request.getSession();

        session.setAttribute("divorceid", div_reg_id);
        session.setAttribute("gwbirthid", xwBirthID);
        session.setAttribute("gwrbirthid", xhBirthID);
        session.setAttribute("gwfname", xwName);
        session.setAttribute("gwdob", xwDob);
        session.setAttribute("gwpob", xw_bplace);
        session.setAttribute("gwnat", xwNat);
        session.setAttribute("gwrfname", xhName);
        session.setAttribute("gwrdob", xhDob);
        session.setAttribute("gwrpob", xh_bplace);
        session.setAttribute("gwrnat", xhNat);
        session.setAttribute("dodi", dodi);
        session.setAttribute("pod", divorcePlace);
        session.setAttribute("regdate", reg_date);
        session.setAttribute("certdate", today);
        session.setAttribute("rtname", regtName);

        response.sendRedirect("certdivorce.jsp");
    }
}
