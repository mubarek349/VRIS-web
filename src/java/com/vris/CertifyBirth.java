package com.vris;

import com.vris.db.CertifyBirthDao;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CertifyBirth")
public class CertifyBirth extends HttpServlet {

    CertifyBirthDao dao = new CertifyBirthDao();
    String birth_reg_id;
    int birth_place_id;
    String childID, motherID, fatherID, registrantID;
    String childFname, childMname, childLname;
    String gender, dateOfBirth;
    String childNationality;
    String birthPlace;
    String mName, mNationality;
    String fName, fNationality;
    String regtName;
    String reg_date;
    String today;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        birth_reg_id = request.getParameter("birthID");

        childID = dao.getChildInfo(birth_reg_id, "child_id");
        motherID = dao.getChildInfo(birth_reg_id, "mother_id");
        fatherID = dao.getChildInfo(birth_reg_id, "father_id");
        registrantID = dao.getChildInfo(birth_reg_id, "registrant_id");
        birth_place_id = Integer.parseInt(dao.getChildInfo(birth_reg_id, "birth_place_id"));
        birthPlace = dao.getFullBirthPlace(birth_place_id);
        reg_date = dao.getChildInfo(birth_reg_id, "reg_date");

        childFname = dao.getPeopleInfo(childID, "first_name");
        childMname = dao.getPeopleInfo(childID, "middle_name");
        childLname = dao.getPeopleInfo(childID, "last_name");
        gender = dao.getPeopleInfo(childID, "gender");
        dateOfBirth = dao.getPeopleInfo(childID, "dob");
        childNationality = dao.getPeopleInfo(childID, "nationality");

        mName = dao.getFullName(motherID);
        fName = dao.getFullName(fatherID);
        regtName = dao.getRegFullName(registrantID);

        mNationality = dao.getPeopleInfo(motherID, "nationality");
        fNationality = dao.getPeopleInfo(fatherID, "nationality");

        SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");

        today = String.valueOf(tf.format(new java.util.Date().getTime()));

        HttpSession session = request.getSession();

        session.setAttribute("cfname", childFname);
        session.setAttribute("cmname", childMname);
        session.setAttribute("clname", childLname);
        session.setAttribute("gender", gender);
        session.setAttribute("dob", dateOfBirth);
        session.setAttribute("pob", birthPlace);
        session.setAttribute("cnat", childNationality);
        session.setAttribute("mname", mName);
        session.setAttribute("mnat", mNationality);
        session.setAttribute("fname", fName);
        session.setAttribute("fnat", fNationality);
        session.setAttribute("regdate", reg_date);
        session.setAttribute("certdate", today);
        session.setAttribute("rtname", regtName);
        session.setAttribute("birthid", birth_reg_id);

        response.sendRedirect("certbirth.jsp");
    }
}
