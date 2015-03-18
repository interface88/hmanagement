package com.app.entity;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class DischargeTicketDAO{
	
	Session session;
	public DischargeTicketDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(DischargeTicket dischargeTicket){
		
		Transaction transaction = session.beginTransaction();
		session.save(dischargeTicket);
		transaction.commit();
	}

	public void update(DischargeTicket dischargeTicket){
		
		Transaction transaction = session.beginTransaction();
		session.merge(dischargeTicket);
		transaction.commit();
	}
	
	
	public void delete(DischargeTicket dischargeTicket){
		session.delete(dischargeTicket);
	}
	
	public DischargeTicket findById(Integer id) {
		DischargeTicket dischargeTicket = (DischargeTicket) session.get(DischargeTicket.class, id);
		return dischargeTicket;
	}
	
	@SuppressWarnings("unchecked")
	public List<DischargeTicket> getList(){
		List<DischargeTicket> list = new ArrayList<DischargeTicket>();
		Query query  = session.createQuery("from DischargeTicket");
		list = query.list();
		return list;
	}
}
