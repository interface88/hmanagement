package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class StaffDAO{
	
	Session session;
	public StaffDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Staff staff){
		
		Transaction transaction = session.beginTransaction();
		session.save(staff);
		transaction.commit();
	}
	
	public void update(Staff staff){
		
		Transaction transaction = session.beginTransaction();
		session.merge(staff);
		transaction.commit();
	}
	
	public void delete(Staff staff){
		Transaction transaction = session.beginTransaction();
		session.delete(staff);
		transaction.commit();
	}
	
	public Staff findById(Integer id) {
		Staff book = (Staff) session.get(Staff.class, id);
		return book;
   }
	
	public Staff findByUserIdAndPassword(String userId, String password){
		String hql = "from "+ Staff.class.getCanonicalName() +" as model where model.userId = ? AND model.password = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userId);
		query.setParameter(1, password);
		List<Staff> results = query.list();
		
		if(!results.isEmpty()){
			return results.get(0);
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Staff> getList(){
		List<Staff> list = new ArrayList<Staff>();
		Query query  = session.createQuery("from Staff");
		list = query.list();
		return list;
	}
}
