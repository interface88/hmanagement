package com.app.master;

public class Opd{
	
	private Patient patient = new Patient();
	private Integer code;
	private String name;
	private String address1;
	private String address2;
	private String department;
	private String dutyHours;
	private String qualification;
	private String consultationfee;
	private String weeklyoff;
	
	// -------------- Getter and Setter----------------
	public Integer getCode() {
		return code;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDutyHours() {
		return dutyHours;
	}
	public void setDutyHours(String dutyHours) {
		this.dutyHours = dutyHours;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getConsultationfee() {
		return consultationfee;
	}
	public void setConsultationfee(String consultationfee) {
		this.consultationfee = consultationfee;
	}
	public String getWeeklyoff() {
		return weeklyoff;
	}
	public void setWeeklyoff(String weeklyoff) {
		this.weeklyoff = weeklyoff;
	}


}
