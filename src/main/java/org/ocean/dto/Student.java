package org.ocean.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Student {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String fname;
	private String lname;
	private String number;
	@Column(name = "class")
	private int classId;
	@Column(name = "total_present_day")
	private int totalPresentDay;
	@Column(name = "total_absent_day")
	private int totalAbsentDay;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public int getTotalPresentDay() {
		return totalPresentDay;
	}
	public void setTotalPresentDay(int totalPresentDay) {
		this.totalPresentDay = totalPresentDay;
	}
	public int getTotalAbsentDay() {
		return totalAbsentDay;
	}
	public void setTotalAbsentDay(int totalAbsentDay) {
		this.totalAbsentDay = totalAbsentDay;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", fname=" + fname + ", lname=" + lname + ", number=" + number + ", classId="
				+ classId + ", totalPresentDay=" + totalPresentDay + ", totalAbsentDay=" + totalAbsentDay + "]";
	}
	
	
}
