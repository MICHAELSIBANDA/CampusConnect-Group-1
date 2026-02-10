/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import za.ac.tut.model.entity.Student;

/**
 *
 * @author El
 */
@Stateless
public class StudentFacade extends AbstractFacade<Student> implements StudentFacadeLocal {

    @PersistenceContext(unitName = "CampusConnectEJBMPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StudentFacade() {
        super(Student.class);
    }

    @Override
    public Student find(String studentNumber) {
        return em.find(Student.class, studentNumber);
    }

    @Override
    public Student findByStudentNumber(String studentNumber) {
        return find(studentNumber);
    }

    @Override
    public Student findByEmail(String email) {
        try {
            return em.createNamedQuery("Student.findByEmail", Student.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }
    }

    @Override
    public Student findByStudentNumberOrEmail(String idOrEmail) {
        Student byNumber = find(idOrEmail);
        if (byNumber != null) {
            return byNumber;
        }

        // otherwise try email
        return findByEmail(idOrEmail);
    }

}
