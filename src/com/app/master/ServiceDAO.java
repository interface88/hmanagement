package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class ServiceDAO{
	
	Session session;
	public ServiceDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Service service){
		
		Transaction transaction = session.beginTransaction();
		session.save(service);
		transaction.commit();
	}

	public void update(Service service){
		
		Transaction transaction = session.beginTransaction();
		session.merge(service);
		transaction.commit();
	}
	
	
	public void delete(Service service){
		session.delete(service);
	}
	
	public Service findByCode(String code) {
		Service service = (Service) session.get(Service.class, code);
		return service;
	}

	public Service findById(Integer id) {
		Service service = (Service) session.get(Service.class, id);
		return service;
	}
	
	@SuppressWarnings("unchecked")
	public List<Service> getList(){
		List<Service> list = new ArrayList<Service>();
		Query query  = session.createQuery("from Service");
		list = query.list();
		return list;
	}
}
