package za.ac.tut.model.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2026-02-12T07:31:42")
@StaticMetamodel(Announcment.class)
public class Announcment_ { 

    public static volatile SingularAttribute<Announcment, Long> id;
    public static volatile SingularAttribute<Announcment, Date> publishedDate;
    public static volatile SingularAttribute<Announcment, String> title;
    public static volatile SingularAttribute<Announcment, String> content;

}