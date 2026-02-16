/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.cc.ejb;

import javax.ejb.EJB;
import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.inject.Inject;
import za.ac.tut.bl.StudentFacadeLocal;
import za.ac.tut.model.entity.Student;

/**
 *
 * @author El
 */
@Stateless
public class StudentService implements StudentServiceLocal {

    @EJB
    private StudentFacadeLocal studentFacade;

    @Override
    public Student register(String studentNumber, String fullName, String email, String password) {
        if (studentFacade.find(studentNumber) != null) {
            return null; // PK exists
        }
        if (studentFacade.findByEmail(email) != null) {
            return null;  // email unique
        }
        Student s = new Student();
        s.setStudentNumber(studentNumber);
        s.setFullName(fullName);
        s.setEmail(email);
        s.setPassword(password); // store as-is

        studentFacade.create(s);
        return s;
    }

    @Override
    public Student login(String studentNumberOrEmail, String password) {
        Student s = studentFacade.findByStudentNumberOrEmail(studentNumberOrEmail);
        if (s == null) {
            return null;
        }

        return password != null && password.equals(s.getPassword()) ? s : null;
    }

}
