package com.vris;

import com.vris.db.ChangePassDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {

    ChangePassDao dao = new ChangePassDao();
    private String oldpass, pass, repass, weburl, emp_id;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        oldpass = request.getParameter("oldpass");
        pass = request.getParameter("pass");
        repass = request.getParameter("repass");
        weburl = request.getParameter("weburl");
        emp_id = request.getParameter("emp_id");

        if (pass.equals(repass) && dao.matchPass(emp_id, oldpass) && dao.sendToDB(emp_id, pass)) {
            response.sendRedirect("Logout");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Something went wrong");
            response.sendRedirect(weburl);
        }
    }
}
