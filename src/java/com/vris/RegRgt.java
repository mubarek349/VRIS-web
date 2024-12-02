package com.vris;

import com.vris.db.RegRgtDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegRgt")
public class RegRgt extends HttpServlet {

    private String fname, mname, lname, username, password, role, adminname, weburl;

    RegRgtDao dao = new RegRgtDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        fname = request.getParameter("fname");
        mname = request.getParameter("mname");
        lname = request.getParameter("lname");
        username = request.getParameter("username");
        password = request.getParameter("password");
        role = request.getParameter("role");
        adminname = request.getParameter("adminname");
        weburl = request.getParameter("weburl");

        if (dao.sendToDB(fname, mname, lname, username, password, role, adminname)) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Successful");
            response.sendRedirect(weburl);
        }
    }
}
