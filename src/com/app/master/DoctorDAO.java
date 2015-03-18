package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class DoctorDAO{
	
	Session session;
	public DoctorDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Doctor doctor){
		
		Transaction transaction = session.beginTransaction();
		session.save(doctor);
		transaction.commit();
	}
	
	public void update(Doctor doctor){
		
		Transaction transaction = session.beginTransaction();
		session.merge(doctor);
		transaction.commit();
	}
	
	public void delete(Doctor doctor){
		Transaction transaction = session.beginTransaction();
		session.delete(doctor);
		transaction.commit();
	}
	
	public Doctor findById(Integer id) {
		Doctor book = (Doctor) session.get(Doctor.class, id);
		return book;
}
	
	@SuppressWarnings("unchecked")
	public List<Doctor> getList(){
		List<Doctor> list = new ArrayList<Doctor>();
		Query query  = session.createQuery("from Doctor");
		list = query.list();
		return list;
	}
}
