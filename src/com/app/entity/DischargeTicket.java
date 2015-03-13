package com.app.entity;

import java.util.Date;

import com.app.master.Doctor;
import com.app.master.Ipd;
import com.app.master.Patient;

public class DischargeTicket {

	private Integer id;
	private String staffName;
	private Date entryDate;
	private String admissionId;
	private Patient patient = new Patient();
	private Ipd ipd = new Ipd();
	private Doctor doctor = new Doctor();
	private String treatmentNote;
	private String dischargeNote;
	private String advice;
	private String conditionOfPatient;
	private String pressure;
	private String pulse;
	private String temperature;
	private String sugar;
	private String examingTime;
	private String remark;
	private String prescribedMedicine;
	private String followUpSchedule;

	
	// --------- GETTER AND SETTER -----------
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Ipd getIpd() {
		return ipd;
	}
	public void setIpd(Ipd ipd) {
		this.ipd = ipd;
	}
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	
	
	public String getTreatmentNote() {
		return treatmentNote;
	}
	public void setTreatmentNote(String treatmentNote) {
		this.treatmentNote = treatmentNote;
	}
	public String getDischargeNote() {
		return dischargeNote;
	}
	public void setDischargeNote(String dischargeNote) {
		this.dischargeNote = dischargeNote;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public String getConditionOfPatient() {
		return conditionOfPatient;
	}
	public void setConditionOfPatient(String conditionOfPatient) {
		this.conditionOfPatient = conditionOfPatient;
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
	public String getPrescribedMedicine() {
		return prescribedMedicine;
	}
	public void setPrescribedMedicine(String prescribedMedicine) {
		this.prescribedMedicine = prescribedMedicine;
	}
	public String getFollowUpSchedule() {
		return followUpSchedule;
	}
	public void setFollowUpSchedule(String followUpSchedule) {
		this.followUpSchedule = followUpSchedule;
	}

	
	

	
}
