/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.FeedbackFacadeLocal;
import za.ac.tut.model.entity.Feedback;

/**
 *
 * @author El
 */
public class FeedbackFormServlet extends HttpServlet {

    @EJB
    FeedbackFacadeLocal feedbackFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String studentNumber = (session != null) ? (String) session.getAttribute("studentNumber") : null;
        if (studentNumber == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Feedback> myFeedback = feedbackFacade.findByStudentNumber(studentNumber);
        request.setAttribute("myFeedback", myFeedback);

        request.getRequestDispatcher("feedback.jsp").forward(request, response);
    }
}
