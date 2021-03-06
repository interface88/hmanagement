package com.app.entity;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;
import com.app.master.Patient;


public class FinalBillDAO{
	
	Session session;
	public FinalBillDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(FinalBill finalBill){
		
		Transaction transaction = session.beginTransaction();
		session.save(finalBill);
		transaction.commit();
	}

	public void update(FinalBill finalBill){
		
		Transaction transaction = session.beginTransaction();
		session.merge(finalBill);
		transaction.commit();
	}
	
	
	public void delete(FinalBill finalBill){
		session.delete(finalBill);
	}
	
	public FinalBill findById(Integer id) {
		FinalBill finalBill = (FinalBill) session.get(FinalBill.class, id);
		return finalBill;
	}
	
	public FinalBill getLatestFinalBill() {
		
		FinalBill result = (FinalBill) session.createQuery("from FinalBill ORDER BY id DESC")
                .setMaxResults(1)
                .uniqueResult();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<FinalBill> getList(){
		List<FinalBill> list = new ArrayList<FinalBill>();
		Query query  = session.createQuery("from FinalBill");
		list = query.list();
		return list;
	}
}
