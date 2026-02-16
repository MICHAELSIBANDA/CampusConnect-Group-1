/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.AdminFacadeLocal;
import za.ac.tut.bl.SupportRequestFacadeLocal;
import za.ac.tut.model.admin.controller.AdminSessionBean;
import za.ac.tut.model.admin.controller.AdminSessionBeanLocal;
import za.ac.tut.model.entity.Admin;

/**
 *
 * @author Lwazy
 */
public class AdminLoginServlet extends HttpServlet {

   @EJB
   private AdminSessionBeanLocal afl;
   @EJB
   private SupportRequestFacadeLocal sfl;
   @EJB
   private AdminFacadeLocal adfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idOrEmail = request.getParameter("email"); // student no OR email
        String password = request.getParameter("password");

        Admin admin = afl.login(idOrEmail, password);

        if (admin == null) {
            request.setAttribute("error", "Invalid login details.");
            RequestDispatcher rd = request.getRequestDispatcher("Adminlogin.jsp");
            rd.forward(request, response);
            return;
        }

        HttpSession session = request.getSession(true);
        Integer countTotalRequests = sfl.count();
        Integer countPending = adfl.countPending();
        Integer countCompleted = adfl.countCompleted();
        
        session.setAttribute("email", admin.getEmail());
        session.setAttribute("countTotalRequests", countTotalRequests);
        session.setAttribute("countPending", countPending);
        session.setAttribute("countCompleted", countCompleted);

        response.sendRedirect("Admindashboard.jsp");
    }
    


    
}
