package kk.controller;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.enums.SysThemesEnum;
import org.jeecgframework.core.util.ApplicationContextUtil;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.SysThemesUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.web.cgform.common.CgAutoListConstant;
import org.jeecgframework.web.cgform.common.CommUtils;
import org.jeecgframework.web.cgform.controller.autolist.CgAutoListController;
import org.jeecgframework.web.cgform.engine.FreemarkerHelper;
import org.jeecgframework.web.cgform.engine.TempletContext;
import org.jeecgframework.web.cgform.entity.config.CgFormHeadEntity;
import org.jeecgframework.web.cgform.entity.template.CgformTemplateEntity;
import org.jeecgframework.web.cgform.entity.upload.CgUploadEntity;
import org.jeecgframework.web.cgform.exception.BusinessException;
import org.jeecgframework.web.cgform.service.build.DataBaseService;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import org.jeecgframework.web.cgform.service.template.CgformTemplateServiceI;
import org.jeecgframework.web.cgform.util.TemplateUtil;
import org.jeecgframework.web.system.manager.ClientManager;
import org.jeecgframework.web.system.pojo.base.Client;
import org.jeecgframework.web.system.pojo.base.TSOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import freemarker.template.Template;
import freemarker.template.TemplateException;

@Controller
@RequestMapping("/自动完成")
public class 自动完成控制器 extends BaseController {
	private static final Logger logger = Logger.getLogger(自动完成控制器.class);
	@Autowired
	private TempletContext templetContext;
	@Autowired
	private DataBaseService dataBaseService;
	@Autowired
	private CgformTemplateServiceI cgformTemplateService;
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;
	@Autowired
	@Qualifier("jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
//	autocomplete查询电机	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "chaxunDJ")
	@ResponseBody
	public List chaxunDJCJ(HttpServletRequest request) throws Exception{
		List data = new ArrayList();
		String term ="'%"+request.getParameter("term")+"%'";		
		String 动作=request.getParameter("动作");
		
		String 厂家 ="'%"+request.getParameter("厂家")+"%'";	
		String 功率 ="'%"+request.getParameter("功率")+"%'";	
		String ip ="'%"+request.getParameter("ip")+"%'";
		String 电压 ="'%"+request.getParameter("电压")+"%'";
		String 频率 ="'%"+request.getParameter("频率")+"%'";
		String 型号 ="'%"+request.getParameter("型号")+"%'";
		String 系列 ="'%"+request.getParameter("系列")+"%'";
		
		String sqlBDS="SELECT DISTINCT {0} FROM 电机价格表 where {1} LIKE {2} and 厂家 LIKE {3} and 功率 LIKE {4} and ip LIKE {5} and 电压 LIKE {6} and 频率 LIKE {7} and 型号 LIKE {8} and 系列 LIKE {9}";
		
		if(动作.equals("查厂家")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"厂家","厂家",term,厂家,功率,ip,电压,频率,型号,系列));
		}else if(动作.equals("查功率")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"功率","功率",term,厂家,功率,ip,电压,频率,型号,系列));
		}else if(动作.equals("查ip")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"ip","ip",term,厂家,功率,ip,电压,频率,型号,系列));
		}else if(动作.equals("查电压")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"电压","电压",term,厂家,功率,ip,电压,频率,型号,系列));
		}else if(动作.equals("查频率")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"频率","频率",term,厂家,功率,ip,电压,频率,型号,系列));
		}else if(动作.equals("查型号")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"型号","型号",term,厂家,功率,ip,电压,频率,型号,系列));
		}else if(动作.equals("查系列")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"系列","系列",term,厂家,功率,ip,电压,频率,型号,系列));
		}
		return data;
	}	
//	autocomplete查询材质	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "chaxunCZ")
	@ResponseBody
	public List chaxunCZ(HttpServletRequest request) throws Exception{
		List data = new ArrayList();
		String term ="'%"+request.getParameter("term")+"%'";		
		String id="'"+request.getParameter("id")+"'";		
		String sqlBDS="SELECT DISTINCT 材质 FROM 常用材质 where 材质 LIKE {0} and 部件 = {1}";
		data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,term,id));
		return data;
	}			
//	长轴泵autocomplete查询	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "chaxunCZB")
	@ResponseBody
	public List chaxunCZB(HttpServletRequest request) throws Exception{
		List data = new ArrayList();
		String term =request.getParameter("term");		
		term="'%"+term+"%'";
		String sqlBDS="SELECT DISTINCT {0} FROM 长轴泵价格 where {1} LIKE {2}";
		data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"泵型号","泵型号",term));
		return data;
	}	
//	中开泵autocomplete查询	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "chaxunNSC")
	@ResponseBody
	public List chaxunNSC(HttpServletRequest request) throws Exception{
		List data = new ArrayList();
		String term =request.getParameter("term");		
		term="'%"+term+"%'";
		String sqlBDS="SELECT DISTINCT {0} FROM nsc_bxn where {1} LIKE {2}";
		data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"泵型号","泵型号",term));
		return data;
	}	
//	单字段查询	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "单字段")
	@ResponseBody
	public List 单字段(HttpServletRequest request,String 表名,String 字段) throws Exception{
		List data = new ArrayList();
		String term =request.getParameter("term");		
		term="'%"+term+"%'";
		String sqlBDS="SELECT DISTINCT {0} FROM {1} where {2} LIKE {3}";
		data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,字段,表名,字段,term));
		return data;
	}
	
	
}
















