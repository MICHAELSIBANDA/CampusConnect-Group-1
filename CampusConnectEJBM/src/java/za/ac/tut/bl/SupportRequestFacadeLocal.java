/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.cc.SupportType;
import za.ac.tut.model.entity.SupportRequest;

/**
 *
 * @author El
 */
@Local
public interface SupportRequestFacadeLocal {

    void create(SupportRequest supportRequest);

    int editSupportRequest(Long requestId, String studentNumber, SupportType newType, String newDescription);

    List<SupportRequest> findByStudentNumber(String studentNumber);

    List<SupportRequest> findRecentByStudentNumber(String studentNumber, int max);

    int count();
}
