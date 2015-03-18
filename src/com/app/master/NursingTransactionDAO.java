package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class NursingTransactionDAO{
	
	Session session;
	public NursingTransactionDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(NursingTransaction nursingTransaction){
		
		Transaction transaction = session.beginTransaction();
		session.save(nursingTransaction);
		transaction.commit();
	}
	
	public void delete(NursingTransaction nursingTransaction){
		session.delete(nursingTransaction);
	}
	
	public NursingTransaction findById(Integer id) {
		NursingTransaction nursingTransaction = (NursingTransaction) session.get(NursingTransaction.class, id);
		return nursingTransaction;
	}
	
	@SuppressWarnings("unchecked")
	public List<NursingTransaction> getList(){
		List<NursingTransaction> list = new ArrayList<NursingTransaction>();
		Query query  = session.createQuery("from NursingTransaction");
		list = query.list();
		return list;
	}
}
