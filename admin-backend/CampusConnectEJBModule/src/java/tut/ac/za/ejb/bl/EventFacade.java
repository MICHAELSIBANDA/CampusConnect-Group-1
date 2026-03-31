/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.ejb.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import tut.ac.za.entitiy.Event;

/**
 *
 * @author student
 */
@Stateless
public class EventFacade extends AbstractFacade<Event> implements EventFacadeLocal {

    @PersistenceContext(unitName = "CampusConnectEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EventFacade() {
        super(Event.class);
    }
    
}
