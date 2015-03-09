package com.app.master;

public class Service {

	private Integer code;
	private String name;
	private Department department = new Department();
	private String charges;

	// --------- GETTER AND SETTER -----------

	public String getName() {
		return name;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getCharges() {
		return charges;
	}

	public void setCharges(String charges) {
		this.charges = charges;
	}
}
