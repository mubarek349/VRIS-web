package com.vris;

import com.vris.db.RegZoneDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegZone")
public class RegZone extends HttpServlet {

    RegZoneDao dao = new RegZoneDao();
    private String zone_name, regionID;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        zone_name = request.getParameter("zone_name");
        regionID = request.getParameter("regionID");
        if (dao.sendToDB(zone_name, regionID)) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Successful");

            response.sendRedirect("regadmin.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Something went wrong");

            response.sendRedirect("regadmin.jsp");
        }
    }
}
