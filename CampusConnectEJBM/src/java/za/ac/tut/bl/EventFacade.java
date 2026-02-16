/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.model.entity.Event;

/**
 *
 * @author Lwazy
 */
@Stateless
public class EventFacade extends AbstractFacade<Event> implements EventFacadeLocal {
    @PersistenceContext(unitName = "CampusConnectEJBMPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EventFacade() {
        super(Event.class);
    }
    
}
