/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.entitiy;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import static tut.ac.za.entitiy.Admin_.id;

/**
 *
 * @author El
 */
@Entity
@Table(name = "STUDENT",
        uniqueConstraints = {
            @UniqueConstraint(columnNames = "email")
        })
@NamedQueries({
    @NamedQuery(name = "Student.findByStudentNumber",
            query = "SELECT s FROM Student s WHERE s.studentNumber = :studentNumber"),
    @NamedQuery(name = "Student.findByEmail",
            query = "SELECT s FROM Student s WHERE s.email = :email"),
    @NamedQuery(name = "Student.findByStudentNumberOrEmail",
            query = "SELECT s FROM Student s WHERE s.studentNumber = :idOrEmail OR s.email = :idOrEmail")
})
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(nullable = false, updatable = false, length = 20)
    private String studentNumber;   // PRIMARY KEY

    @Column(nullable = false)
    private String fullName;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;        // plain text (as per your rule)

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SupportRequest> requests = new ArrayList<>();

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Feedback> feedbackList = new ArrayList<>();

    public Student() {
    }
    
    

    public Student(String studentNumber, String fullName, String email, String password) {
        this.studentNumber = studentNumber;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
    }

    public String getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<SupportRequest> getRequests() {
        return requests;
    }

    public void setRequests(List<SupportRequest> requests) {
        this.requests = requests;
    }

    public List<Feedback> getFeedbackList() {
        return feedbackList;
    }

    public void setFeedbackList(List<Feedback> feedbackList) {
        this.feedbackList = feedbackList;
    }
    
    

    @Override
    public String toString() {
        return "za.ac.tut.model.entity.Student[ id=" + id + " ]";
    }

}