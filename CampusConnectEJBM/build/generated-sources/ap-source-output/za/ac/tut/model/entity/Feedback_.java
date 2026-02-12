package za.ac.tut.model.entity;

import java.time.LocalDateTime;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.cc.SupportType;
import za.ac.tut.model.entity.Student;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2026-02-12T07:31:42")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, LocalDateTime> createdAt;
    public static volatile SingularAttribute<Feedback, String> comments;
    public static volatile SingularAttribute<Feedback, Student> student;
    public static volatile SingularAttribute<Feedback, Integer> rating;
    public static volatile SingularAttribute<Feedback, Long> id;
    public static volatile SingularAttribute<Feedback, SupportType> relatedService;

}