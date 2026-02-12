/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.cc.RequestStatus;
import za.ac.tut.cc.SupportType;
import za.ac.tut.model.entity.Admin;
import za.ac.tut.model.entity.Feedback;
import za.ac.tut.model.entity.Student;
import za.ac.tut.model.entity.SupportRequest;

/**
 *
 * @author Lwazy
 */
@Local
public interface AdminFacadeLocal {

    void create(Admin admin);
    
    List<Student> findAllStudents(); // View all students in DataBase
    
    Student findStudent(String studentNo); // View for a specific student
    
    void updateStatus(Long requestId, RequestStatus status); // update the status
    
    List<SupportRequest> findAllRequests(); // view all services/requests 
    
    List<SupportRequest> findAllRequestsForSpecificType(SupportType type); // View Services e.g by tutors/ consultations
    
    Admin findAdmin(String email);

    public List<Feedback> findAllFeedBacks();
    
    int countPending();
    
    int countCompleted();
}
