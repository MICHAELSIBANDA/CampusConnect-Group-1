/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.adminController;

import java.util.Date;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import tut.ac.za.ejb.bl.AdminFacadeLocal;
import tut.ac.za.ejb.bl.AnnouncmentFacadeLocal;
import tut.ac.za.ejb.bl.EventFacadeLocal;
import tut.ac.za.ejb.bl.StudentFacadeLocal;
import tut.ac.za.entitiy.Announcment;
import tut.ac.za.entitiy.Event;
import tut.ac.za.entitiy.Student;

/**
 *
 * @author Lwazy
 */
@Stateless
public class AdminSessionBean implements AdminSessionBeanLocal {
@EJB
private StudentFacadeLocal sfl;
@EJB
private AdminFacadeLocal afl;
@EJB
private AnnouncmentFacadeLocal annfl;
@EJB
private EventFacadeLocal efl;

    @Override
    public void createStudent(String fullname, Integer studentNo, String email, String password) {
        
        Student existing = afl.findStudent(studentNo);
        
        if (existing == null) {
           Student student = new Student(fullname, studentNo, email, password, new Date());
            sfl.create(student);
        }
        
    }

    @Override
    public void createAnnouncment(String title, String content) {
        Announcment announcment = new Announcment(title, content, new Date());
        annfl.create(announcment);
    }

    @Override
    public void createEvent(String title, String content, Date startDateAndTime, Date endDateAndTime) {
        Event event = new Event(title, content, startDateAndTime, endDateAndTime, new Date());
        efl.create(event);
    }

    @Override
    public void editStudent(String fullname, Integer studentNo, String email, String password) {
        Student existing = afl.findStudent(studentNo);
        
        if (existing != null) {
            existing.setFullname(fullname);
            existing.setStudentNo(studentNo);
            existing.setEmail(email);
            existing.setPassword(password);
            sfl.edit(existing);
        }
    }

}
