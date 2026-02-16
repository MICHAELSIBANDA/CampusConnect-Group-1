/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.FeedbackFacadeLocal;
import za.ac.tut.model.entity.Feedback;

/**
 *
 * @author Lwazy
 */
public class ViewFeedbacksServlet extends HttpServlet {
    @EJB
    private FeedbackFacadeLocal efl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Feedback> feedbacks = efl.findAll();

        // Sort feedbacks by createdAt descending (newest first)
        feedbacks.sort((f1, f2) -> f2.getCreatedAt().compareTo(f1.getCreatedAt()));

        request.setAttribute("feedbacks", feedbacks);
        RequestDispatcher disp = request.getRequestDispatcher("viewFeedback.jsp");
        disp.forward(request, response);
    }
}
