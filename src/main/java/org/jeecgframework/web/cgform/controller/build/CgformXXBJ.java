package org.jeecgframework.web.cgform.controller.build;

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
	@SuppressWarnings({ "rawtypes", "unchecked"})
	@RequestMapping(params = "查用户")
	@ResponseBody
	public String 查用户(HttpServletRequest request) throws Exception{
		HttpSession session = ContextHolderUtils.getSession();
		Client client = ClientManager.getInstance().getClient(session.getId());
		String data="",用户= "",编号= "",前缀= "SJB01-";
		int 序列号;
		List lists=new ArrayList();
		if(client == null){ 
			client = ClientManager.getInstance().getClient(request.getParameter("sessionId"));
		}
		if (client != null && client.getUser()!=null ) {
			用户=client.getUser().getUserName();
		}
		编号="'%"+前缀+用户+"-"+"%'";
		String sqlBDS="SELECT {0} FROM nsc数据表 where {1} LIKE {2}";
		lists=this.jdbcTemplate.queryForList(MessageFormat.format(sqlBDS,"数据表编号","数据表编号",编号));
		if (lists.size() !=0) {
			List a = new ArrayList();
			for(Object map:lists){				
				String kk=(String)((Map)map).get("数据表编号");
				String[] kk2 = kk.split("-");
				int kk3=Integer.parseInt(kk2[2]);
				a.add(kk3);
			}
			序列号=Collections.max(a);
//			System.out.println(Collections.max(b));
		}else {
			序列号=0;
		}
		data=前缀+用户+"-"+(序列号+1);
		return data;
	}	
	@RequestMapping(params = "查角色")
	@ResponseBody
	public String 查角色(HttpServletRequest request) throws Exception{
		HttpSession session = ContextHolderUtils.getSession();
		Client client = ClientManager.getInstance().getClient(session.getId());
		String data="";
		if(client == null){ 
			client = ClientManager.getInstance().getClient(request.getParameter("sessionId"));
		}
		if (client != null && client.getUser()!=null ) {
			data=client.getUser().getUserKey();
		}
		return data;
	}	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "提取数据表")
	@ResponseBody
	public Map 查数据表(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String 编号=request.getParameter("编号");
		data=this.jdbcTemplate.queryForMap("SELECT * FROM nsc数据表汇总 where 数据表编号 = '"+编号+"'");
		return data;
	}	

	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "查nsc_sjID")
	@ResponseBody
	public Map 查nsc_sjID(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String 编号=request.getParameter("编号");
		data=this.jdbcTemplate.queryForMap("SELECT id FROM nsc_sj where 数据表编号 = '"+编号+"'");
		return data;
	}	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(params = "提取NSC价格")
	@ResponseBody
	public Map 提取NSC价格(HttpServletRequest request) throws Exception{
		Map data = new HashMap();
		String 编号=request.getParameter("编号");
		data=this.jdbcTemplate.queryForMap("SELECT * FROM nsc_算价结果汇总 where 数据表编号 = '"+编号+"'");
		return data;
	}	
	
	
}
















