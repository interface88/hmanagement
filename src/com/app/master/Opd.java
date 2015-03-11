package com.app.master;

import java.sql.Date;

public class Opd{
	
	private Patient patient = new Patient();
	private Doctor doctor = new Doctor();
	private String staffName;
	private Date entryDate;
	private String caseType;
	private String admissionId;
	private Double consulationFee;

	// -------------- Getter and Setter----------------

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

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public String getCaseType() {
		return caseType;
	}

	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}

	public String getAdmissionId() {
		return admissionId;
	}

	public void setAdmissionId(String admissionId) {
		this.admissionId = admissionId;
	}

	public Double getConsulationFee() {
		return consulationFee;
	}

	public void setConsulationFee(Double consulationFee) {
		this.consulationFee = consulationFee;
	}
}
