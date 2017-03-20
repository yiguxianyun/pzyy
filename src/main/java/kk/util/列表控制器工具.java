package kk.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kk.controller.通用控制器;

import org.jeecgframework.web.cgform.common.CgAutoListConstant;
import org.jeecgframework.web.cgform.engine.FreemarkerHelper;
import org.jeecgframework.web.cgform.entity.config.CgFormFieldEntity;
import org.jeecgframework.web.cgform.entity.config.CgFormHeadEntity;
import org.jeecgframework.web.cgform.entity.template.CgformTemplateEntity;
import org.jeecgframework.web.cgform.service.autolist.CgTableServiceI;
import org.jeecgframework.web.cgform.service.autolist.ConfigServiceI;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import org.jeecgframework.web.cgform.service.template.CgformTemplateServiceI;
import org.jeecgframework.web.cgform.util.QueryParamUtil;
import org.jeecgframework.web.cgform.util.TemplateUtil;
import org.jeecgframework.web.system.pojo.base.DictEntity;
import org.jeecgframework.web.system.pojo.base.TSOperation;
import org.jeecgframework.web.system.service.SystemService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.enums.SysThemesEnum;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.JeecgDataAutorUtils;
import org.jeecgframework.core.util.MutiLangUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.SysThemesUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Component
public class 列表控制器工具{
	@Autowired
	private ConfigServiceI configService;
	@Autowired
	private CgTableServiceI cgTableService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;
	@Autowired
	private CgformTemplateServiceI cgformTemplateService;
	private static Logger log = Logger.getLogger(列表控制器工具.class);
	
	@Autowired
	private 通用控制器 通用控制器;
	/**
	 * 加载按钮权限
	 * @param paras
	 * @param request
	 */
	public void loadAuth(Map<String, Object> paras, HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		List<TSOperation>  nolist = (List<TSOperation>) request.getAttribute(Globals.NOAUTO_OPERATIONCODES);
		if(ResourceUtil.getSessionUserName().getUserName().equals("admin")|| !Globals.BUTTON_AUTHORITY_CHECK){
			nolist = null;
		}
		List<String> list = new ArrayList<String>();
		String nolistStr = "";
		if(nolist!=null){
			for(TSOperation operation:nolist){
				nolistStr+=operation.getOperationcode();
				nolistStr+=",";
				list.add(operation.getOperationcode());
			}
		}
		paras.put(CgAutoListConstant.CONFIG_NOLIST, list);
		paras.put(CgAutoListConstant.CONFIG_NOLISTSTR, nolistStr==null?"":nolistStr);
	}

}





