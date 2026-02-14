package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import za.ac.tut.bl.FeedbackFacadeLocal;
import za.ac.tut.model.entity.Feedback;
import za.ac.tut.model.entity.Student;
import za.ac.tut.cc.SupportType;

public class SubmitFeedbacksServlet extends HttpServlet {

    @EJB
    private FeedbackFacadeLocal feedbackFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Student student = (Student) session.getAttribute("student");
        if (session == null || student == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        

        if (student == null) {
            String studentNumber = (String) session.getAttribute("studentNumber");
            if (studentNumber == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            try {
                // 1) Get form data
                String serviceStr = request.getParameter("service");
                String ratingStr = request.getParameter("rating");
                String comment = request.getParameter("comment");

                if (serviceStr == null || ratingStr == null || comment == null || comment.trim().isEmpty()) {
                    request.setAttribute("errorMessage", "Please complete all fields.");
                    request.getRequestDispatcher("feedback.jsp").forward(request, response);
                    return;
                }

                int rating = Integer.parseInt(ratingStr);


                // 3) Map service string -> SupportType safely
                SupportType service = mapServiceToSupportType(serviceStr);

                // 4) Create entity and persist
                Feedback feedback = new Feedback(student, service, rating, comment.trim());
                feedbackFacade.create(feedback);

                // 5) Forward (recommended) so success page can read request attributes if you want
                request.setAttribute("saved", true);
                request.setAttribute("service", serviceStr);
                request.setAttribute("rating", rating);
                request.setAttribute("comment", comment.trim());
                request.getRequestDispatcher("feedbackSuccess.jsp").forward(request, response);

            // If you prefer redirect, keep sendRedirect, but then you can't rely on request attributes:
                // response.sendRedirect("feedbackSuccess.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Feedback submission failed: " + e.getMessage());
                request.getRequestDispatcher("feedback.jsp").forward(request, response);
            }
        }
    }

    

    private SupportType mapServiceToSupportType(String serviceStr) {
        // Your dropdown values:
        // Tutoring Support, Academic Consultation, IT Help Desk, Accommodation Services, Library Services, Student Administration

        String s = serviceStr.trim().toLowerCase();

        if (s.contains("tutoring")) {
            return SupportType.TUTORING;
        }
        if (s.contains("consultation")) {
            return SupportType.CONSULTATION;
        }

        // If your SupportType enum doesn't have these, either:
        // 1) add them to SupportType, OR
        // 2) create a separate enum FeedbackService
        // For now, throw a clear error:
        throw new IllegalArgumentException("Unsupported service: " + serviceStr);
    }
}
