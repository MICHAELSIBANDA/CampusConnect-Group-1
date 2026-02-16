/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.model.entity.Announcment;

/**
 *
 * @author Lwazy
 */
@Stateless
public class AnnouncmentFacade extends AbstractFacade<Announcment> implements AnnouncmentFacadeLocal {
    @PersistenceContext(unitName = "CampusConnectEJBMPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AnnouncmentFacade() {
        super(Announcment.class);
    }
    
}
