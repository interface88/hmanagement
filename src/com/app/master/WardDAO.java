package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class WardDAO{
	
	Session session;
	public WardDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Ward ward){
		
		Transaction transaction = session.beginTransaction();
		session.save(ward);
		transaction.commit();
	}
	

	
	public void delete(Ward ward){
		Transaction transaction = session.beginTransaction();
		session.delete(ward);
		transaction.commit();
	}
	
	public Ward findByName(String wardName) {
		Query query =  session.createQuery("from Ward as model where model.name = ?");
		Ward result = (Ward) query.setParameter(0, wardName)
                .setMaxResults(1)
                .uniqueResult();
		return result;
	}

	public Ward findById(Integer id) {
		Ward ward = (Ward) session.get(Ward.class, id);
		return ward;
	}
	
	@SuppressWarnings("unchecked")
	public List<Ward> getList(){
		List<Ward> list = new ArrayList<Ward>();
		Query query  = session.createQuery("from Ward");
		list = query.list();
		return list;
	}
}
