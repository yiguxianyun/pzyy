package kk.controller;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import kk.util.列表控制器工具;
import kk.util.表单控制器工具;
/**
 * @ClassName: formBuildController
 * @Description: 读取模板生成填报表单（添加、修改）-执行表单数据添加和修改操作
 * @author 周俊峰
 */
//@Scope("prototype")
@Controller
@RequestMapping("/表单")
public class 表单控制器 extends BaseController {
	private static final Logger logger = Logger.getLogger(表单控制器.class);
	@Autowired
	private TempletContext templetContext;
	@Autowired
	@Qualifier("数据库服务器")
	private DataBaseService 数据库服务器;
	@Autowired
	private CgformTemplateServiceI cgformTemplateService;
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;	
	@Autowired
	private 列表控制器工具 列表控制器工具;	
	@Autowired
	private 表单控制器工具 表单控制器工具;	
//	@Autowired
//	private CgformNscQT cgformNscQT;

	@RequestMapping(params = "goAddFtlForm")
	public void goAddFtlForm(HttpServletRequest request,HttpServletResponse response) {
		 ftlForm(request,response);
	}
	@RequestMapping(params = "goUpdateFtlForm")
	public void goUpdateFtlForm(HttpServletRequest request,HttpServletResponse response) {
		 ftlForm(request,response);
	}
	@RequestMapping(params = "goDatilFtlForm")
	public void goDatilFtlForm(HttpServletRequest request,HttpServletResponse response) {
		 ftlForm(request,response);
	}
	
	//add-start--Author:scott Date:20160301 for：online表单移动样式单独配置
	/**
	 * Online表单移动端，访问页面
	 */
	@RequestMapping(params = "mobileForm")
	public void mobileForm(HttpServletRequest request,HttpServletResponse response) {
		String tableName =request.getParameter("tableName");
		String sql = "select form_template_mobile from cgform_head where table_name = '"+tableName+"'";
		Map<String, Object> mp = cgFormFieldService.findOneForJdbc(sql);
		if(mp.containsKey("form_template_mobile") && oConvertUtils.isNotEmpty(mp.get("form_template_mobile"))){
			String urlTemplateName=request.getParameter("olstylecode");
			if(oConvertUtils.isEmpty(urlTemplateName)){
				request.setAttribute("olstylecode", mp.get("form_template_mobile").toString().trim());
			}
		}
		ftlForm(request,response);
	}
	//add-end--Author:scott Date:20160301 for：online表单移动样式单独配置
	
