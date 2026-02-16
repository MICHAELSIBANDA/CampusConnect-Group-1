/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.model.admin.controller;

import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import za.ac.tut.bl.AdminFacadeLocal;
import za.ac.tut.bl.AnnouncmentFacadeLocal;
import za.ac.tut.bl.EventFacadeLocal;
import za.ac.tut.bl.StudentFacadeLocal;
import za.ac.tut.cc.RequestStatus;
import za.ac.tut.cc.ejb.StudentServiceLocal;
import za.ac.tut.model.entity.Admin;
import za.ac.tut.model.entity.Announcment;
import za.ac.tut.model.entity.Event;
import za.ac.tut.model.entity.Feedback;
import za.ac.tut.model.entity.Student;
import za.ac.tut.model.entity.SupportRequest;

/**
 *
 * @author Lwazy
 */
@Stateless
public class AdminSessionBean implements AdminSessionBeanLocal {
@EJB
private StudentFacadeLocal sfl;
@EJB
private StudentServiceLocal ssl;
@EJB
private AdminFacadeLocal afl;
@EJB
private AnnouncmentFacadeLocal annfl;
@EJB
private EventFacadeLocal efl;

    @Override
    public void createStudent(String fullname, String studentNo, String email, String password) {
        
        Student existing = afl.findStudent(studentNo);
        
        if (existing == null) {
            ssl.register(studentNo, fullname, email, password);
        }
        
    }
/*
     @Override
    public void editStudent(String fullname, String studentNo, String email, String password) {
        Student existing = sfl.find(studentNo);
        
        if (existing != null) {
            existing.setFullName(fullname);
            existing.setStudentNumber(studentNo);
            existing.setEmail(email);
            existing.setPassword(password);
            sfl.edit(existing);
        }
    }
*/
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
/*
    @Override
    public void editEvent(Long id, String title, String content, Date startDateAndTime, Date endDateAndTime) {
        Event existing = efl.find(id);
        
        if (existing != null) {
            existing.setTitle(title);
            existing.setContent(content);
            existing.setStartDateAndTime(startDateAndTime);
            existing.setEndDateAndTime(endDateAndTime);
            efl.edit(existing);
        }
    }

    @Override
    public void removeEvent(Long id) {
        Event existing = efl.find(id);
        efl.remove(existing);
    }

    @Override
    public void editAnnouncment(Long id, String title, String content) {
        Announcment existing = annfl.find(id);
        
        if (existing != null) {
            existing.setTitle(title);
            existing.setContent(content);
            annfl.edit(existing);
        }
    }

    @Override
    public void removeAnnouncment(Long id) {
        Announcment existing = annfl.find(id);
        annfl.remove(existing);
    }

*/

    @Override
    public Admin login(String email, String password) {
        Admin admin = afl.findAdmin(email);
        if (admin == null) {
            return null;
        }

        return password != null && password.equals(admin.getPassword()) ? admin : null;
    }

    @Override
    public List<SupportRequest> viewAllRequests() {
        List<SupportRequest> requests = afl.findAllRequests();
        return requests;
    }

    @Override
    public void updateRequestStatus(Long requestId, String status) {
        status = status.toUpperCase();
        RequestStatus rs = RequestStatus.PENDING;
        
        if (status.equalsIgnoreCase("PENDING")) {
            rs = RequestStatus.PENDING;
        } else if (status.equalsIgnoreCase("APPROVED")) {
            rs = RequestStatus.APPROVED;
        }else if (status.equalsIgnoreCase("REJECTED")) {
            rs = RequestStatus.REJECTED;
        }else if (status.equalsIgnoreCase("COMPLETED")) {
            rs = RequestStatus.COMPLETED;
        }
        
        afl.updateStatus(requestId, rs);
    }

    @Override
    public List<Feedback> viewFeedBackReports() {
        List<Feedback> feedbacks = afl.findAllFeedBacks();
        return feedbacks;
    }


}
