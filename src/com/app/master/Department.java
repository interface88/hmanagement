package com.app.master;

import java.util.HashSet;
import java.util.Set;


public class Department {

	private Integer id;
	private String name;
	private String code;

	private Set<Service> services = new HashSet<Service>();

	// --------- GETTER AND SETTER -----------

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

	public Set<Service> getServices() {
		return services;
	}

	public void setServices(Set<Service> services) {
		this.services = services;
	}

}
