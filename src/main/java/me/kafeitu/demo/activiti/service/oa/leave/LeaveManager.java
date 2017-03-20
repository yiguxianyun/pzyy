package me.kafeitu.demo.activiti.service.oa.leave;

import me.kafeitu.demo.activiti.dao.LeaveDao;
import me.kafeitu.demo.activiti.entity.oa.Leave;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 请假实体管理
 *
 * @author yk
 */
@Service
@Transactional
public class LeaveManager {

    @Autowired
    LeaveDao leaveDao;

    public void saveLeave(Leave entity) {
    	if (entity.getId() == null) {
            entity.setApplyTime(new Date());
        }
        leaveDao.save(entity);
    }

    public void deleteLeave(Long id) {
        leaveDao.delete(id);
    }

    @Transactional(readOnly = true)
    public Leave getLeave(Long id) {
        return leaveDao.get(id);
    }

}

