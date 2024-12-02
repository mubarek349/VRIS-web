package com.vris;

import com.vris.db.RegDeathDao;
import java.io.IOException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegDeath")
public class RegDeath extends HttpServlet {

    RegDeathDao dao = new RegDeathDao();
    int death_reg_place_id, death_place_id;

    private String rRegion, rZone, rCity, rSubcity, rDistrict, rKebele;
    private String decNidentity, decBirthID;
    private String title, mstatus;
    private String relNidentity, relation;
    private String rtNidentity;
    private String dRegion, dZone, dCity, dSubcity, dDistrict, dKebele;

    private String dod, institution;
    private String cause, evidencetype, evidenceid;
    private String burial;

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

        decNidentity = request.getParameter("decNidentity");
        decBirthID = request.getParameter("decBirthID");

        title = request.getParameter("title");
        mstatus = request.getParameter("mstatus");

        relNidentity = request.getParameter("relNidentity");
        relation = request.getParameter("relation");

        rtNidentity = request.getParameter("rtNidentity");

        dRegion = request.getParameter("dRegion");
        dZone = request.getParameter("dZone");
        dCity = request.getParameter("dCity");
        dSubcity = request.getParameter("dSubcity");
        dDistrict = request.getParameter("dDistrict");
        dKebele = request.getParameter("dKebele");

        dod = request.getParameter("dod");
        institution = request.getParameter("institution");

        cause = request.getParameter("cause");
        evidencetype = request.getParameter("evidencetype");
        evidenceid = request.getParameter("evidenceid");
        burial = request.getParameter("burial");

        weburl = request.getParameter("weburl");

        death_reg_place_id = dao.getDeathRegPlaceID(rRegion, rZone, rCity, rSubcity, rDistrict, rKebele);
        death_place_id = dao.getDeathPlaceID(dRegion, dZone, dCity, dSubcity, dDistrict, dKebele);

        try {
            String death_reg_id;

            death_reg_id = dao.sendToDB(death_reg_place_id, decNidentity, decBirthID, title, mstatus, dod, institution, death_place_id, cause, evidencetype, evidenceid, burial, relNidentity, relation, rtNidentity);
            if (death_reg_id != null) {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Successful <br> Death registration number is " + death_reg_id);

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
