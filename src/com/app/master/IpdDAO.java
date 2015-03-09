package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class IpdDAO{
	
	Session session;
	public IpdDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Ipd ipd){
		
		Transaction transaction = session.beginTransaction();
		session.save(ipd);
		transaction.commit();
	}
	
	public void delete(Ipd ipd){
		session.delete(ipd);
	}
	
	public Ipd findByCode(Integer code) {
		Ipd ipd = (Ipd) session.get(Ipd.class, code);
		return ipd;
}
	
	@SuppressWarnings("unchecked")
	public List<Ipd> getList(){
		List<Ipd> list = new ArrayList<Ipd>();
		Query query  = session.createQuery("from Ipd");
		list = query.list();
		return list;
	}
}