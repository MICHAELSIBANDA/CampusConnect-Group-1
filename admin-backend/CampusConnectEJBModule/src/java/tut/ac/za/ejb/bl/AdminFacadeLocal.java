/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import tut.ac.za.entitiy.Admin;
import tut.ac.za.entitiy.RequestStatus;
import tut.ac.za.entitiy.Student;
import tut.ac.za.entitiy.SupportRequest;
import tut.ac.za.entitiy.SupportType;

/**
 *
 * @author student
 */
@Local
public interface AdminFacadeLocal {

    void create(Admin admin);
    
    List<Student> findAllStudents(); // View all students in DataBase
    
    Student findStudent(String studentNo); // View for a specific student
    
    void updateStatus(Long requestId, RequestStatus status); // update the status
    
    List<SupportRequest> findAllRequests(); // view all services/requests 
    
    List<SupportRequest> findAllRequestsForSpecificType(SupportType type); // View Services e.g by tutors/ consultations
    
    
}
