/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.model.entity.Announcment;

/**
 *
 * @author El
 */
@Local
public interface AnnouncmentFacadeLocal {

    void create(Announcment announcment);

    void edit(Announcment announcment);

    void remove(Announcment announcment);

    Announcment find(Object id);

    List<Announcment> findAll();

    List<Announcment> findRange(int[] range);

    int count();
    
}
