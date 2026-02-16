package za.ac.tut.model.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.model.entity.Announcment;
import za.ac.tut.model.entity.Event;
import za.ac.tut.model.entity.SupportRequest;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2026-02-15T15:39:24")
@StaticMetamodel(Admin.class)
public class Admin_ { 

    public static volatile SingularAttribute<Admin, String> password;
    public static volatile SingularAttribute<Admin, String> phoneNumber;
    public static volatile SingularAttribute<Admin, String> surname;
    public static volatile SingularAttribute<Admin, String> name;
    public static volatile SingularAttribute<Admin, Long> id;
    public static volatile ListAttribute<Admin, SupportRequest> requests;
    public static volatile ListAttribute<Admin, Announcment> announcments;
    public static volatile SingularAttribute<Admin, String> email;
    public static volatile ListAttribute<Admin, Event> events;

}