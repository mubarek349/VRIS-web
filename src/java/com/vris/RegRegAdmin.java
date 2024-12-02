package com.vris;

import com.vris.db.RegRegAdminDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegRegAdmin")
public class RegRegAdmin extends HttpServlet {

    private String fname, mname, lname, username, password, region, weburl;

    RegRegAdminDao dao = new RegRegAdminDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        fname = request.getParameter("fname");
        mname = request.getParameter("mname");
        lname = request.getParameter("lname");
        username = request.getParameter("username");
        password = request.getParameter("password");
        region = request.getParameter("region");
        weburl = request.getParameter("weburl");

        if (dao.sendToDB(fname, mname, lname, username, password, region)) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Successful");
            response.sendRedirect(weburl);
        }

    }
}
