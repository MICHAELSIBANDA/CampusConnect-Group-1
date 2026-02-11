/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.adminController;

import java.util.Date;
import javax.ejb.Local;

/**
 *
 * @author Lwazy
 */
@Local
public interface AdminSessionBeanLocal {

    void createStudent(String fullname, Integer studentNo, String email, String password);
    void editStudent(String fullname, Integer studentNo, String email, String password);
    void createAnnouncment(String title, String content);
    void createEvent(String title, String content, Date startDateAndTime, Date endDateAndTime);
}
