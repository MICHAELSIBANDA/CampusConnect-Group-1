/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.cc.ejb.StudentServiceLocal;
import za.ac.tut.model.entity.Student;

/**
 *
 * @author El
 */
public class LoginServlet extends HttpServlet {

    @EJB StudentServiceLocal studentService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idOrEmail = request.getParameter("email"); // student no OR email
        String password = request.getParameter("password");

        Student s = studentService.login(idOrEmail, password);

        if (s == null) {
            request.setAttribute("error", "Invalid login details.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
            return;
        }

        HttpSession session = request.getSession(true);
        session.setAttribute("studentNumber", s.getStudentNumber());

        response.sendRedirect("dashboard.jsp");
    }

}
