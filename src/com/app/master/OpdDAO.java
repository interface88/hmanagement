package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class OpdDAO{
	//+2348051095858
	Session session;
	public OpdDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Opd opd){
		Transaction transaction = session.beginTransaction();
		session.save(opd);
		transaction.commit();
	}
	
	public void update(Opd opd){
		Transaction transaction = session.beginTransaction();
		session.merge(opd);
		transaction.commit();
	}
	
	public void delete(Opd opd){
		session.delete(opd);
	}
	
	public Opd findById(Integer id) {
		Opd opd = (Opd) session.get(Opd.class, id);
		return opd;
	}
	
	public Opd getLatestOpd() {
		
		Opd result = (Opd) session.createQuery("from Opd ORDER BY id DESC")
                .setMaxResults(1)
                .uniqueResult();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public Opd findByAdmissionId(String admissionNo) {
		
		Query query  = session.createQuery("from Opd as model where model.admissionId = ?");
		query.setParameter(0, admissionNo);
		List<Opd> list = query.list();
		if(!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Opd> getList(){
		List<Opd> list = new ArrayList<Opd>();
		Query query  = session.createQuery("from Opd");
		list = query.list();
		return list;
	}
}
