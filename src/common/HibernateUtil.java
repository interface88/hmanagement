package common;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import org.hibernate.Session;


public class HibernateUtil {
	private final static HibernateUtil instance = new HibernateUtil();
	private final SessionFactory factory;

	private HibernateUtil() {
		Configuration configuration = new Configuration();
		configuration.configure();
		
		factory = configuration.buildSessionFactory();
	}

	public static Session getSession() {
		return getInstance().factory.openSession();
	}

	private static HibernateUtil getInstance() {
		return instance;
	}

}
