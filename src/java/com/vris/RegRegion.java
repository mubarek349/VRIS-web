package com.vris;

import com.vris.db.RegRegionDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegRegion")
public class RegRegion extends HttpServlet {

    RegRegionDao dao = new RegRegionDao();
    private String region_name;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        region_name = request.getParameter("region_name");
        if (dao.sendToDB(region_name)) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Successful");

            response.sendRedirect("superadmin.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Something went wrong");

            response.sendRedirect("superadmin.jsp");
        }
    }
}
