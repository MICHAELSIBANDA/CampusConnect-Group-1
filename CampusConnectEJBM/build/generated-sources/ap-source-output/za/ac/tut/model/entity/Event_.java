package za.ac.tut.model.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2026-02-15T04:55:45")
@StaticMetamodel(Event.class)
public class Event_ { 

    public static volatile SingularAttribute<Event, Date> startDateAndTime;
    public static volatile SingularAttribute<Event, Date> dateCreatedAt;
    public static volatile SingularAttribute<Event, Date> endDateAndTime;
    public static volatile SingularAttribute<Event, Long> id;
    public static volatile SingularAttribute<Event, String> title;
    public static volatile SingularAttribute<Event, String> content;

}