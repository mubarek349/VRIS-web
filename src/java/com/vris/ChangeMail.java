package com.vris;

import com.vris.db.ChangeMailDao;
import com.vris.db.ChangePassDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangeMail")
public class ChangeMail extends HttpServlet {

    ChangeMailDao dao = new ChangeMailDao();
    private String pass, email, weburl, emp_id;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        pass = request.getParameter("pass");
        email = request.getParameter("email");
        weburl = request.getParameter("weburl");
        emp_id = request.getParameter("emp_id");

        if (dao.matchPass(emp_id, pass) && dao.sendToDB(emp_id, email)) {
            response.sendRedirect("Logout");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Something went wrong");
            response.sendRedirect(weburl);
        }
    }
}
