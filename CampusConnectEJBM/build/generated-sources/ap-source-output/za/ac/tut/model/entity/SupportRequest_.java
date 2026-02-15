package za.ac.tut.model.entity;

import java.time.LocalDateTime;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.cc.RequestStatus;
import za.ac.tut.cc.SupportType;
import za.ac.tut.model.entity.Student;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2026-02-15T06:46:28")
@StaticMetamodel(SupportRequest.class)
public class SupportRequest_ { 

    public static volatile SingularAttribute<SupportRequest, SupportType> supportType;
    public static volatile SingularAttribute<SupportRequest, LocalDateTime> createdAt;
    public static volatile SingularAttribute<SupportRequest, Student> student;
    public static volatile SingularAttribute<SupportRequest, String> description;
    public static volatile SingularAttribute<SupportRequest, Long> id;
    public static volatile SingularAttribute<SupportRequest, RequestStatus> status;

}