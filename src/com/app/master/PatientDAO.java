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
	
	public Patient findById(Integer id) {
		Patient patient = (Patient) session.get(Patient.class, id);
		return patient;
	}
	
	public Patient findByRegistrationNo(String registration) {
		
		Query query =  session.createQuery("from Patient as model where model.registrationNo = ?");
		Patient result = (Patient) query.setParameter(0, registration)
                .setMaxResults(1)
                .uniqueResult();
		return result;
	}
	
	public Patient getLatestPatient() {
		
		Patient result = (Patient) session.createQuery("from Patient ORDER BY id DESC")
                .setMaxResults(1)
                .uniqueResult();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Patient> getList(){
		List<Patient> list = new ArrayList<Patient>();
		Query query  = session.createQuery("from Patient");
		list = query.list();
		return list;
	}
}
