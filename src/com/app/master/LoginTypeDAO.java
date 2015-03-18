package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class LoginTypeDAO{
	
	Session session;
	public LoginTypeDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(LoginType loginType){
		
		Transaction transaction = session.beginTransaction();
		session.save(loginType);
		transaction.commit();
	}
	

	
	public void delete(LoginType loginType){
		Transaction transaction = session.beginTransaction();
		session.delete(loginType);
		transaction.commit();
	}
	
	public LoginType findByCode(String code) {
		LoginType loginType = (LoginType) session.get(LoginType.class, code);
		return loginType;
	}

	public LoginType findById(Integer id) {
		LoginType loginType = (LoginType) session.get(LoginType.class, id);
		return loginType;
	}
	
	@SuppressWarnings("unchecked")
	public List<LoginType> getList(){
		List<LoginType> list = new ArrayList<LoginType>();
		Query query  = session.createQuery("from LoginType");
		list = query.list();
		return list;
	}
}