	/**
	 * form表单页面跳转
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "ftlForm")
	public void ftlForm(HttpServletRequest request,HttpServletResponse response) {
		try {
			long start = System.currentTimeMillis();
			String tableName =request.getParameter("tableName");
	        Map<String, Object> data = new HashMap<String, Object>();
	        String id = request.getParameter("id");
			String mode=request.getParameter("mode");
			String templateName=tableName+"_";
			TemplateUtil.TemplateType templateType=TemplateUtil.TemplateType.LIST;
			if(StringUtils.isBlank(id)){
				templateName+=TemplateUtil.TemplateType.ADD.getName();
				templateType=TemplateUtil.TemplateType.ADD;
			}else if("read".equals(mode)){
				templateName+=TemplateUtil.TemplateType.DETAIL.getName();
				templateType=TemplateUtil.TemplateType.DETAIL;
			}else{
				templateName+=TemplateUtil.TemplateType.UPDATE.getName();
				templateType=TemplateUtil.TemplateType.UPDATE;
			}
			//获取版本号
	        String version = cgFormFieldService.getCgFormVersionByTableName(tableName);
	        //装载表单配置
	    	Map configData = cgFormFieldService.getFtlFormConfig(tableName,version);
	    	data = new HashMap(configData);
	    	//如果该表是主表查出关联的附表
	    	CgFormHeadEntity head = (CgFormHeadEntity)data.get("head");
	        Map<String, Object> dataForm = new HashMap<String, Object>();
	        if(StringUtils.isNotEmpty(id)){
	        	dataForm = 数据库服务器.findOneForJdbc(tableName, id);
	        }
	        @SuppressWarnings("rawtypes")
			Iterator it=dataForm.entrySet().iterator();
		    while(it.hasNext()){
		    	@SuppressWarnings("rawtypes")
				Map.Entry entry=(Map.Entry)it.next();
		        String ok=(String)entry.getKey();
		        Object ov=entry.getValue();
		        data.put(ok, ov);
		    }
	        Map<String, Object> tableData  = new HashMap<String, Object>();
	        //获取主表或单表表单数据
	        tableData.put(tableName, dataForm);
	        //获取附表表表单数据
	    	if(StringUtils.isNotEmpty(id)){
		    	if(head.getJformType()==CgAutoListConstant.JFORM_TYPE_MAIN_TALBE){
			    	String subTableStr = head.getSubTableStr();
			    	if(StringUtils.isNotEmpty(subTableStr)){
			    		 String [] subTables = subTableStr.split(",");
			    		 List<Map<String,Object>> subTableData = new ArrayList<Map<String,Object>>();
			    		 for(String subTable:subTables){
				    			subTableData = cgFormFieldService.getSubTableData(tableName,subTable,id);
				    			tableData.put(subTable, subTableData);
			    		 }
			    	}
		    	}
	    	}
	    	//装载单表/(主表和附表)表单数据
	    	data.put("data", tableData);
	    	data.put("id", id);
	    	data.put("head", head);
	    	列表控制器工具.loadAuth(data, request);
	    	//页面样式js引用
	    	data.put(CgAutoListConstant.CONFIG_IFRAME, 表单控制器工具.getHtmlHead(request));
	    	//装载附件信息数据
			String content =null;			
			data.put("req", request);
//			data.put("Session", request.getSession());
//			data.put("JspTaglibs", new TaglibFactory(request.getSession()
//			.getServletContext()));
			response.setContentType("text/html;charset=utf-8");
			String urlTemplateName = request.getParameter("olstylecode");
			if(oConvertUtils.isEmpty(urlTemplateName)){
				urlTemplateName = (String) request.getAttribute("olstylecode");
			}
			if(StringUtils.isNotBlank(urlTemplateName)){
				data.put("this_olstylecode",urlTemplateName);
				LogUtil.debug("-------------urlTemplateName-----------"+urlTemplateName);
				content=表单控制器工具.getUrlTemplate(urlTemplateName,templateType,data);
			}else{
				data.put("this_olstylecode",head.getFormTemplate());
				String kk=head.getFormTemplate();
				LogUtil.debug("-------------formTemplate-----------"+head.getFormTemplate());
				content=表单控制器工具.getTableTemplate(templateName,request,data);
			}
			response.getWriter().print(content);
			response.getWriter().flush();
			long end = System.currentTimeMillis();
			logger.debug("自定义表单生成耗时："+(end-start)+" ms");
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 保存或更新
	 * 
	 * @param jeecgDemo
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "saveOrUpdate")
	@ResponseBody
	public AjaxJson saveOrUpdate(HttpServletRequest request) throws Exception{
		String message = null;
		AjaxJson j = new AjaxJson();
		Map data = request.getParameterMap();
		if(data!=null){
			data = CommUtils.mapConvert(data);
			String tableName = (String)data.get("tableName");
			String id = (String)data.get("id");
			//打印测试
		    Iterator it=data.entrySet().iterator();
		    while(it.hasNext()){
		    	Map.Entry entry=(Map.Entry)it.next();
		        Object ok=entry.getKey();
		        Object ov=entry.getValue()==null?"":entry.getValue();
		        logger.debug("name:"+ok.toString()+";value:"+ov.toString());
		    }
		    if(StringUtils.isEmpty(id)){
			    //消除不是表的字段
			    String [] filterName = {"tableName","saveOrUpdate"};
			    data = CommUtils.attributeMapFilter(data,filterName);
			    //保存数据库
			    try {
			    	Object pkValue = null;
			    	pkValue = 数据库服务器.getPkValue(tableName);
			    	data.put("id", pkValue);
			    	//--author：luobaoli---------date:20150615--------for: 处理service层抛出的异常
			    	try {
						数据库服务器.insertTable(tableName, data);
						j.setSuccess(true);
						message = "业务提交成功";
			    	}catch (Exception e) {
			    		j.setSuccess(false);
						message = "业务提交失败";
			    	}
			    	//--author：luobaoli---------date:20150615--------for: 处理service层抛出的异常
				} catch (Exception e) {
					e.printStackTrace();
					j.setSuccess(false);
					message = e.getMessage();
				}
			}else{
				//消除不是表的字段
			    String [] filterName = {"tableName","saveOrUpdate","id"};
			    data = CommUtils.attributeMapFilter(data,filterName);
			    //更新数据库
			    try {
					int num = 数据库服务器.updateTable(tableName, id, data);
					if (num>0) {
						j.setSuccess(true);
						message = "业务更新成功";
					}else {
						j.setSuccess(false);
						message = "业务更新失败";
					}
					
				} catch (Exception e) {
					e.printStackTrace();
					j.setSuccess(false);
					message = e.getMessage();
				}
			}
		}
		j.setMsg(message);
		j.setObj(data);
		return j;
	}	
	/**
	 * 保存或更新
	 * 
	 * @param jeecgDemo
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "saveOrUpdateMore")
	@ResponseBody
	public AjaxJson saveOrUpdateMore(HttpServletRequest request) throws Exception{
		String message = null;
		AjaxJson j = new AjaxJson();
		Map data = request.getParameterMap();
		if(data!=null){
			data = CommUtils.mapConvert(data);
			String tableName = (String)data.get("tableName");
			String id = (String)data.get("id");
		    Map<String,List<Map<String,Object>>> mapMore =CommUtils.mapConvertMore(data, tableName);
		    if(StringUtils.isEmpty(id)){
		    	logger.info("一对多添加!!!!!");
		    	try {
		    		Map<String, Object> result = 数据库服务器.insertTableMore(mapMore, tableName);
		    		data.put("id", result.get("id"));
		    		j.setSuccess(true);
					message = "添加成功";
				} catch (BusinessException e) {
					e.printStackTrace();
					j.setSuccess(false);
					message = e.getMessage();
				}		    	
			}else{
				logger.info("一对多修改!!!!!");
				try {
					数据库服务器.updateTableMore(mapMore, tableName);
					j.setSuccess(true);
					message = "更新成功";
				} catch (BusinessException e) {
					e.printStackTrace();
					j.setSuccess(false);
					message = e.getMessage();
				}
			}
		}
		j.setMsg(message);
		j.setObj(data);
		return j;
	}	
	/**
	 * 自定义按钮（触发对应的后台方法）
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "doButton")
	@ResponseBody
	public AjaxJson doButton(HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		try {
			String formId = request.getParameter("formId");
			String buttonCode = request.getParameter("buttonCode");
			String tableName = request.getParameter("tableName");
			String id = request.getParameter("id");
			Map<String,Object> data  = 数据库服务器.findOneForJdbc(tableName, id);
			if(data!=null){
				//打印测试
			    Iterator it=data.entrySet().iterator();
			    while(it.hasNext()){
			    	Map.Entry entry=(Map.Entry)it.next();
			        Object ok=entry.getKey();
			        Object ov=entry.getValue()==null?"":entry.getValue();
			        logger.debug("name:"+ok.toString()+";value:"+ov.toString());
			    }
				data = CommUtils.mapConvert(data);
				数据库服务器.executeSqlExtend(formId, buttonCode, data);

				数据库服务器.executeJavaExtend(formId, buttonCode, data);

			}
			j.setSuccess(true);
			message = "操作成功";
		} catch (Exception e) {
			e.printStackTrace();
			message = "操作失败";
		}
		j.setMsg(message);
		return j;
	}
	
}






