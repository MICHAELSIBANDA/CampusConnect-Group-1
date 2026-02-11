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
import tut.ac.za.entitiy.Service;
import tut.ac.za.entitiy.Student;

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
    public Student findStudent(Integer studentNo) {
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
    public List<Service> findAllServices() {
        Query query = em.createQuery("SELECT s FROM Service s");
        List<Service> services = query.getResultList();
        return services;
    }

    @Override
    public List<Service> findAllServicesForSpecificType(String type) {
        Query query = em.createQuery("SELECT s FROM Service s WHERE s.type = :type");
        query.setParameter("type", type);
        List<Service> services = query.getResultList();
        return services;
    }

    @Override
    public void updateStatus(Long serviceId, String status) {
        Query query =em.createQuery("UPDATE Service s SET s.status = :status WHERE s.id = :id");
        query.setParameter("status", status);
        query.setParameter("id", serviceId);
        query.executeUpdate();
    }
    
}
