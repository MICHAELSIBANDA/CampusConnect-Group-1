/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.AdminFacadeLocal;
import za.ac.tut.bl.SupportRequestFacadeLocal;
import za.ac.tut.model.admin.controller.AdminSessionBeanLocal;

/**
 *
 * @author Lwazy
 */
public class UpdateRequestServlet extends HttpServlet {

    @EJB
    private AdminSessionBeanLocal asbl;
    @EJB
    private SupportRequestFacadeLocal sfl;
    @EJB
    private AdminFacadeLocal adfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Long id1 = (Long) session.getAttribute("id1");
        Long id2 = Long.parseLong(request.getParameter("id"));
        String status = request.getParameter("status");
        Long id = null;

        if (id1 == null) {
            id = id2;
        }
        asbl.updateRequestStatus(id, status);

        Integer countTotalRequests = sfl.count();
        Integer countPending = adfl.countPending();
        Integer countCompleted = adfl.countCompleted();

        session.setAttribute("countTotalRequests", countTotalRequests);
        session.setAttribute("countPending", countPending);
        session.setAttribute("countCompleted", countCompleted);

        RequestDispatcher disp = request.getRequestDispatcher("Admindashboard.jsp");
        disp.forward(request, response);
    }
}
