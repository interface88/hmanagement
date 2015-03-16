package com.app.master;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import com.app.entity.DischargeTicket;
import com.app.entity.FinalBill;

public class Ipd {

	private Integer id;
	private Patient patient = new Patient();
	private Doctor doctor = new Doctor();
	private AdmissionType admissionType = new AdmissionType();
	private String staffName;

	private String admissionId;
	private Date admissionDate;
	private Date entryDate;
	private String admissionTime;
	private String ward;
	private Integer bedNo;
	private String admissionDiagnosis;
	private String admissionDetail;
	private String admissionTreatment;
	private String allergyDetail;
	private String specialNote;
	private Double advancePayment;
	private String remark;

	private Set<DischargeTicket> dischargeTickets = new HashSet<DischargeTicket>();
	private Set<FinalBill> finalBills = new HashSet<FinalBill>();

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

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
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

	public String getAdmissionTime() {
		return admissionTime;
	}

	public void setAdmissionTime(String admissionTime) {
		this.admissionTime = admissionTime;
	}

	public AdmissionType getAdmissionType() {
		return admissionType;
	}

	public void setAdmissionType(AdmissionType admissionType) {
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

	public Set<DischargeTicket> getDischargeTickets() {
		return dischargeTickets;
	}

	public void setDischargeTickets(Set<DischargeTicket> dischargeTickets) {
		this.dischargeTickets = dischargeTickets;
	}
	public Set<FinalBill> getFinalBills() {
		return finalBills;
	}
	public void setFinalBills(Set<FinalBill> finalBills) {
		this.finalBills = finalBills;
	}

}
