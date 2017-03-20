package kk.activiti.service;

import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import kk.controller.通用控制器;
import kk.util.其他工具;
import kk.util.数据库服务器工具;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.lang.StringUtils;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.constant.DataBaseConstant;
import org.jeecgframework.core.util.ApplicationContextUtil;
import org.jeecgframework.core.util.DBTypeUtil;
import org.jeecgframework.core.util.DateUtils;
import org.jeecgframework.core.util.MyClassLoader;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.UUIDGenerator;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.web.cgform.common.CgAutoListConstant;
import org.jeecgframework.web.cgform.common.CommUtils;
import org.jeecgframework.web.cgform.enhance.CgformEnhanceJavaInter;
import org.jeecgframework.web.cgform.entity.button.CgformButtonSqlEntity;
import org.jeecgframework.web.cgform.entity.config.CgFormFieldEntity;
import org.jeecgframework.web.cgform.entity.config.CgFormHeadEntity;
import org.jeecgframework.web.cgform.entity.enhance.CgformEnhanceJavaEntity;
import org.jeecgframework.web.cgform.exception.BusinessException;
import org.jeecgframework.web.cgform.service.build.DataBaseService;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.jdbc.support.incrementer.OracleSequenceMaxValueIncrementer;
import org.springframework.jdbc.support.incrementer.PostgreSQLSequenceMaxValueIncrementer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 */
@Service
//--author：luobaoli---------date:20150616--------for: 修改spring事务回滚异常设置，以便支持BusinessException
@Transactional(rollbackFor=Exception.class)
//--author：luobaoli---------date:20150616--------for: 修改spring事务回滚异常设置，以便支持BusinessException
public class 工作流表单服务器{
    private Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;
	@Autowired
	private AbstractRoutingDataSource dataSource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	@Qualifier("数据库服务器")
	private DataBaseService 数据库服务器;
	@Autowired
	private 数据库服务器工具 数据库服务器工具;	
    @Autowired
    private IdentityService identityService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    protected TaskService taskService;
    @Autowired
    protected HistoryService historyService;
    @Autowired
    protected RepositoryService repositoryService;  
	@Autowired
	private 通用控制器 通用控制器;

	public Map<String, Object> 启动流程(Map<String, List<Map<String, Object>>> mapMore, String mainTableName) throws BusinessException {
		//插入业务表信息
		Map<String, Object> mainMap=mapMore.get(mainTableName).get(0);
		String id=mainMap.get("id").toString();
		if(StringUtils.isEmpty(id)){
			mainMap = 数据库服务器.insertTableMore(mapMore, mainTableName);
		}else{
			数据库服务器.updateTableMore(mapMore, mainTableName);
		}		
        logger.debug("save 表: {}", mainTableName);		
        String businessKey = mainMap.get("数据表编号").toString();
        ProcessInstance processInstance = null;
        try {
            // 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
        	String uerId = mainMap.get("create_by").toString();
            identityService.setAuthenticatedUserId(uerId);
            Map<String, Object> 工作流表单=其他工具.提取工作流表单(mainMap);
            processInstance = runtimeService.startProcessInstanceByKey("xunjia", businessKey, 工作流表单);
            String processInstanceId = processInstance.getId();  
            
//    		String sql="update ? set ? = ? where(id = ?)";
//    		Object[] obj =new Object[]{mainTableName,"流程id",processInstanceId,mainMap.get("id").toString()};
//    		jdbcTemplate.update(sql,obj);
            String id加引号="'"+mainMap.get("id").toString()+"'";
    		String sql="update {0} set {1} = {2} where(id = {3})";
    		jdbcTemplate.execute(MessageFormat.format(sql,mainTableName,"流程id",processInstanceId,id加引号));
    		mainMap.put("流程id",processInstanceId);            
            logger.debug("start process of {key={}, bkey={}, pid={}, variables={}}", new Object[]{"leave", businessKey, processInstanceId, 工作流表单});
        } finally {
            identityService.setAuthenticatedUserId(null);
        }		
		return mainMap;
	}
	
	public void 选型提交(Map<String, List<Map<String, Object>>> mapMore, String mainTableName) throws BusinessException {
		Map<String, Object> mainMap=mapMore.get(mainTableName).get(0);
		
		数据库服务器.updateTableMore(mapMore, mainTableName);	

    	String processInstanceId = mainMap.get("流程id").toString();
        String taskId=通用控制器.查任务id("待办任务视图", processInstanceId);
        
        Map<String, Object> variables = new HashMap<String, Object>();
        variables.put("流转","提交");
        taskService.complete(taskId, variables);

	}
	
	public void 销售确认(String 流程id) throws BusinessException {		
        Map<String, Object> variables = new HashMap<String, Object>();
        variables.put("流转","提交");        
        String taskId=通用控制器.查任务id("待办任务视图", 流程id);
        taskService.complete(taskId, variables);
	}
	public void 驳回(String 流程id) throws BusinessException {		
        Map<String, Object> variables = new HashMap<String, Object>();
        variables.put("流转","驳回");        
        String taskId=通用控制器.查任务id("待办任务视图", 流程id);
        taskService.complete(taskId, variables);
	}


}











