/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.AnnouncmentFacadeLocal;
import za.ac.tut.model.admin.controller.AdminSessionBeanLocal;
import za.ac.tut.model.entity.Announcment;

/**
 *
 * @author Lwazy
 */
public class CreateAnnouncementPageServlet extends HttpServlet {
@EJB
private AnnouncmentFacadeLocal afl;
@EJB
private AdminSessionBeanLocal asbl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String title = request.getParameter("title"); 
        String content = request.getParameter("content");
        
        asbl.createAnnouncment(title, content);
        
        RequestDispatcher disp = request.getRequestDispatcher("Admindashboard.jsp");
        disp.forward(request, response);
    }
}
