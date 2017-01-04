package org.jeecgframework.web.cgform.controller.build;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.text.MessageFormat;
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
@RequestMapping("/选型报价")
public class CgformXXBJ extends BaseController {
	private static final Logger logger = Logger.getLogger(CgFormBuildController.class);
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

	//kk折腾——————
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "cxDJCJ")
	@ResponseBody
	public List cxDJCJ(HttpServletRequest request) throws Exception{
		List data = new ArrayList();
		String jsptgl=request.getParameter("jsptgl");
		if(!jsptgl.isEmpty()){
			String djcj=request.getParameter("djcj");
			djcj=StringUtils.isBlank(djcj)?"":"and 厂家 = '"+djcj+"'";
			String xl=request.getParameter("xl");
			xl=StringUtils.isBlank(xl)?"":"and 系列 = '"+xl+"'";
			String ip=request.getParameter("ip");
			ip=StringUtils.isBlank(ip)?"":"and IP = '"+ip+"'";
			String dy=request.getParameter("dy");
			dy=StringUtils.isBlank(dy)?"":"and 电压 = '"+dy+"'";
			String djjs=request.getParameter("djjs");
			djjs=StringUtils.isBlank(djjs)?"":"and 极数 = '"+djjs+"'";
			
			String 动作=request.getParameter("动作");
			String sqlBDS="SELECT DISTINCT {0} FROM 电机价格表 where 功率>={1} {2} {3} {4} {5}and 1=1";
			
			if(动作.equals("查厂家")){
				data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"厂家",jsptgl,"","","","",djjs));
			}else if(动作.equals("查系列")){
				data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"系列",jsptgl,djcj,"","","",djjs));			
			}else if(动作.equals("查IP")){
				data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"IP",jsptgl,djcj,xl,"","",djjs));
			}else if(动作.equals("查电压")){
				data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"电压",jsptgl,djcj,xl,ip,djjs));
			}else if(动作.equals("查型号")){
				String sql="SELECT {0} FROM 电机价格表 where 功率>={1} {2} {3} {4} {5} {6} and 1=1 ORDER BY 功率";
				data=this.jdbcTemplate.queryForList(MessageFormat.format(sql,"*",jsptgl,djcj,xl,ip,dy,djjs));	
			}
		}	
		return data;
	}
	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "cxBJG")
	@ResponseBody
	public Map cxBJG(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String jgbh=request.getParameter("jgbh");
		if(!jgbh.isEmpty()){
			data=this.jdbcTemplate.queryForMap("SELECT * FROM 价格表_nsc2016二 where 价格编号 = '"+jgbh+"'");
		}	
		return data;
	}
//	查询差价系数
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "cxCJXS")
	@ResponseBody
	public Map cxCJXS(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String z_btcz=request.getParameter("z_btcz");
		String z_bxl=request.getParameter("z_bxl");		
		data=this.jdbcTemplate.queryForMap("SELECT * FROM 价格表_nsc2016二_泵头系数 where 材质 = '"+z_btcz+"' and 系列 = '" +z_bxl+"'");			
		return data;
	}
//	查询地脚螺栓
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "cxDJLS")
	@ResponseBody
	public Map cxDJLS(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String bxh=request.getParameter("bxh");
		data=this.jdbcTemplate.queryForMap("SELECT * FROM 泵地脚螺栓 where 泵型号 = '"+bxh+"'");			
		return data;
	}
//	查询法兰
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "cxFL")
	@ResponseBody
	public Map cxFL(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String 动作=request.getParameter("动作");		
		if(动作.equals("查法兰")){
			String bxh=request.getParameter("bxh");
			data=this.jdbcTemplate.queryForMap("SELECT * FROM 结构参数_nsc where 泵型号 = '"+bxh+"'");
		}else if(动作.equals("查价格")){
			String zj=request.getParameter("zj");
			String yl=request.getParameter("yl");
			data=this.jdbcTemplate.queryForMap("SELECT * FROM 价格表_法兰 where DN = "+zj+" and PN =" +yl);			
		}					
		return data;
	}	
	
//	autocomplete查询	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "chaxunDJ")
	@ResponseBody
	public List chaxunDJCJ(HttpServletRequest request) throws Exception{
		List data = new ArrayList();
		String term =request.getParameter("term");		
		term="'%"+term+"%'";
		String 动作=request.getParameter("动作");
		String sqlBDS="SELECT DISTINCT {0} FROM 电机价格表 where {1} LIKE {2}";
		
		if(动作.equals("查厂家")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"厂家","厂家",term));
		}else if(动作.equals("查功率")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"功率","功率",term));	
		}else if(动作.equals("查IP")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"ip","ip",term));
		}else if(动作.equals("查电压")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"电压","电压",term));
		}else if(动作.equals("查频率")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"频率","频率",term));
		}else if(动作.equals("查型号")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"型号","型号",term));
		}else if(动作.equals("查系列")){
			data=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"系列","系列",term));
		}

		return data;
	}	
	
//	用ID查询电机
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "cxDJYID")
	@ResponseBody
	public Map cxDJYID(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String dianjiID=request.getParameter("dianjiID");
		data=this.jdbcTemplate.queryForMap("SELECT * FROM 电机价格表 where id = '"+dianjiID+"'");

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
	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "查询长轴泵")
	@ResponseBody
	public Map 查询长轴泵(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String 动作=request.getParameter("动作");	
		String bxh=request.getParameter("bxh");
		if(动作.equals("查价格")){
			data=this.jdbcTemplate.queryForMap("SELECT * FROM 长轴泵价格 where 泵型号 = '"+bxh+"'");			
		}else if(动作.equals("查结构")){
			data=this.jdbcTemplate.queryForMap("SELECT * FROM 长轴泵结构参数 where 泵型号 = '"+bxh+"'");			
		}					
		return data;
	}	
	
	
	
	
	
	
}
