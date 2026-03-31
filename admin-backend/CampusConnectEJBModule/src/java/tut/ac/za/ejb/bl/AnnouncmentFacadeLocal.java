/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import tut.ac.za.entitiy.Announcment;

/**
 *
 * @author student
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
