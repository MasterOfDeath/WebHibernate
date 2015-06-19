/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package ru.app.service;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.app.orm.Prod;
import ru.app.util.HibernateUtil;

/**
 *
 * @author rinat
 */
public class DbService {
    
    private final String paramName;
    private final String paramCat;
    private final String paramStart;
    private final String paramEnd;
    

    public DbService() {
        this.paramName = "";
        this.paramCat = "";
        this.paramStart = "";
        this.paramEnd = "100000000";
    }
    
    
    
    public List<Prod> getAll(){
        List<Prod> list = new ArrayList<Prod>();
        
        Session session = HibernateUtil.openSession();
        Transaction tx = null;	
        try {
                tx = session.getTransaction();
                tx.begin();
                list = session.createQuery(
                        "SELECT prod " +
                        "FROM Prod as prod, Cat as cat " +
                        "WHERE prod.cat = cat and (prod.name LIKE :name and cat.catName LIKE :cat and prod.price BETWEEN :start and :end) " +
                        "ORDER BY cat.catName, prod.name")
                        .setParameter("name", paramName + "%")
                        .setParameter("cat", paramCat + "%")
                        .setParameter("start", paramStart)
                        .setParameter("end", paramEnd)
                        .list();
                tx.commit();
        } catch (Exception e) {
                if (tx != null) {
                        tx.rollback();
                }
                e.printStackTrace();
        }
        
        return list;
    }
}
