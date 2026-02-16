/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.AdminFacadeLocal;
import za.ac.tut.model.entity.SupportRequest;

/**
 *
 * @author Lwazy
 */
public class viewRequestsServelt extends HttpServlet {

    @EJB
    private AdminFacadeLocal asbl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        List<SupportRequest> requests = asbl.findAllRequests();
        
        request.setAttribute("requests", requests);
        RequestDispatcher disp = request.getRequestDispatcher("viewRequests.jsp");
        disp.forward(request, response);
    }

}
