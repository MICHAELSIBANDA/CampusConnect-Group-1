/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.model.admin.controller.AdminSessionBeanLocal;

/**
 *
 * @author Lwazy
 */
public class CreateEventServlet extends HttpServlet {

    @EJB
    private AdminSessionBeanLocal asbl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            
            String title = request.getParameter("title"); // student no OR email
            String content = request.getParameter("content");
            
            String startStr = request.getParameter("start"); // 2026-02-12T14:30
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date startDateAndTime = sdf.parse(startStr);
            
            String endStr = request.getParameter("end"); // 2026-02-12T14:30
            SimpleDateFormat esdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date endDateAndTime = esdf.parse(endStr);
            
            asbl.createEvent(title, content, startDateAndTime, endDateAndTime);
            
            RequestDispatcher disp = request.getRequestDispatcher("Admindashboard.jsp");
            disp.forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CreateEventServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
