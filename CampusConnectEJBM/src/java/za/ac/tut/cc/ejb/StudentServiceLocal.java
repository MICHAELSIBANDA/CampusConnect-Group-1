/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.cc.ejb;

import javax.ejb.Local;
import za.ac.tut.model.entity.Student;

/**
 *
 * @author El
 */
@Local
public interface StudentServiceLocal {

    Student register(String studentNumber, String fullName, String email, String password);

    Student login(String studentNumberOrEmail, String password);

}
