package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
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

        // 1️⃣ Check session
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 2️⃣ Get form parameters
            String serviceStr = request.getParameter("service");
            String ratingStr = request.getParameter("rating");
            String comment = request.getParameter("comment");

            // 3️⃣ Validate input
            if (serviceStr == null || serviceStr.isEmpty() ||
                ratingStr == null || ratingStr.isEmpty() ||
                comment == null || comment.trim().isEmpty()) {

                request.setAttribute("errorMessage", "Please complete all fields.");
                // Forward to error JSP
                request.getRequestDispatcher("feedbackSuccessError.jsp").forward(request, response);
                return;
            }

            // 4️⃣ Parse rating safely
            int rating;
            try {
                rating = Integer.parseInt(ratingStr);
                if (rating < 1 || rating > 5) {
                    throw new NumberFormatException("Rating must be between 1 and 5.");
                }
            } catch (NumberFormatException ex) {
                request.setAttribute("errorMessage", "Invalid rating value.");
                request.getRequestDispatcher("feedbackSuccessError.jsp").forward(request, response);
                return;
            }

            // 5️⃣ Convert service string to enum
            SupportType service = mapServiceToSupportType(serviceStr);

            // 6️⃣ Create feedback entity
            Feedback feedback = new Feedback();
            feedback.setStudent(student);
            feedback.setRelatedService(service);
            feedback.setRating(rating);
            feedback.setComments(comment.trim());

            // 7️⃣ Persist to database
            feedbackFacade.create(feedback);

            // 8️⃣ Forward to success JSP
            request.setAttribute("saved", true);
            request.setAttribute("feedback", feedback);
            request.getRequestDispatcher("feedbackSuccess.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Feedback submission failed: " + e.getMessage());
            request.getRequestDispatcher("feedbackSuccessError.jsp").forward(request, response);
        }
    }

    // ✅ Safe service mapping
    private SupportType mapServiceToSupportType(String serviceStr) {
        if (serviceStr == null) {
            throw new IllegalArgumentException("Service cannot be null");
        }

        String s = serviceStr.trim().toLowerCase();
        if (s.contains("tutoring")) {
            return SupportType.TUTORING;
        } else if (s.contains("consultation")) {
            return SupportType.CONSULTATION;
        }

        throw new IllegalArgumentException("Unsupported service: " + serviceStr);
    }
}
