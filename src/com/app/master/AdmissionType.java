package com.app.master;

import java.util.HashSet;
import java.util.Set;

public class AdmissionType{
	
	private Integer id;
	private String code;
	private String name;

	
	private Set<Ipd> ipds = new HashSet<Ipd>();
	// --------- GETTER AND SETTER -----------
	
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
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Ipd> getIpds() {
		return ipds;
	}
	public void setIpds(Set<Ipd> ipds) {
		this.ipds = ipds;
	}
	
	
}
