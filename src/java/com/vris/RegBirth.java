package com.vris;

import com.vris.db.RegBirthDao;
import java.io.IOException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegBirth")
public class RegBirth extends HttpServlet {

    RegBirthDao dao = new RegBirthDao();
    int birth_reg_place_id, birth_place_id;

    private String rRegion, rZone, rCity, rSubcity, rDistrict, rKebele;
    private String mNidentity, mMstatus;
    private String fNidentity, fMstatus;
    private String gNidentity, gRelation;
    private String rtNidentity;
    private String btype;

    private String cFname, cMname, cLname, cSex, cNationality, cNationalID, cDob, bInstitution;
    private String cRegion, cZone, cCity, cSubcity, cDistrict, cKebele;
    private String assistance, weight;
    private String midNidentity, credential;

    private String weburl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        rRegion = request.getParameter("rRegion");
        rZone = request.getParameter("rZone");
        rCity = request.getParameter("rCity");
        rSubcity = request.getParameter("rSubcity");
        rDistrict = request.getParameter("rDistrict");
        rKebele = request.getParameter("rKebele");

        mNidentity = request.getParameter("mNidentity");
        if (mNidentity.trim().equals("")) {
            mNidentity = null;
        }
        mMstatus = request.getParameter("mMstatus");
        if (mMstatus.trim().equals("")) {
            mMstatus = null;
        }

        fNidentity = request.getParameter("fNidentity");
        if (fNidentity.trim().equals("")) {
            fNidentity = null;
        }
        fMstatus = request.getParameter("fMstatus");
        if (fMstatus.trim().equals("")) {
            fMstatus = null;
        }

        gNidentity = request.getParameter("gNidentity");
        if (gNidentity.trim().equals("")) {
            gNidentity = null;
        }
        gRelation = request.getParameter("gRelation");
        if (gRelation.trim().equals("")) {
            gRelation = null;
        }

        rtNidentity = request.getParameter("rtNidentity");

        cFname = request.getParameter("cFname");
        cMname = request.getParameter("cMname");
        cLname = request.getParameter("cLname");
        cSex = request.getParameter("cSex");
        cNationality = request.getParameter("cNationality");
        cNationalID = request.getParameter("cNidentity");
        cDob = request.getParameter("cDob");
        bInstitution = request.getParameter("bInstitution");

        cRegion = request.getParameter("cRegion");
        cZone = request.getParameter("cZone");
        cCity = request.getParameter("cCity");
        cSubcity = request.getParameter("cSubcity");
        cDistrict = request.getParameter("cDistrict");
        cKebele = request.getParameter("cKebele");

        assistance = request.getParameter("assistance");
        weight = request.getParameter("weight");

        midNidentity = request.getParameter("midNidentity");
        if (midNidentity.trim().equals("")) {
            midNidentity = null;
        }
        credential = request.getParameter("credential");
        if (credential.trim().equals("")) {
            credential = null;
        }

        btype = request.getParameter("btype");
        weburl = request.getParameter("weburl");

        birth_reg_place_id = dao.getBirthRegPlaceID(rRegion, rZone, rCity, rSubcity, rDistrict, rKebele);
        birth_place_id = dao.getBirthPlaceID(cRegion, cZone, cCity, cSubcity, cDistrict, cKebele);

        switch (btype) {
            case "oldbirth":
                toDB(request, response);
                break;
            case "newbirth":
                toPeople();
                toDB(request, response);
                break;
        }
    }

    public void toPeople() {
        try {
            dao.insertToPeople(cFname, cMname, cLname, cNationality, cNationalID, cSex, cDob);
        } catch (ParseException ex) {
            System.out.println(ex);
        }
    }

    public void toDB(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String birth_reg_id;

        try {
            birth_reg_id = dao.sendToDB(birth_reg_place_id, cNationalID, birth_place_id, bInstitution, weight, assistance, mNidentity, mMstatus, fNidentity, fMstatus, gNidentity, gRelation, midNidentity, credential, rtNidentity);
            if (birth_reg_id != null) {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Successful <br> Birth Registration Number is " + birth_reg_id);

                response.sendRedirect(weburl);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Something went wrong");

                response.sendRedirect(weburl);
            }
        } catch (ParseException ex) {
            System.out.println(ex);
        }
    }
}
