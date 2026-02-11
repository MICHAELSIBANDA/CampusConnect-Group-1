/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.model.admin.controller;

import java.util.Date;
import javax.ejb.Local;
import za.ac.tut.model.entity.Admin;

/**
 *
 * @author Lwazy
 */
@Local
public interface AdminSessionBeanLocal {

    void createStudent(String fullname, String studentNo, String email, String password);
    void editStudent(String fullname, String studentNo, String email, String password);
    void createAnnouncment(String title, String content);
    void editAnnouncment(Long id,String title, String content);
    void removeAnnouncment(Long id);
    void createEvent(String title, String content, Date startDateAndTime, Date endDateAndTime);
    void editEvent(Long id, String title, String content, Date startDateAndTime, Date endDateAndTime);
    void removeEvent(Long id);
    Admin login(String email,String password);

}
