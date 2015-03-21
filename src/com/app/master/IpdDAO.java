package com.app.master;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class IpdDAO{
	
	Session session;
	public IpdDAO() {
		session = HibernateUtil.getSession();
	}
	
	public void add(Ipd ipd){
		
		Transaction transaction = session.beginTransaction();
		session.save(ipd);
		transaction.commit();
	}
	
	public void update(Ipd ipd){
		Transaction transaction = session.beginTransaction();
		session.merge(ipd);
		transaction.commit();
	}
	
	public void delete(Ipd ipd){
		session.delete(ipd);
	}
	
	public Ipd findById(Integer id) {
		Ipd ipd = (Ipd) session.get(Ipd.class, id);
		return ipd;
	}
	
	@SuppressWarnings("unchecked")
	public Ipd findByAdmissionId(String admissionId)
	{
		String hql = "from Ipd as model where model.admissionId = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, admissionId);
		List<Ipd> results = query.list();
		if(!results.isEmpty()){
			return results.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Ipd> getListByDate(Date startDate, Date endDate){
		List<Ipd> list = new ArrayList<Ipd>();
		Query query  = session.createQuery("from Ipd as model where model.admissionDate between ? and ?");
		query.setParameter(0, startDate);
		query.setParameter(1, endDate);
		list = query.list();
		return list;
	}
	

	
	@SuppressWarnings("unchecked")
	public List<Ipd> getList(){
		List<Ipd> list = new ArrayList<Ipd>();
		Query query  = session.createQuery("from Ipd");
		list = query.list();
		return list;
	}
}
