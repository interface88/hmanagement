package com.app.entity;

import java.sql.Date;

import com.app.master.AdmissionType;
import com.app.master.Doctor;
import com.app.master.Ipd;
import com.app.master.Patient;

public class FinalBill {

	private Integer id;
	private String staffName;
	private Date entryDate;
	private String admissionId;
	private Patient patient = new Patient();
	private Ipd ipd = new Ipd();
	private Doctor doctor = new Doctor();
	private AdmissionType admissionType = new AdmissionType();
	private String billNo;
	private Date billDate;
	private Date dischargeDate;
	private Double grossTotal;
	private Double discount;
	private Double tax;
	private Double netAmount;
	private Double balanceReceiveAmount;
	private Double finalReceiveAmount;
	private String paymentMode;
	private String chequeNumber;
	private Date chequeDate;
	private String bank;
	private String otherDetails;
	private String remark;
	
	
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
	public AdmissionType getAdmissionType() {
		return admissionType;
	}
	public void setAdmissionType(AdmissionType admissionType) {
		this.admissionType = admissionType;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public Date getBillDate() {
		return billDate;
	}
	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Double getTax() {
		return tax;
	}
	public void setTax(Double tax) {
		this.tax = tax;
	}
	public Double getNetAmount() {
		return netAmount;
	}
	public void setNetAmount(Double netAmount) {
		this.netAmount = netAmount;
	}
	public Double getBalanceReceiveAmount() {
		return balanceReceiveAmount;
	}
	public void setBalanceReceiveAmount(Double balanceReceiveAmount) {
		this.balanceReceiveAmount = balanceReceiveAmount;
	}
	public Double getFinalReceiveAmount() {
		return finalReceiveAmount;
	}
	public void setFinalReceiveAmount(Double finalReceiveAmount) {
		this.finalReceiveAmount = finalReceiveAmount;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getChequeNumber() {
		return chequeNumber;
	}
	public void setChequeNumber(String chequeNumber) {
		this.chequeNumber = chequeNumber;
	}
	public Date getChequeDate() {
		return chequeDate;
	}
	public void setChequeDate(Date chequeDate) {
		this.chequeDate = chequeDate;
	}
	public String getOtherDetails() {
		return otherDetails;
	}
	public void setOtherDetails(String otherDetails) {
		this.otherDetails = otherDetails;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public Date getDischargeDate() {
		return dischargeDate;
	}
	public void setDischargeDate(Date dischargeDate) {
		this.dischargeDate = dischargeDate;
	}
	
}
