/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tut.ac.za.entitiy;

import java.io.Serializable;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import tut.ac.za.entitiy.Student;

/**
 *
 * @author El
 */
@Entity
@Table(name="FEEDBACK")
@NamedQueries({
  @NamedQuery(name="Feedback.findByStudentNumber",
    query="SELECT f FROM Feedback f WHERE f.student.studentNumber = :studentNumber ORDER BY f.createdAt DESC")
})
public class Feedback implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @ManyToOne(optional=false)
    @JoinColumn(name="student_number", referencedColumnName="studentNumber", nullable=false)
    private Student student;

    @Enumerated(EnumType.STRING)
    @Column(nullable=false)
    private SupportType relatedService;

    @Column(nullable=false)
    private Integer rating;

    @Lob
    private String comments;

    @Column(nullable=false)
    private LocalDateTime createdAt = LocalDateTime.now();

    public Feedback() {
    }

    public Feedback(Student student, SupportType relatedService, Integer rating, String comments) {
        this.student = student;
        this.relatedService = relatedService;
        this.rating = rating;
        this.comments = comments;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public SupportType getRelatedService() {
        return relatedService;
    }

    public void setRelatedService(SupportType relatedService) {
        this.relatedService = relatedService;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedback)) {
            return false;
        }
        Feedback other = (Feedback) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.model.entity.Feedback[ id=" + id + " ]";
    }
    
}