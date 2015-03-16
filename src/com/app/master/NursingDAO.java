package com.app.master;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateUtil;

public class NursingDAO{
	
	Session session;
	public NursingDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Nursing nursing){
		
		Transaction transaction = session.beginTransaction();
		session.save(nursing);
		transaction.commit();
	}
	
	public void delete(Nursing nursing){
		session.delete(nursing);
	}
	
	public Nursing findById(Integer id) {
		Nursing nursing = (Nursing) session.get(Nursing.class, id);
		return nursing;
	}
	
	@SuppressWarnings("unchecked")
	public List<Nursing> findListByAdmissionId(String admissionId)
	{
		String hql = "from Nursing as model where model.admissionId = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, admissionId);
		List<Nursing> results = query.list();
		return results;
	}
	
	@SuppressWarnings("unchecked")
	public Nursing findByAdmissionIdAndCurrentDate(String admissionId){
		Date currentDate = null ;
		Query query  = session.createQuery("from Nursing as model where model.admissionId = ? and model.nursingDate = ? ");
		query.setParameter(0, admissionId);
		query.setParameter(1, currentDate);
		List<Nursing> list = query.list();
		if(!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Nursing> getList(){
		List<Nursing> list = new ArrayList<Nursing>();
		Query query  = session.createQuery("from Nursing");
		list = query.list();
		return list;
	}
}
