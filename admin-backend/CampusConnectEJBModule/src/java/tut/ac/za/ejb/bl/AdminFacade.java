/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.ejb.bl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import tut.ac.za.entitiy.Admin;
import tut.ac.za.entitiy.Announcment;
import tut.ac.za.entitiy.Event;
import tut.ac.za.entitiy.RequestStatus;
import tut.ac.za.entitiy.Student;
import tut.ac.za.entitiy.SupportRequest;
import tut.ac.za.entitiy.SupportType;

/**
 *
 * @author student
 */
@Stateless
public class AdminFacade extends AbstractFacade<Admin> implements AdminFacadeLocal {

    @PersistenceContext(unitName = "CampusConnectEJBModulePU")
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
        return requests;
    }

    @Override
    public List<SupportRequest> findAllRequestsForSpecificType(SupportType type) {
        Query query = em.createQuery("SELECT s FROM SupportRequest s WHERE s.supportType = :type");
        query.setParameter("type", type);
        List<SupportRequest> requests = query.getResultList();
        return requests;
    }
}
