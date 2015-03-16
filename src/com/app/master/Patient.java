package com.app.master;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import com.app.entity.DischargeTicket;
import com.app.entity.FinalBill;
import com.app.entity.PaymentCollection;

public class Patient {

	private Integer id;
	private Date registrationDate;
	private String registrationNo;
	private String title;
	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	private Date birthDate;
	private String contactInfo;
	private String referredBy;
	private String bloodGroup;
	private Integer weight;
	private String telephone;
	private String mobile;
	private String email;
	private String address;
	private String address1;
	private String address2;
	private String address3;
	private String area;
	private String district;
	private String city;
	private String state;
	private String zip;
	private String country;

	private Set<Ipd> ipds = new HashSet<Ipd>();
	private Set<Opd> opds = new HashSet<Opd>();
	private Set<Nursing> nursings = new HashSet<Nursing>();
	private Set<DischargeTicket> dischargeTickets = new HashSet<DischargeTicket>();
	private Set<FinalBill> finalBills = new HashSet<FinalBill>();
	private Set<PaymentCollection> paymentCollections = new HashSet<PaymentCollection>();
	

	// -------------- Getter and Setter----------------

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}

	public String getReferredBy() {
		return referredBy;
	}

	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Set<Ipd> getIpds() {
		return ipds;
	}

	public void setIpds(Set<Ipd> ipds) {
		this.ipds = ipds;
	}

	public Set<Opd> getOpds() {
		return opds;
	}

	public void setOpds(Set<Opd> opds) {
		this.opds = opds;
	}

	public Set<Nursing> getNursings() {
		return nursings;
	}

	public void setNursings(Set<Nursing> nursings) {
		this.nursings = nursings;
	}

	public Set<DischargeTicket> getDischargeTickets() {
		return dischargeTickets;
	}

	public void setDischargeTickets(Set<DischargeTicket> dischargeTickets) {
		this.dischargeTickets = dischargeTickets;
	}

	public String getRegistrationNo() {
		return registrationNo;
	}

	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
		public Set<FinalBill> getFinalBills() {
		return finalBills;
	}

	public void setFinalBills(Set<FinalBill> finalBills) {
		this.finalBills = finalBills;
	}

	public Set<PaymentCollection> getPaymentCollections() {
		return paymentCollections;
	}

	public void setPaymentCollections(Set<PaymentCollection> paymentCollections) {
		this.paymentCollections = paymentCollections;
	}
}
