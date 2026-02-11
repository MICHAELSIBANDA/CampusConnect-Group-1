/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.model.entity;

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
import za.ac.tut.cc.RequestStatus;
import za.ac.tut.cc.SupportType;

/**
 *
 * @author El
 */
@Entity
@Table(name="SUPPORT_REQUEST")
@NamedQueries({
  @NamedQuery(name="SupportRequest.findByStudentNumber",
    query="SELECT r FROM SupportRequest r WHERE r.student.studentNumber = :studentNumber ORDER BY r.createdAt DESC"),

  @NamedQuery(name="SupportRequest.findRecentByStudentNumber",
    query="SELECT r FROM SupportRequest r WHERE r.student.studentNumber = :studentNumber ORDER BY r.createdAt DESC")
})
public class SupportRequest implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @ManyToOne(optional=false)
    @JoinColumn(name="student_number", referencedColumnName="studentNumber", nullable=false)
    private Student student;

    @Enumerated(EnumType.STRING)
    @Column(nullable=false)
    private SupportType supportType;

    @Lob
    @Column(nullable=false)
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(nullable=false)
    private RequestStatus status = RequestStatus.PENDING;

    @Column(nullable=false)
    private LocalDateTime createdAt = LocalDateTime.now();

    public SupportRequest() {
    }

    public SupportRequest(Student student, SupportType supportType,  String description) {
        this.student = student;
        this.supportType = supportType;
        this.description = description;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public SupportType getSupportType() {
        return supportType;
    }

    public void setSupportType(SupportType supportType) {
        this.supportType = supportType;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public RequestStatus getStatus() {
        return status;
    }

    public void setStatus(RequestStatus status) {
        this.status = status;
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
        if (!(object instanceof SupportRequest)) {
            return false;
        }
        SupportRequest other = (SupportRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.model.entity.SupportRequest[ id=" + id + " ]";
    }
    
}
