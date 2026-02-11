/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import tut.ac.za.entitiy.Admin;
import tut.ac.za.entitiy.Announcment;
import tut.ac.za.entitiy.Event;
import tut.ac.za.entitiy.Service;
import tut.ac.za.entitiy.Student;

/**
 *
 * @author student
 */
@Local
public interface AdminFacadeLocal {

    void create(Admin admin);
    
    List<Student> findAllStudents(); // View all students in DataBase
    
    Student findStudent(Integer studentNo); // View for a specific student
    
    void updateStatus(Long serviceId, String status); // update the status
    
    List<Service> findAllServices(); // view all services/requests 
    
    List<Service> findAllServicesForSpecificType(String type); // View Services e.g by tutors/ consultations
    
    
}
