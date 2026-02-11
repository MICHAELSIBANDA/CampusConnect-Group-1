/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.StudentFacadeLocal;
import za.ac.tut.bl.SupportRequestFacadeLocal;
import za.ac.tut.cc.SupportType;
import za.ac.tut.model.entity.Student;
import za.ac.tut.model.entity.SupportRequest;

/**
 *
 * @author El
 */
public class SupportRequestServlet extends HttpServlet {
 @EJB
    StudentFacadeLocal studentFacade;

    @EJB
    SupportRequestFacadeLocal requestFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String studentNumber = (session != null) ? (String) session.getAttribute("studentNumber") : null;

        if (studentNumber == null) {
            response.sendRedirect("../login.jsp");
            return;
        }

        String supportTypeStr = request.getParameter("supportType"); // TUTORING or CONSULTATION
        String description = request.getParameter("description");


        Student student = studentFacade.find(studentNumber);
        if (student == null) {
            response.sendRedirect("../login.jsp");
            return;
        }

        SupportRequest r = new SupportRequest();
        r.setStudent(student);
        r.setSupportType(SupportType.valueOf(supportTypeStr));
        r.setDescription(description);

        // status defaults to PENDING in entity
        requestFacade.create(r);

        response.sendRedirect("Requestlogged.jsp");
    }
}
