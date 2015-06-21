/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package ru.app.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

/**
 *
 * @author rinat
 */

public class HibernateUtil {

private static final SessionFactory sessionFactory;

static {
	try {
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
            
            //SchemaExport schema = new SchemaExport(configuration);
            //schema.create(true, true);
            
            StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
            sessionFactory = configuration.buildSessionFactory(builder.build());
	} catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
	}
}

public static Session openSession() {
	 return sessionFactory.openSession();
}
}
