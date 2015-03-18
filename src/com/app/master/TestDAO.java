package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class TestDAO{
	
	Session session;
	public TestDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Test test){
		
		Transaction transaction = session.beginTransaction();
		session.save(test);
		transaction.commit();
	}
	

	
	public void delete(Test test){
		Transaction transaction = session.beginTransaction();
		session.delete(test);
		transaction.commit();
	}
	
	public Test findByCode(String code) {
		Test test = (Test) session.get(Test.class, code);
		return test;
	}

	public Test findById(Integer id) {
		Test test = (Test) session.get(Test.class, id);
		return test;
	}
	
	@SuppressWarnings("unchecked")
	public List<Test> findByTestType(String testType){
		List<Test> list = new ArrayList<Test>();
		Query query  = session.createQuery("from Test as model where model.testType = ? ");
		query.setParameter(0, testType);
		list = query.list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Test> getUniqueTestTypeList(){
		List<Test> list = new ArrayList<Test>();
		Query query  = session.createQuery("from Test");
		list = query.list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Test> getList(){
		List<Test> list = new ArrayList<Test>();
		Query query  = session.createQuery("from Test");
		list = query.list();
		return list;
	}
}
