/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.SupportRequestFacadeLocal;
import za.ac.tut.cc.SupportType;
import za.ac.tut.model.entity.Student;
import za.ac.tut.model.entity.SupportRequest;

/**
 *
 * @author El
 */
@WebServlet("/EditRequestServlet")
public class EditRequestServlet extends HttpServlet {

    @EJB
    private SupportRequestFacadeLocal supportService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Student student = (Student) session.getAttribute("student");
        String studentNumber = student.getStudentNumber(); // ensure type matches your entity

        String requestIdStr = request.getParameter("requestId");
        if (requestIdStr == null || !requestIdStr.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid requestId");
            return;
        }
        Long requestId = Long.valueOf(requestIdStr);

        String typeStr = request.getParameter("supportType");
        if (typeStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "supportType is required");
            return;
        }

        SupportType type;
        try {
            type = SupportType.valueOf(typeStr.trim().toUpperCase());
        } catch (IllegalArgumentException ex) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid supportType");
            return;
        }

        String desc = request.getParameter("description");
        if (desc == null || desc.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Description cannot be empty");
            return;
        }
        desc = desc.trim();

        int updated = supportService.editSupportRequest(requestId, studentNumber, type, desc);
        if (updated == 0) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN,
                    "Cannot edit this request (not found, not yours, or not pending).");
            return;
        }

        response.sendRedirect("TrackRequestsServlet");
    }
}
