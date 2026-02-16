/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.model.entity.Student;

/**
 *
 * @author El
 */
@Local
public interface StudentFacadeLocal {

    void create(Student student);

    void edit(Student student);

    Student find(String studentNumber);

    Student findByStudentNumber(String studentNumber);

    Student findByEmail(String email);

    Student findByStudentNumberOrEmail(String idOrEmail);

}
