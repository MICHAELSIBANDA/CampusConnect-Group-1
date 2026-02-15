package za.ac.tut.model.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.model.entity.Feedback;
import za.ac.tut.model.entity.SupportRequest;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2026-02-15T06:46:28")
@StaticMetamodel(Student.class)
public class Student_ { 

    public static volatile SingularAttribute<Student, String> password;
    public static volatile SingularAttribute<Student, String> studentNumber;
    public static volatile SingularAttribute<Student, String> fullName;
    public static volatile ListAttribute<Student, SupportRequest> requests;
    public static volatile ListAttribute<Student, Feedback> feedbackList;
    public static volatile SingularAttribute<Student, String> email;

}