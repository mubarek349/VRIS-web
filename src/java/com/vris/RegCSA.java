package com.vris;

import com.vris.db.RegCSADao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/RegCSA")
public class RegCSA extends HttpServlet {

    private String fname, mname, lname, username, password, weburl, emptype;

    RegCSADao dao = new RegCSADao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        fname = request.getParameter("fname");
        mname = request.getParameter("mname");
        lname = request.getParameter("lname");
        username = request.getParameter("username");
        password = request.getParameter("password");
        weburl = request.getParameter("weburl");
        emptype = request.getParameter("emptype");

        if (dao.sendToDB(fname, mname, lname, username, password, emptype)) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Successful");
            response.sendRedirect(weburl);
        }
    }
}
