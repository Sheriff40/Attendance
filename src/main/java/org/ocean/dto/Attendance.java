package org.ocean.dto;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Attendance {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private LocalDate date;
	
	@ManyToOne
	private Student student;
	
	@Column(name = "stdClass_id")
	private int stdClassId;
	
	private Boolean status;
	 
	
	public Attendance()
	{
		//this.date = LocalDate.now();
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	

	public int getStdClassId() {
		return stdClassId;
	}


	public void setStdClassId(int stdClassId) {
		this.stdClassId = stdClassId;
	}


	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Attendance [id=" + id + ", date=" + date + ", student=" + student + ", stdClassId=" + stdClassId
				+ ", status=" + status + "]";
	}




	
	
	
	
	

	
	
	
	
}
