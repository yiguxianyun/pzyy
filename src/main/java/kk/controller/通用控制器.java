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

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.enums.SysThemesEnum;
import org.jeecgframework.core.util.ApplicationContextUtil;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.JeecgDataAutorUtils;
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
@RequestMapping("/通用")
public class 通用控制器 extends BaseController {
	private static final Logger logger = Logger.getLogger(通用控制器.class);
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
	
	@RequestMapping(params = "查用户")
	@ResponseBody
	public String 查用户(String 对象, HttpServletRequest request){
		HttpSession session = ContextHolderUtils.getSession();
		Client client = ClientManager.getInstance().getClient(session.getId());
		String data="";
		if(client == null){ 
			client = ClientManager.getInstance().getClient(request.getParameter("sessionId"));
		}
		if (client != null && client.getUser()!=null ) {
			if (对象.equals("角色")) {
				data=client.getUser().getUserKey();
			}else if(对象.equals("实名")) {
				data=client.getUser().getRealName();
			}else if(对象.equals("部门编号")) {
				data=client.getUser().getCurrentDepart().getOrgCode();
			}else if(对象.equals("部门id")) {
//				Object a=client.getUser().getCurrentDepart();
				data=client.getUser().getCurrentDepart().getId();
			}else if(对象.equals("username")) {
				data=client.getUser().getUserName();
			}	
		}
		return data;
	}
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "查技术支持")
	@ResponseBody
	public List 查技术支持(HttpServletRequest request){
		List data = new ArrayList();
		String 部门id="'"+查用户("部门id",request)+"'";
		String 技术支持 ="'"+"技术支持"+"'";
		String sqlBDS="SELECT	t_s_base_user.realname,	t_s_base_user.username FROM t_s_base_user "+
						"INNER JOIN t_s_user_org ON t_s_user_org.user_id = t_s_base_user.ID"+
							" WHERE t_s_user_org.org_id = {0} AND t_s_base_user.userkey = {1}";
		data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,部门id,技术支持));
		return data;
	}
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "查表单id")
	@ResponseBody
	public String 查表单id(String 表单名称,String 表单编号) {
		String 表单编号2="'"+表单编号+"'";
		String sql="SELECT * FROM {0} WHERE 数据表编号 = {1}";		
		Map map=jdbcTemplate.queryForMap(MessageFormat.format(sql,表单名称,表单编号2));
		String id=(String) map.get("id");
		return id;
	}
	@SuppressWarnings({ "rawtypes"})
	@ResponseBody
	public Map 查表单(String 表单名称,String 表单编号) {
		String sql="SELECT * FROM "+表单名称+" WHERE 数据表编号 = '"+表单编号+"'";	
		Map map = new HashMap();
		try {
			map=jdbcTemplate.queryForMap(sql);
		}catch (Exception e) {
		}
//		String id=(String) map.get("id");
		return map;
	}
	public String 查任务id(String 表名,String 编号) {
		String 编号2="'"+编号+"'";
		String sql="SELECT * FROM {0} WHERE 流程id = {1}";		
		Map map=jdbcTemplate.queryForMap(MessageFormat.format(sql,表名,编号2));
		String id=(String) map.get("id");
		return id;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	@RequestMapping(params = "查流程")
	@ResponseBody
	public Map 查流程(String 流程id,HttpServletRequest request){
		Map data = new HashMap();
		流程id="'"+流程id+"'";
		String sql="SELECT * FROM {0} WHERE 流程id = {1}";
		try {
			data=jdbcTemplate.queryForMap(MessageFormat.format(sql,"待办任务视图",流程id));
		}catch (Exception e) {
		}
		String username=查用户("username",request);
		data.put("username", username);
		return data;
	}
	public String 查流程id(String configId,String id,HttpServletRequest request){
		String sql="SELECT 流程id FROM "+configId+" WHERE id = '"+id+"'";
		return jdbcTemplate.queryForObject(sql, String.class);
		
	}
	public void 过滤待办任务(HttpServletRequest request,String username){
		String 过滤sql="and 办理人 = '"+username+"' OR (办理人 IS NULL AND (USER_ID_ = '"+username+"'"+
			"OR GROUP_ID_ IN ( SELECT g.GROUP_ID_ FROM ACT_ID_MEMBERSHIP g WHERE g.USER_ID_ = '"+username+"' ) ) )";			
		JeecgDataAutorUtils.installDataSearchConditon(request, 过滤sql);
	}
	@RequestMapping(params = "查询待办任务数量")
	@ResponseBody	
	public String 查询待办任务数量(HttpServletRequest request){
		String username=查用户("username",request);
		String sql="SELECT Count(*) FROM 待办任务视图 WHERE 办理人 = '"+username+"' OR (办理人 IS NULL AND (USER_ID_ = '"+username+"'"+
			"OR GROUP_ID_ IN ( SELECT g.GROUP_ID_ FROM ACT_ID_MEMBERSHIP g WHERE g.USER_ID_ = '"+username+"' ) ) )";			
		return jdbcTemplate.queryForObject(sql, String.class);
		}
	public void 过滤已结束流程(HttpServletRequest request,String username){
		String 过滤sql="and END_ACT_ID_ IS NOT NULL";			
		JeecgDataAutorUtils.installDataSearchConditon(request, 过滤sql);
	}
	@SuppressWarnings({ "rawtypes", })
	public void 过滤本人或部门(HttpServletRequest request,List<Map<String, Object>> result,String username,String 角色){
		Iterator<Map<String, Object>> it = result.iterator();
		while(it.hasNext()){
			Map m = it.next();
			String 表单名称=(String)m.get("表单名称");
			String 表单编号 =String.valueOf(m.get("表单编号"));
			Map 表单=查表单(表单名称,表单编号);
			if (角色.equals("业务员")){
				String create_by=(String) 表单.get("create_by");
				if (!username.equals(create_by)){
					it.remove();
				}
			}else if (角色.equals("技术支持")){
				String 部门编号=查用户("部门编号",request);
				String sys_org_code=(String) 表单.get("sys_org_code");
				if (!部门编号.equals(sys_org_code)){
					it.remove();
				}
			}		
		}
	}
	@RequestMapping(params = "查测试报告路径")
	@ResponseBody	
	public String 查测试报告路径(HttpServletRequest request){
		String 泵型号=request.getParameter("泵型号");
		String sql="SELECT 路径 FROM nsc型号对应路径 WHERE 标准型号 = '"+泵型号+"'";			
		return jdbcTemplate.queryForObject(sql, String.class);
		}	
	
	
}
















