package com.app.master;

import java.util.HashSet;
import java.util.Set;

import com.app.entity.DischargeTicket;

public class Doctor{
	
	private Integer id;
	private String name;
	private String code;
	private String address1;
	private String address2;
	private Department department = new Department();
	private String dutyHours;
	private String qualification;
	private String consultationfee;
	private String weeklyoff;
	
	private Set<Ipd> ipds = new HashSet<Ipd>();
	private Set<Opd> opds = new HashSet<Opd>();
	private Set<Nursing> nursings = new HashSet<Nursing>();
	private Set<DischargeTicket> dischargeTickets = new HashSet<DischargeTicket>();
	
	// -------------- Getter and Setter----------------

	
	public String getName() {
		return name;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
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
	
}
