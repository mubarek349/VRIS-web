package com.vris;

import com.vris.db.RegMarriageDao;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegMarriage")
public class RegMarriage extends HttpServlet {

    RegMarriageDao dao = new RegMarriageDao();
    int marriage_reg_place_id;

    private String rRegion, rZone, rCity, rSubcity, rDistrict, rKebele;
    private String bNidentity, bXmstatus;
    private String gNidentity, gXmstatus;
    private String bBirthID, gBirthID;
    private String dom, mOrder;
    private String bWitOneID, bWitTwoID;
    private String gWitOneID, gWitTwoID;
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

        bNidentity = request.getParameter("bNidentity");
        bBirthID = request.getParameter("bBirthID");
        bXmstatus = request.getParameter("bXmstatus");

        gNidentity = request.getParameter("gNidentity");
        gBirthID = request.getParameter("gBirthID");
        gXmstatus = request.getParameter("gXmstatus");

        dom = request.getParameter("dom");
        mOrder = request.getParameter("mOrder");

        bWitOneID = request.getParameter("bWitOneID");
        bWitTwoID = request.getParameter("bWitTwoID");

        gWitOneID = request.getParameter("gWitOneID");
        gWitTwoID = request.getParameter("gWitTwoID");

        rtNidentity = request.getParameter("rtNidentity");

        weburl = request.getParameter("weburl");

        marriage_reg_place_id = dao.getMarriageRegPlaceID(rRegion, rZone, rCity, rSubcity, rDistrict, rKebele);

        try {
            String marriage_reg_id;
            if(dao.checkNonDeathness(bNidentity, gNidentity)){
            marriage_reg_id = dao.sendToDB(marriage_reg_place_id, bNidentity, bBirthID, bXmstatus, gNidentity, gBirthID, gXmstatus, dom, mOrder, bWitOneID, bWitTwoID, gWitOneID, gWitTwoID, rtNidentity);
            if (marriage_reg_id != null) {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Successful <br> Marriage Registration Number is " + marriage_reg_id);

                response.sendRedirect(weburl);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Something went wrong");

                response.sendRedirect(weburl);
            }
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Dead person can't get marriage!! this situation can't be happened!!");

                response.sendRedirect(weburl);
            }
        } catch (ParseException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegMarriage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
/*try {
            String marriage_reg_id;
            if(dao.checkNonDeathness(bNidentity, gNidentity)){
            marriage_reg_id = dao.sendToDB(marriage_reg_place_id, bNidentity, bBirthID, bXmstatus, gNidentity, gBirthID, gXmstatus, dom, mOrder, bWitOneID, bWitTwoID, gWitOneID, gWitTwoID, rtNidentity);
            if (marriage_reg_id != null) {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Successful <br> Marriage Registration Number is " + marriage_reg_id);

                response.sendRedirect(weburl);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Something went wrong");

                response.sendRedirect(weburl);
            }
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Death person can't get marriage!! this situation can't be happened!!");

                response.sendRedirect(weburl);
            }
        } catch (ParseException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegMarriage.class.getName()).log(Level.SEVERE, null, ex);
        }*/