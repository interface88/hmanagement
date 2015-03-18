package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class AdmissionTypeDAO{
	
	Session session;
	public AdmissionTypeDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(AdmissionType admissionType){
		
		Transaction transaction = session.beginTransaction();
		session.save(admissionType);
		transaction.commit();
	}
	

	
	public void delete(AdmissionType admissionType){
		Transaction transaction = session.beginTransaction();
		session.delete(admissionType);
		transaction.commit();
	}
	
	public AdmissionType findByCode(String code) {
		AdmissionType admissionType = (AdmissionType) session.get(AdmissionType.class, code);
		return admissionType;
	}

	public AdmissionType findById(Integer id) {
		AdmissionType admissionType = (AdmissionType) session.get(AdmissionType.class, id);
		return admissionType;
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmissionType> getList(){
		List<AdmissionType> list = new ArrayList<AdmissionType>();
		Query query  = session.createQuery("from AdmissionType");
		list = query.list();
		return list;
	}
}
