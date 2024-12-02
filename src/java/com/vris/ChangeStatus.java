package com.vris;

import com.vris.db.ChangeStatusDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangeStatus")
public class ChangeStatus extends HttpServlet {

    ChangeStatusDao dao = new ChangeStatusDao();
    String emp_id, webUrl, act;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        emp_id = request.getParameter("emp_id");
        webUrl = request.getParameter("weburl");
        act = request.getParameter("act");

        switch (act) {
            case "suspend":
                if (dao.updateStatus(emp_id, "suspended")) {

                    HttpSession session = request.getSession();
                    session.setAttribute("msg", "Successful");
                    response.sendRedirect(webUrl);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", "Something went wrong");

                    response.sendRedirect(webUrl);
                }
                break;
            case "resume":
                if (dao.updateStatus(emp_id, "active")) {

                    HttpSession session = request.getSession();
                    session.setAttribute("msg", "Successful");
                    response.sendRedirect(webUrl);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", "Something went wrong");

                    response.sendRedirect(webUrl);
                }
                break;
            case "remove":
                if (dao.removeAdmin(emp_id)) {

                    HttpSession session = request.getSession();
                    session.setAttribute("msg", "Successful");
                    response.sendRedirect(webUrl);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", "Something went wrong");

                    response.sendRedirect(webUrl);
                }
                break;
        }
    }
}
