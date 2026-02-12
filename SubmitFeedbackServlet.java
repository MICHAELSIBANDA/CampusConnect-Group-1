package za.ac.tut.web;

import java.io.IOException;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import za.ac.tut.bl.FeedbackFacadeLocal;
import za.ac.tut.model.entity.Feedback;
import za.ac.tut.model.entity.Student;
import za.ac.tut.cc.SupportType;

@WebServlet("/SubmitFeedbackServlet.do")
public class SubmitFeedbackServlet extends HttpServlet {

    // ===== Inject EJB =====
    @EJB
    private FeedbackFacadeLocal feedbackFacade;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ===== 1. GET FORM DATA =====
            String serviceStr = request.getParameter("service");
            String ratingStr = request.getParameter("rating");
            String comment = request.getParameter("comment");

            int rating = Integer.parseInt(ratingStr);

           

            // ===== 3. CONVERT SERVICE → ENUM =====
            SupportType service =
                    SupportType.valueOf(
                        serviceStr
                        .replace(" ", "_")
                        .toUpperCase()
                    );

            // ===== 4. CREATE FEEDBACK ENTITY =====
            Feedback feedback =
                    new Feedback(student, service, rating, comment);

            // ===== 5. SAVE USING EJB =====
            feedbackFacade.create(feedback);

            // ===== 6. SUCCESS REDIRECT =====
            response.sendRedirect("feedbackSuccess.jsp");

        }
        catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                "errorMessage",
                "Feedback submission failed."
            );

            request
                .getRequestDispatcher("feedback.jsp")
                .forward(request, response);
        }
    }
}
