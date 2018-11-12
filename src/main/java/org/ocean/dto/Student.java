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
	private String rollNo;
	private String fname;
	private String lname;
	
	private String fatherName;
	private String motherName;
	private String number;
	private String tempAddress;
	private String permAddress;
	private String localGuardian;
	private String localNumber;
	@Column(name = "class")
	private int classId;
	
	@Column(name = "total_present_day")
	private int totalPresentDay = 0;
	@Column(name = "total_absent_day")
	private int totalAbsentDay = 0;
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
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getTempAddress() {
		return tempAddress;
	}
	public void setTempAddress(String tempAddress) {
		this.tempAddress = tempAddress;
	}
	public String getPermAddress() {
		return permAddress;
	}
	public void setPermAddress(String permAddress) {
		this.permAddress = permAddress;
	}
	public String getLocalGuardian() {
		return localGuardian;
	}
	public void setLocalGuardian(String localGuardian) {
		this.localGuardian = localGuardian;
	}
	public String getLocalNumber() {
		return localNumber;
	}
	public void setLocalNumber(String localNumber) {
		this.localNumber = localNumber;
	}
	
	
	
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", rollNo=" + rollNo + ", fname=" + fname + ", lname=" + lname + ", fatherName="
				+ fatherName + ", motherName=" + motherName + ", number=" + number + ", tempAddress=" + tempAddress
				+ ", permAddress=" + permAddress + ", localGuardian=" + localGuardian + ", localNumber=" + localNumber
				+ ", classId=" + classId + ", totalPresentDay=" + totalPresentDay + ", totalAbsentDay=" + totalAbsentDay
				+ "]";
	}
	
	
	
	
	
	
	
}
