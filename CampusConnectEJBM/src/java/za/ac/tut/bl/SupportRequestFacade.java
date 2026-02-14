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
import za.ac.tut.cc.RequestStatus;
import za.ac.tut.cc.SupportType;
import za.ac.tut.model.entity.SupportRequest;

/**
 *
 * @author El
 */
@Stateless
public class SupportRequestFacade extends AbstractFacade<SupportRequest> implements SupportRequestFacadeLocal {

    @PersistenceContext(unitName = "CampusConnectEJBMPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SupportRequestFacade() {
        super(SupportRequest.class);
    }

    @Override
    public List<SupportRequest> findByStudentNumber(String studentNumber) {
        return em.createNamedQuery("SupportRequest.findByStudentNumber", SupportRequest.class)
                .setParameter("studentNumber", studentNumber)
                .getResultList();
    }

    @Override
    public List<SupportRequest> findRecentByStudentNumber(String studentNumber, int max) {
        return em.createNamedQuery("SupportRequest.findRecentByStudentNumber", SupportRequest.class)
                .setParameter("studentNumber", studentNumber)
                .setMaxResults(max)
                .getResultList();
    }

   @Override
    public int editSupportRequest(Long requestId, String studentNumber, SupportType newType, String newDescription) {
        return em.createQuery(
                "UPDATE SupportRequest r "
                + "SET r.supportType = :t, r.description = :d "
                + "WHERE r.id = :id "
                + "AND r.student.studentNumber = :sn "
                + "AND r.status = :pending"
        )
                .setParameter("t", newType)
                .setParameter("d", newDescription)
                .setParameter("id", requestId)
                .setParameter("sn", studentNumber)
                .setParameter("pending", RequestStatus.PENDING)
                .executeUpdate(); // returns 1 if updated, 0 if not allowed/not found    
    }

}
