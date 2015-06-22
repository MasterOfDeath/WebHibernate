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
    
    private String paramCat;
    private String paramName;
    private String paramStart;
    private String paramEnd;
    

    public DbService() {
        this.paramCat = "";
        this.paramName = "";
        this.paramStart = "";
        this.paramEnd = "100000000";
    }
    
        
    public List<Prod> getFiltered(){
        List<Prod> list = new ArrayList<Prod>();
                
        Session session = HibernateUtil.openSession();
        Transaction tx = null;	
        try {
                tx = session.getTransaction();
                tx.begin();
                list = (ArrayList<Prod>)session.createQuery(
                        "SELECT prod " +
                        "FROM Prod as prod, Cat as cat " +
                        "WHERE prod.cat = cat and (prod.name LIKE :name and cat.catName LIKE :cat and prod.price BETWEEN :start and :end) " +
                        "ORDER BY cat.catName, prod.name")
                        .setParameter("cat", paramCat + "%")
                        .setParameter("name", paramName + "%")
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
    
    public void setFilterParams(String paramCat, String paramName,
            String paramStart, String paramEnd) {
        this.paramCat = paramCat;
        this.paramName = paramName;
        this.paramStart = paramStart;
        this.paramEnd = paramEnd;
    }
}
