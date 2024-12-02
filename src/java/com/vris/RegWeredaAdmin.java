package com.vris;

import com.vris.db.RegWeredaAdminDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegWeredaAdmin")
public class RegWeredaAdmin extends HttpServlet {

    private String fname, mname, lname, username, password, wereda, adminname, weburl;

    RegWeredaAdminDao dao = new RegWeredaAdminDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        fname = request.getParameter("fname");
        mname = request.getParameter("mname");
        lname = request.getParameter("lname");
        username = request.getParameter("username");
        password = request.getParameter("password");
        wereda = request.getParameter("wereda");
        adminname = request.getParameter("adminname");
        weburl = request.getParameter("weburl");
        System.out.println(weburl);

        if (dao.sendToDB(fname, mname, lname, username, password, wereda, adminname)) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Successful");
            response.sendRedirect(weburl);
        }
    }
}
