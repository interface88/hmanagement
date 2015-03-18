package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class DepartmentDAO{
	
	Session session;
	public DepartmentDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Department department){
		
		Transaction transaction = session.beginTransaction();
		session.save(department);
		transaction.commit();
	}
	
	public void delete(Department department){
		Transaction transaction = session.beginTransaction();
		session.delete(department);
		transaction.commit();
	}
	
	public Department findById(Integer id) {
		Department department = (Department) session.get(Department.class, id);
		return department;
}
	
	@SuppressWarnings("unchecked")
	public List<Department> getList(){
		List<Department> list = new ArrayList<Department>();
		Query query  = session.createQuery("from Department");
		list = query.list();
		return list;
	}
}
