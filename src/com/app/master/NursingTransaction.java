package com.app.master;

public class NursingTransaction {

	private Integer id;
	private Nursing nursing = new Nursing();
	private String treatment;
	private Double treatmentCost;

	// -------------- Getter and Setter----------------

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Nursing getNursing() {
		return nursing;
	}

	public void setNursing(Nursing nursing) {
		this.nursing = nursing;
	}

	public String getTreatment() {
		return treatment;
	}

	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}

	public Double getTreatmentCost() {
		return treatmentCost;
	}

	public void setTreatmentCost(Double treatmentCost) {
		this.treatmentCost = treatmentCost;
	}

}
