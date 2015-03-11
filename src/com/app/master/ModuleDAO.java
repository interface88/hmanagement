package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class ModuleDAO{
	
	Session session;
	public ModuleDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Module module){
		
		Transaction transaction = session.beginTransaction();
		session.save(module);
		transaction.commit();
	}
	

	
	public void delete(Module module){
		Transaction transaction = session.beginTransaction();
		session.delete(module);
		transaction.commit();
	}
	
	public Module findByCode(String code) {
		Module module = (Module) session.get(Module.class, code);
		return module;
	}

	public Module findById(Integer id) {
		Module module = (Module) session.get(Module.class, id);
		return module;
	}
	
	@SuppressWarnings("unchecked")
	public List<Module> getList(){
		List<Module> list = new ArrayList<Module>();
		Query query  = session.createQuery("from Module");
		list = query.list();
		return list;
	}
}
