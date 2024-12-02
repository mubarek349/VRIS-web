package com.vris;

import com.vris.db.RegDivorceDao;
import java.io.IOException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegDivorce")
public class RegDivorce extends HttpServlet {

    RegDivorceDao dao = new RegDivorceDao();
    int div_reg_place_id;

    private String rRegion, rZone, rCity, rSubcity, rDistrict, rKebele;
    private String xhNidentity;
    private String xwNidentity;

    private String xhBirthID, xwBirthID;
    private String xdom, mOrder;
    private String diCause, dodi;
    private String diCourt, diDocNum;
    private String children;
    private String rtNidentity;

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

        xhNidentity = request.getParameter("xhNidentity");
        xhBirthID = request.getParameter("xhBirthID");

        xwNidentity = request.getParameter("xwNidentity");
        xwBirthID =request.getParameter("xwBirthID");

        xdom = request.getParameter("xdom");
        mOrder = request.getParameter("mOrder");

        diCause = request.getParameter("diCause");
        dodi = request.getParameter("dodi");

        diCourt = request.getParameter("diCourt");
        diDocNum = request.getParameter("diDocNum");

        children = request.getParameter("children");

        rtNidentity = request.getParameter("rtNidentity");

        weburl = request.getParameter("weburl");

        div_reg_place_id = dao.getDivorceRegPlaceID(rRegion, rZone, rCity, rSubcity, rDistrict, rKebele);

        try {
            String div_reg_id;
            div_reg_id = dao.sendToDB(div_reg_place_id, xhNidentity, xhBirthID, xwNidentity, xwBirthID, xdom, mOrder, diCause, dodi, diCourt, diDocNum, children, rtNidentity);
            if (div_reg_id != null) {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Successful <br> Divorce Registration Number is " + div_reg_id);

                response.sendRedirect(weburl);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Something went wrong");

                response.sendRedirect(weburl);
            }
        } catch (IOException | ParseException ex) {
            System.out.println(ex);
        }
    }

}
/*
 
*/