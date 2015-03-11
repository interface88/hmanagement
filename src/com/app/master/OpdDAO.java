package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class OpdDAO{
	
	Session session;
	public OpdDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Opd opd){
		Transaction transaction = session.beginTransaction();
		session.save(opd);
		transaction.commit();
	}
	
	public void delete(Opd opd){
		session.delete(opd);
	}
	
	public Opd findByCode(Integer code) {
		Opd opd = (Opd) session.get(Opd.class, code);
		return opd;
	}

	@SuppressWarnings("unchecked")
	public List<Opd> getList(){
		List<Opd> list = new ArrayList<Opd>();
		Query query  = session.createQuery("from Opd");
		list = query.list();
		return list;
	}
}
