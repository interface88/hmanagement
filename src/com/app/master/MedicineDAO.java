package com.app.master;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.framework.HibernateUtil;


public class MedicineDAO {

	Session session;

	public MedicineDAO() {
		session = HibernateUtil.getSession();
	}

	public void add(Medicine medicine) {

		Transaction transaction = session.beginTransaction();
		session.save(medicine);
		transaction.commit();
	}

	public void delete(Medicine medicine) {
		Transaction transaction = session.beginTransaction();
		session.delete(medicine);
		transaction.commit();
	}

	public Medicine findByCode(String code) {
		Medicine medicine = (Medicine) session.get(Medicine.class, code);
		return medicine;
	}

	public Medicine findById(Integer id) {
		Medicine medicine = (Medicine) session.get(Medicine.class, id);
		return medicine;
	}

	@SuppressWarnings("unchecked")
	public List<Medicine> getList() {
		List<Medicine> list = new ArrayList<Medicine>();
		Query query = session.createQuery("from Medicine");
		list = query.list();
		return list;
	}
}
