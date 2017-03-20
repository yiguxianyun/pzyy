package kk.util;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kk.controller.通用控制器;

import org.jeecgframework.web.cgform.common.CgAutoListConstant;
import org.jeecgframework.web.cgform.engine.FreemarkerHelper;
import org.jeecgframework.web.cgform.engine.TempletContext;
import org.jeecgframework.web.cgform.entity.config.CgFormFieldEntity;
import org.jeecgframework.web.cgform.entity.config.CgFormHeadEntity;
import org.jeecgframework.web.cgform.entity.template.CgformTemplateEntity;
import org.jeecgframework.web.cgform.entity.upload.CgUploadEntity;
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
import org.jeecgframework.core.util.ApplicationContextUtil;
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

import freemarker.template.Template;
import freemarker.template.TemplateException;
@Component
public class 表单控制器工具{
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
	private static Logger log = Logger.getLogger(表单控制器工具.class);
	
	@Autowired
	private 通用控制器 通用控制器;
	@Autowired
	private TempletContext templetContext;
	
	/**
	 * 如果表单带有附件，则查询出来传递到页面
	 * @param data 传往页面的数据容器
	 * @param id 表单主键，用户查找附件数据
	 */
	public void pushFiles(Map<String, Object> data, String id) {
		List<CgUploadEntity> uploadBeans = cgFormFieldService.findByProperty(CgUploadEntity.class, "cgformId", id);
		List<Map<String,Object>> files = new ArrayList<Map<String,Object>>(0);
		for(CgUploadEntity b:uploadBeans){
			String title = b.getAttachmenttitle();//附件名
			String fileKey = b.getId();//附件主键
			String path = b.getRealpath();//附件路径
			String field = b.getCgformField();//表单中作为附件控件的字段
			Map<String, Object> file = new HashMap<String, Object>();
			file.put("title", title);
			file.put("fileKey", fileKey);
			file.put("path", path);
			file.put("field", field==null?"":field);
			files.add(file);
		}
		data.put("filesList", files);
	}

	/**
	 * 如果表单带有 附件(图片),则查询出来传递到页面
	 * @param data 传往页面的数据容器
	 * @param id 表单主键,用户查找附件数据
	 */
	public void pushImages(Map<String, Object> data, String id) {
		List<CgUploadEntity> uploadBeans = cgFormFieldService.findByProperty(CgUploadEntity.class, "cgformId", id);
		List<Map<String,Object>> images = new ArrayList<Map<String,Object>>(0);
		for(CgUploadEntity b:uploadBeans){
			String title = b.getAttachmenttitle();//附件名
			String fileKey = b.getId();//附件主键
			String path = b.getRealpath();//附件路径
			String field = b.getCgformField();//表单中作为附件控件的字段
			Map<String, Object> image = new HashMap<String, Object>();
			image.put("title", title);
			image.put("fileKey", fileKey);
			image.put("path", path);
			image.put("field", field==null?"":field);
			images.add(image);
		}
		data.put("imageList", images);
	}
	
	public String getHtmlHead(HttpServletRequest request){
		HttpSession session = ContextHolderUtils.getSession();
		String lang = (String)session.getAttribute("lang");
		StringBuilder sb= new StringBuilder("");
		SysThemesEnum sysThemesEnum = SysThemesUtil.getSysTheme(request);
		sb.append("<script type=\"text/javascript\" src=\"plug-in/jquery/jquery-1.8.3.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/tools/dataformat.js\"></script>");
		sb.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"plug-in/accordion/css/accordion.css\">");
		sb.append(SysThemesUtil.getEasyUiTheme(sysThemesEnum));
		sb.append("<link rel=\"stylesheet\" href=\"plug-in/easyui/themes/icon.css\" type=\"text/css\"></link>");
		sb.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"plug-in/accordion/css/icons.css\">");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/easyui/jquery.easyui.min.1.3.2.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/easyui/locale/zh-cn.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/tools/syUtil.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/My97DatePicker/WdatePicker.js\"></script>");
//		sb.append("<link rel=\"stylesheet\" href=\"plug-in/tools/css/common.css\" type=\"text/css\"></link>");
		//common.css
		sb.append(SysThemesUtil.getCommonTheme(sysThemesEnum));
//		sb.append("<script type=\"text/javascript\" src=\"plug-in/lhgDialog/lhgdialog.min.js\"></script>");
		sb.append(SysThemesUtil.getLhgdialogTheme(sysThemesEnum));
		sb.append(StringUtil.replace("<script type=\"text/javascript\" src=\"plug-in/tools/curdtools_{0}.js\"></script>", "{0}", lang));
		sb.append("<script type=\"text/javascript\" src=\"plug-in/tools/easyuiextend.js\"></script>");
		sb.append(SysThemesUtil.getEasyUiMainTheme(sysThemesEnum));
		sb.append("<link rel=\"stylesheet\" href=\"plug-in/uploadify/css/uploadify.css\" type=\"text/css\"></link>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/uploadify/jquery.uploadify-3.1.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/tools/Map.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/Validform/js/Validform_Datatype_zh-cn.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/Validform/js/datatype_zh-cn.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/Validform/plugin/passwordStrength/passwordStrength-min.js\"></script>");
		//style.css
		sb.append(SysThemesUtil.getValidformStyleTheme(sysThemesEnum));
		//tablefrom.css
		sb.append(SysThemesUtil.getValidformTablefrom(sysThemesEnum));
		//umedit
		sb.append("<link rel=\"stylesheet\" href=\"plug-in/umeditor/themes/default/css/umeditor.css\" type=\"text/css\"></link>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/umeditor/umeditor.config.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/umeditor/umeditor.min.js\"></script>");
		sb.append("<script type=\"text/javascript\" src=\"plug-in/umeditor/lang/zh-cn/zh-cn.js\"></script>");
		
		return sb.toString();
	}
	/**
	 * 获取url指定模板
	 * @param templateName
	 * @param templateType
	 * @param dataMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getUrlTemplate(String templateName,TemplateUtil.TemplateType templateType,Map dataMap){
		String content=null;
		CgformTemplateEntity entity=cgformTemplateService.findByCode(templateName);
		if(entity!=null){
			FreemarkerHelper viewEngine = new FreemarkerHelper();

			dataMap.put("DictData", ApplicationContextUtil.getContext().getBean("dictDataTag"));
			@SuppressWarnings("unused")
			String kk=TemplateUtil.getTempletPath(entity,0, TemplateUtil.TemplateType.LIST);
			

			content = viewEngine.parseTemplate(TemplateUtil.getTempletPath(entity,0, templateType), dataMap);
		}
		return content;
	}
	/**
	 * 获取表配置中存储的风格模板
	 * @param templateName
	 * @param request
	 * @param data
	 * @return
	 */
	public String getTableTemplate(String templateName,HttpServletRequest request,Map data){
		StringWriter stringWriter = new StringWriter();
		BufferedWriter writer = new BufferedWriter(stringWriter);

		String ftlVersion =request.getParameter("ftlVersion");
//		String ftlVersion = oConvertUtils.getString(data.get("version"));

		Template template = templetContext.getTemplate(templateName, ftlVersion);
		try {

			template.setDateTimeFormat("yyyy-MM-dd HH:mm:ss");  
			template.setDateFormat("yyyy-MM-dd");  
			template.setTimeFormat("HH:mm:ss");

			template.process(data, writer);
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return stringWriter.toString();
	}	
	
}





