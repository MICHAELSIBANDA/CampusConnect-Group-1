/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
@Stateless
public class AdminFacade extends AbstractFacade<Admin> implements AdminFacadeLocal {
    @PersistenceContext(unitName = "CampusConnectEJBMPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdminFacade() {
        super(Admin.class);
    }

    @Override
    public List<Student> findAllStudents() {
        Query query = em.createQuery("SELECT s FROM Student s");
        List<Student> students = query.getResultList();
        return students;
    }

    @Override
    public Student findStudent(String studentNo) {
        Query query = em.createQuery("SELECT s FROM Student s WHERE s.studentNo = :studentNo");
        query.setParameter("studentNo", studentNo);
        List<Student> list = query.getResultList();
        
        if (list.isEmpty()) {
        return null;
        } else {
        Student student = (Student) list.get(0);
        return student;
        }
    }

    @Override
    public void updateStatus(Long requestId, RequestStatus status) {
        Query query =em.createQuery("UPDATE SupportRequest s SET s.status = :status WHERE s.id = :id");
        query.setParameter("status", status);
        query.setParameter("id", requestId);
        query.executeUpdate();
    }

     @Override
    public List<SupportRequest> findAllRequests() {
        Query query = em.createQuery("SELECT s FROM SupportRequest s");
        List<SupportRequest> requests = query.getResultList();
        if (requests.isEmpty()) {
        return null;
        } else {
        return requests;
        }
    }

    @Override
    public List<SupportRequest> findAllRequestsForSpecificType(SupportType type) {
        Query query = em.createQuery("SELECT s FROM SupportRequest s WHERE s.supportType = :type");
        query.setParameter("type", type);
        List<SupportRequest> requests = query.getResultList();
        return requests;
    }

    @Override
    public Admin findAdmin(String email) {
        Query query = em.createQuery("SELECT s FROM Admin s WHERE s.email = :email");
        query.setParameter("email", email);
        List<Admin> list = query.getResultList();
        
        if (list.isEmpty()) {
        return null;
        } else {
        Admin admin = (Admin) list.get(0);
        return admin;
        }
    }

    @Override
    public List<Feedback> findAllFeedBacks() {
        Query query = em.createQuery("SELECT s FROM Feedback s");
        List<Feedback> feedbacks = query.getResultList();
        
        if (feedbacks.isEmpty()) {
        return null;
        } else {
        return feedbacks;
        }
    }
    
     @Override
    public int countPending() {
    Query query = em.createQuery("SELECT COUNT(s) FROM SupportRequest s WHERE s.status = :status");
    query.setParameter("status", RequestStatus.PENDING);

    Long count = (Long) query.getSingleResult();
    return count.intValue();
    }

    @Override
    public int countCompleted() {
    Query query = em.createQuery("SELECT COUNT(s) FROM SupportRequest s WHERE s.status = :status");
    query.setParameter("status", RequestStatus.COMPLETED);

    Long count = (Long) query.getSingleResult();
    return count.intValue();
    }
}
