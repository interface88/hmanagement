package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class PatientDAO{
	
	Session session;
	public PatientDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Patient patient){
		Transaction transaction = session.beginTransaction();
		session.save(patient);
		transaction.commit();
	}
	
	public void delete(Patient patient){
		session.delete(patient);
	}
	
	public Patient findByCode(Integer code) {
		Patient patient = (Patient) session.get(Patient.class, code);
		return patient;
	}
	
	@SuppressWarnings("unchecked")
	public List<Patient> getList(){
		List<Patient> list = new ArrayList<Patient>();
		Query query  = session.createQuery("from Patient");
		list = query.list();
		return list;
	}
}
