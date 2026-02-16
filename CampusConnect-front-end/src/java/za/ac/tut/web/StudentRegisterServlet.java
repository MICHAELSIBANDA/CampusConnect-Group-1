/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
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
public class StudentRegisterServlet extends HttpServlet {

    @EJB 
    private StudentServiceLocal ssf;

   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentNumber = request.getParameter("studNo");
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Student stud = createStudent(studentNumber,fullName,email,password);
       
        ssf.register(studentNumber, fullName, email, password);
        if (stud == null) {
            request.setAttribute("error", "Registration failed: student number or email already exists.");
            RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
            rd.forward(request, response);
            return;
        }

        HttpSession session = request.getSession(true);
        session.setAttribute("studentNumber", stud.getStudentNumber());

        response.sendRedirect("dashboard.jsp");
    }

    private Student createStudent(String studentNumber, String fullName, String email, String password) {
        
        Student stud = new Student();
        stud.setStudentNumber(studentNumber);
        stud.setFullName(fullName);
        stud.setEmail(email);
        stud.setPassword(password);
        return stud;
    }

}
