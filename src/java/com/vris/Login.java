package com.vris;

import com.vris.db.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {

    String email, pword, captcha, precaptcha, trioCaptcha;
    LoginDao dao = new LoginDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        email = request.getParameter("email");
        pword = request.getParameter("pword");
        precaptcha = request.getParameter("precaptcha");

        trioCaptcha = precaptcha.substring(0, 3);

        captcha = request.getParameter("captcha");

        String uType = dao.checkRole(email);
        String uname = dao.getUsername(email);
        String userID = dao.getUserID(email);
        String status = dao.getStatus(email);
        if (dao.check(email, pword) && status.equals("active") && captcha.equals(precaptcha)) {

            HttpSession session = request.getSession();
            session.setAttribute("username", uname);
            session.setAttribute("userID", userID);
            session.setAttribute("uType", uType);
            session.setAttribute("msg", "Welcome");
            switch (uType) {
                case "superadmin":
                    response.sendRedirect("superadmin.jsp");
                    break;
                case "reg_admin":
                    String regionId = dao.getRegionID(email);
                    session.setAttribute("regionID", regionId);
                    response.sendRedirect("regadmin.jsp");
                    break;
                case "zone_admin":
                    String zoneId = dao.getZoneID(email);
                    regionId = dao.getRegionID(email);
                    session.setAttribute("regionID", regionId);
                    session.setAttribute("zoneID", zoneId);
                    response.sendRedirect("zoneadmin.jsp");
                    break;
                case "wereda_admin":
                    zoneId = dao.getZoneID(email);
                    regionId = dao.getRegionID(email);
                    String wereda = dao.getWereda(email);
                    session.setAttribute("regionID", regionId);
                    session.setAttribute("zoneID", zoneId);
                    session.setAttribute("wereda", wereda);
                    response.sendRedirect("weredaadmin.jsp");
                    break;
                case "kebele_emp":
                    response.sendRedirect("kebele.jsp");
                    break;
                case "hospital_emp":
                    response.sendRedirect("hospital.jsp");
                    break;
                case "court_emp":
                    response.sendRedirect("court.jsp");
                    break;
                case "csa":
                    response.sendRedirect("csa.jsp");
                    break;
                case "moe":
                    response.sendRedirect("moe.jsp");
                    break;
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}
