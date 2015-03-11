package com.app.master;

import java.sql.Date;
import java.sql.Time;

public class Ipd{
	
	private Integer id;
	private Patient patient = new Patient();
	private Doctor doctor = new Doctor();
	private String staffName;
	
	private String admissionId;
	private Date admissionDate;
	private Time admissionTime;
	private String admissionType;
	private String ward;
	private Integer bedNo;
	private String admissionDiagnosis;
	private String admissionDetail;
	private String admissionTreatment;
	private String allergyDetail;
	private String specialNote;
	private Double advancePayment;
	private String remark;
	
	// -------------- Getter and Setter----------------
	
	
	
	public Patient getPatient() {
		return patient;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getAdmissionId() {
		return admissionId;
	}
	public void setAdmissionId(String admissionId) {
		this.admissionId = admissionId;
	}
	public Date getAdmissionDate() {
		return admissionDate;
	}
	public void setAdmissionDate(Date admissionDate) {
		this.admissionDate = admissionDate;
	}
	public Time getAdmissionTime() {
		return admissionTime;
	}
	public void setAdmissionTime(Time admissionTime) {
		this.admissionTime = admissionTime;
	}
	public String getAdmissionType() {
		return admissionType;
	}
	public void setAdmissionType(String admissionType) {
		this.admissionType = admissionType;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public Integer getBedNo() {
		return bedNo;
	}
	public void setBedNo(Integer bedNo) {
		this.bedNo = bedNo;
	}
	public String getAdmissionDiagnosis() {
		return admissionDiagnosis;
	}
	public void setAdmissionDiagnosis(String admissionDiagnosis) {
		this.admissionDiagnosis = admissionDiagnosis;
	}
	public String getAdmissionDetail() {
		return admissionDetail;
	}
	public void setAdmissionDetail(String admissionDetail) {
		this.admissionDetail = admissionDetail;
	}
	public String getAdmissionTreatment() {
		return admissionTreatment;
	}
	public void setAdmissionTreatment(String admissionTreatment) {
		this.admissionTreatment = admissionTreatment;
	}
	public String getAllergyDetail() {
		return allergyDetail;
	}
	public void setAllergyDetail(String allergyDetail) {
		this.allergyDetail = allergyDetail;
	}
	public String getSpecialNote() {
		return specialNote;
	}
	public void setSpecialNote(String specialNote) {
		this.specialNote = specialNote;
	}
	public Double getAdvancePayment() {
		return advancePayment;
	}
	public void setAdvancePayment(Double advancePayment) {
		this.advancePayment = advancePayment;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
