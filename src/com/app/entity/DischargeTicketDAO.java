package com.app.entity;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class DischargeTicketDAO{
	
	Session session;
	public DischargeTicketDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(PaymentCollection paymentCollection){
		
		Transaction transaction = session.beginTransaction();
		session.save(paymentCollection);
		transaction.commit();
	}

	public void update(PaymentCollection paymentCollection){
		
		Transaction transaction = session.beginTransaction();
		session.merge(paymentCollection);
		transaction.commit();
	}
	
	
	public void delete(PaymentCollection paymentCollection){
		session.delete(paymentCollection);
	}
	
	public PaymentCollection findByCode(String code) {
		PaymentCollection paymentCollection = (PaymentCollection) session.get(PaymentCollection.class, code);
		return paymentCollection;
	}

	public PaymentCollection findById(Integer id) {
		PaymentCollection paymentCollection = (PaymentCollection) session.get(PaymentCollection.class, id);
		return paymentCollection;
	}
	
	@SuppressWarnings("unchecked")
	public List<PaymentCollection> getList(){
		List<PaymentCollection> list = new ArrayList<PaymentCollection>();
		Query query  = session.createQuery("from PaymentCollection");
		list = query.list();
		return list;
	}
}
