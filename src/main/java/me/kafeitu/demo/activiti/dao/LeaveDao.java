package me.kafeitu.demo.activiti.dao;

import me.kafeitu.demo.activiti.entity.oa.Leave;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 请假实体管理接口
 *
 * @author yk
 */
@Repository
public class LeaveDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void save(Leave entity) {
        getSession().saveOrUpdate(entity);
    }

    public void delete(Long id) {
        getSession().delete(get(id));
    }

    public Leave get(Long id) {
        return (Leave) getSession().get(Leave.class, id);
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

}
