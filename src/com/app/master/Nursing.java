package com.app.master;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Nursing {

	private Integer id;
	private String admissionId;
	private Patient patient = new Patient();
	private Doctor doctor = new Doctor();
	private String staffName;
	private Integer noOfVisit;
	private Date nursingDate;
	private String pressure;
	private String pulse;
	private String temperature;
	private String sugar;
	private String examingTime;
	private String remark;

	private Set<NursingTransaction> nursingTransactions = new HashSet<NursingTransaction>();

	// -------------- Getter and Setter----------------

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdmissionId() {
		return admissionId;
	}

	public void setAdmissionId(String admissionId) {
		this.admissionId = admissionId;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public Integer getNoOfVisit() {
		return noOfVisit;
	}

	public void setNoOfVisit(Integer noOfVisit) {
		this.noOfVisit = noOfVisit;
	}

	public Date getNursingDate() {
		return nursingDate;
	}

	public void setNursingDate(Date nursingDate) {
		this.nursingDate = nursingDate;
	}

	public Set<NursingTransaction> getNursingTransactions() {
		return nursingTransactions;
	}

	public void setNursingTransactions(
			Set<NursingTransaction> nursingTransactions) {
		this.nursingTransactions = nursingTransactions;
	}

	public String getPressure() {
		return pressure;
	}

	public void setPressure(String pressure) {
		this.pressure = pressure;
	}

	public String getPulse() {
		return pulse;
	}

	public void setPulse(String pulse) {
		this.pulse = pulse;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getSugar() {
		return sugar;
	}

	public void setSugar(String sugar) {
		this.sugar = sugar;
	}

	public String getExamingTime() {
		return examingTime;
	}

	public void setExamingTime(String examingTime) {
		this.examingTime = examingTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	
	
}
