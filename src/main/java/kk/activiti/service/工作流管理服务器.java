package kk.activiti.service;

import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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
import org.jeecgframework.web.cgform.service.autolist.CgTableServiceI;
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
public class 工作流管理服务器{
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
	private CgTableServiceI cgTableService;
	@Autowired
	private 通用控制器 通用控制器;

	public void deleteProcessInstance(String id,String 原因,String 表单名称,String 表单编号) throws BusinessException {
		runtimeService.deleteProcessInstance(id, 原因);
		String id2=通用控制器.查表单id(表单名称, 表单编号);
		cgTableService.delete(表单名称, id2);

	}


}





