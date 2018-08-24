/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import org.hibernate.Query;
import org.hibernate.Session;
import util.NewHibernateUtil;

/**
 *
 * @author admin
 */
public class ProductDao {

    public List<Product> findAll() {
        Session session = session = NewHibernateUtil.getSessionAndBeginTransaction();
        try {
            Query query = session.createQuery("SELECT p FROM Product p");
            return query.list();
        } catch (Exception e) {
            NewHibernateUtil.rollBackSessions(session);
        } finally {
            try {
                NewHibernateUtil.commitCurrentSessions();
            } catch (Exception ex) {
                Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    NewHibernateUtil.closeCurrentSessions();
                } catch (Exception ex) {
                    Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public boolean insert(Product p) {
        Session session = session = NewHibernateUtil.getSessionAndBeginTransaction();
        try {
            Product p1 = new Product();
            p1.setId(p.getId());
            p1.setName(p.getName());
            p1.setPrice(p.getPrice());
            p1.setQuantity(p.getQuantity());
            session.persist(p1);
            return true;
        } catch (Exception e) {
            NewHibernateUtil.rollBackSessions(session);
        } finally {
            try {
                NewHibernateUtil.commitCurrentSessions();
            } catch (Exception ex) {
                Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    NewHibernateUtil.closeCurrentSessions();
                } catch (Exception ex) {
                    Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }

    public boolean update(String id, int quantity) {
        Session session = session = NewHibernateUtil.getSessionAndBeginTransaction();
        try {
            String hql = "UPDATE Product SET quantity = :quantity WHERE id = :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            query.setParameter("quantity", quantity);
            query.executeUpdate();
            return true;
        } catch (Exception e) {
            NewHibernateUtil.rollBackSessions(session);
        } finally {
            try {
                NewHibernateUtil.commitCurrentSessions();
            } catch (Exception ex) {
                Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    NewHibernateUtil.closeCurrentSessions();
                } catch (Exception ex) {
                    Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }
}
