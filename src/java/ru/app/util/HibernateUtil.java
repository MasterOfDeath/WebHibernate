/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package ru.app.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 *
 * @author rinat
 */

public class HibernateUtil {

private static final SessionFactory sessionFactory;

static {
	 try {
		 sessionFactory = new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();
	 } catch (Throwable ex) {
		 System.err.println("Initial SessionFactory creation failed." + ex);
		 throw new ExceptionInInitializerError(ex);
	 }
}

public static Session openSession() {
	 return sessionFactory.openSession();
}
}
