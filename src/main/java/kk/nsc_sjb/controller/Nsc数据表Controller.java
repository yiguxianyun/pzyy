package kk.nsc_sjb.controller;
import kk.nsc_sjb.entity.Nsc数据表Entity;
import kk.nsc_sjb.service.Nsc数据表ServiceI;
import kk.nsc_sjb.page.Nsc数据表Page;
import kk.nsc_sjb.entity.Nsc数据表结构参数Entity;
import kk.nsc_sjb.entity.Nsc数据表材质Entity;
import kk.nsc_sjb.entity.Nsc数据表性能Entity;
import kk.nsc_sjb.entity.Nsc数据表供货Entity;
import kk.nsc_sjb.entity.Nsc数据表原动机Entity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ExceptionUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.cgform.common.CgAutoListConstant;
import org.jeecgframework.web.cgform.controller.autolist.CgAutoListController;
import org.jeecgframework.web.cgform.engine.FreemarkerHelper;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.io.IOException;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.jeecgframework.core.beanvalidator.BeanValidators;
import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.net.URI;
import org.springframework.http.MediaType;
import org.springframework.web.util.UriComponentsBuilder;

/**   
 * @Title: Controller
 * @Description: NSC数据表
 * @author onlineGenerator
 * @date 2017-02-17 11:51:58
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/nsc数据表Controller")
public class Nsc数据表Controller extends CgAutoListController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(Nsc数据表Controller.class);

	@Autowired
	private Nsc数据表ServiceI nsc数据表Service;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Validator validator;

	/**
	 * NSC数据表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public void list(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> configs = new HashMap<String, Object>();
		configs.put(CgAutoListConstant.CONFIG_ID, "NSC数据表");
		FreemarkerHelper viewEngine = new FreemarkerHelper();
		Map<String, Object> paras = new HashMap<String, Object>();
		super.loadIframeConfig(paras, request);
		
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(Nsc数据表Entity nsc数据表,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(Nsc数据表Entity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, nsc数据表);
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.nsc数据表Service.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除NSC数据表
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(Nsc数据表Entity nsc数据表, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		nsc数据表 = systemService.getEntity(Nsc数据表Entity.class, nsc数据表.getId());
		String message = "NSC数据表删除成功";
		try{
			nsc数据表Service.delMain(nsc数据表);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "NSC数据表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 批量删除NSC数据表
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		String message = "NSC数据表删除成功";
		try{
			for(String id:ids.split(",")){
				Nsc数据表Entity nsc数据表 = systemService.getEntity(Nsc数据表Entity.class,
				id
				);
				nsc数据表Service.delMain(nsc数据表);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "NSC数据表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 添加NSC数据表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(Nsc数据表Entity nsc数据表,Nsc数据表Page nsc数据表Page, HttpServletRequest request) {
		List<Nsc数据表结构参数Entity> nsc数据表结构参数List =  nsc数据表Page.getNsc数据表结构参数List();
		List<Nsc数据表材质Entity> nsc数据表材质List =  nsc数据表Page.getNsc数据表材质List();
		List<Nsc数据表性能Entity> nsc数据表性能List =  nsc数据表Page.getNsc数据表性能List();
		List<Nsc数据表供货Entity> nsc数据表供货List =  nsc数据表Page.getNsc数据表供货List();
		List<Nsc数据表原动机Entity> nsc数据表原动机List =  nsc数据表Page.getNsc数据表原动机List();
		AjaxJson j = new AjaxJson();
		String message = "添加成功";
		try{
			nsc数据表Service.addMain(nsc数据表, nsc数据表结构参数List,nsc数据表材质List,nsc数据表性能List,nsc数据表供货List,nsc数据表原动机List);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "NSC数据表添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	/**
	 * 更新NSC数据表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(Nsc数据表Entity nsc数据表,Nsc数据表Page nsc数据表Page, HttpServletRequest request) {
		List<Nsc数据表结构参数Entity> nsc数据表结构参数List =  nsc数据表Page.getNsc数据表结构参数List();
		List<Nsc数据表材质Entity> nsc数据表材质List =  nsc数据表Page.getNsc数据表材质List();
		List<Nsc数据表性能Entity> nsc数据表性能List =  nsc数据表Page.getNsc数据表性能List();
		List<Nsc数据表供货Entity> nsc数据表供货List =  nsc数据表Page.getNsc数据表供货List();
		List<Nsc数据表原动机Entity> nsc数据表原动机List =  nsc数据表Page.getNsc数据表原动机List();
		AjaxJson j = new AjaxJson();
		String message = "更新成功";
		try{
			nsc数据表Service.updateMain(nsc数据表, nsc数据表结构参数List,nsc数据表材质List,nsc数据表性能List,nsc数据表供货List,nsc数据表原动机List);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "更新NSC数据表失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * NSC数据表新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(Nsc数据表Entity nsc数据表, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(nsc数据表.getId())) {
			nsc数据表 = nsc数据表Service.getEntity(Nsc数据表Entity.class, nsc数据表.getId());
			req.setAttribute("nsc数据表Page", nsc数据表);
		}
		return new ModelAndView("kk/nsc_sjb/nsc数据表-add");
	}
	
	/**
	 * NSC数据表编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(Nsc数据表Entity nsc数据表, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(nsc数据表.getId())) {
			nsc数据表 = nsc数据表Service.getEntity(Nsc数据表Entity.class, nsc数据表.getId());
			req.setAttribute("nsc数据表Page", nsc数据表);
		}
		return new ModelAndView("kk/nsc_sjb/nsc数据表-update");
	}
	
	
	/**
	 * 加载明细列表[NSC数据表]
	 * 
	 * @return
	 */
	@RequestMapping(params = "nsc数据表结构参数List")
	public ModelAndView nsc数据表结构参数List(Nsc数据表Entity nsc数据表, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object wJ0 = nsc数据表.getId();
		//===================================================================================
		//查询-NSC数据表
	    String hql0 = "from Nsc数据表结构参数Entity where 1 = 1 AND wJ = ? ";
	    try{
	    	List<Nsc数据表结构参数Entity> nsc数据表结构参数EntityList = systemService.findHql(hql0,wJ0);
			req.setAttribute("nsc数据表结构参数List", nsc数据表结构参数EntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("kk/nsc_sjb/nsc数据表结构参数List");
	}
	/**
	 * 加载明细列表[NSC数据表]
	 * 
	 * @return
	 */
	@RequestMapping(params = "nsc数据表材质List")
	public ModelAndView nsc数据表材质List(Nsc数据表Entity nsc数据表, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object wJ1 = nsc数据表.getId();
		//===================================================================================
		//查询-NSC数据表
	    String hql1 = "from Nsc数据表材质Entity where 1 = 1 AND wJ = ? ";
	    try{
	    	List<Nsc数据表材质Entity> nsc数据表材质EntityList = systemService.findHql(hql1,wJ1);
			req.setAttribute("nsc数据表材质List", nsc数据表材质EntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("kk/nsc_sjb/nsc数据表材质List");
	}
	/**
	 * 加载明细列表[NSC数据表]
	 * 
	 * @return
	 */
	@RequestMapping(params = "nsc数据表性能List")
	public ModelAndView nsc数据表性能List(Nsc数据表Entity nsc数据表, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object wJ2 = nsc数据表.getId();
		//===================================================================================
		//查询-NSC数据表
	    String hql2 = "from Nsc数据表性能Entity where 1 = 1 AND wJ = ? ";
	    try{
	    	List<Nsc数据表性能Entity> nsc数据表性能EntityList = systemService.findHql(hql2,wJ2);
			req.setAttribute("nsc数据表性能List", nsc数据表性能EntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("kk/nsc_sjb/nsc数据表性能List");
	}
	/**
	 * 加载明细列表[NSC数据表]
	 * 
	 * @return
	 */
	@RequestMapping(params = "nsc数据表供货List")
	public ModelAndView nsc数据表供货List(Nsc数据表Entity nsc数据表, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object wJ3 = nsc数据表.getId();
		//===================================================================================
		//查询-NSC数据表
	    String hql3 = "from Nsc数据表供货Entity where 1 = 1 AND wJ = ? ";
	    try{
	    	List<Nsc数据表供货Entity> nsc数据表供货EntityList = systemService.findHql(hql3,wJ3);
			req.setAttribute("nsc数据表供货List", nsc数据表供货EntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("kk/nsc_sjb/nsc数据表供货List");
	}
	/**
	 * 加载明细列表[NSC数据表]
	 * 
	 * @return
	 */
	@RequestMapping(params = "nsc数据表原动机List")
	public ModelAndView nsc数据表原动机List(Nsc数据表Entity nsc数据表, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object wJ4 = nsc数据表.getId();
		//===================================================================================
		//查询-NSC数据表
	    String hql4 = "from Nsc数据表原动机Entity where 1 = 1 AND wJ = ? ";
	    try{
	    	List<Nsc数据表原动机Entity> nsc数据表原动机EntityList = systemService.findHql(hql4,wJ4);
			req.setAttribute("nsc数据表原动机List", nsc数据表原动机EntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("kk/nsc_sjb/nsc数据表原动机List");
	}

    /**
    * 导出excel
    *
    * @param request
    * @param response
    */
    @RequestMapping(params = "exportXls")
    public String exportXls(Nsc数据表Entity nsc数据表,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid,ModelMap map) {
    	CriteriaQuery cq = new CriteriaQuery(Nsc数据表Entity.class, dataGrid);
    	//查询条件组装器
    	org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, nsc数据表);
    	try{
    	//自定义追加查询条件
    	}catch (Exception e) {
    		throw new BusinessException(e.getMessage());
    	}
    	cq.add();
    	List<Nsc数据表Entity> list=this.nsc数据表Service.getListByCriteriaQuery(cq, false);
    	List<Nsc数据表Page> pageList=new ArrayList<Nsc数据表Page>();
        if(list!=null&&list.size()>0){
        	for(Nsc数据表Entity entity:list){
        		try{
        		Nsc数据表Page page=new Nsc数据表Page();
        		   MyBeanUtils.copyBeanNotNull2Bean(entity,page);
           		    Object wJ0 = entity.getId();
				    String hql0 = "from Nsc数据表结构参数Entity where 1 = 1 AND wJ = ? ";
        	        List<Nsc数据表结构参数Entity> nsc数据表结构参数EntityList = systemService.findHql(hql0,wJ0);
            		page.setNsc数据表结构参数List(nsc数据表结构参数EntityList);
           		    Object wJ1 = entity.getId();
				    String hql1 = "from Nsc数据表材质Entity where 1 = 1 AND wJ = ? ";
        	        List<Nsc数据表材质Entity> nsc数据表材质EntityList = systemService.findHql(hql1,wJ1);
            		page.setNsc数据表材质List(nsc数据表材质EntityList);
           		    Object wJ2 = entity.getId();
				    String hql2 = "from Nsc数据表性能Entity where 1 = 1 AND wJ = ? ";
        	        List<Nsc数据表性能Entity> nsc数据表性能EntityList = systemService.findHql(hql2,wJ2);
            		page.setNsc数据表性能List(nsc数据表性能EntityList);
           		    Object wJ3 = entity.getId();
				    String hql3 = "from Nsc数据表供货Entity where 1 = 1 AND wJ = ? ";
        	        List<Nsc数据表供货Entity> nsc数据表供货EntityList = systemService.findHql(hql3,wJ3);
            		page.setNsc数据表供货List(nsc数据表供货EntityList);
           		    Object wJ4 = entity.getId();
				    String hql4 = "from Nsc数据表原动机Entity where 1 = 1 AND wJ = ? ";
        	        List<Nsc数据表原动机Entity> nsc数据表原动机EntityList = systemService.findHql(hql4,wJ4);
            		page.setNsc数据表原动机List(nsc数据表原动机EntityList);
            		pageList.add(page);
            	}catch(Exception e){
            		logger.info(e.getMessage());
            	}
            }
        }
        map.put(NormalExcelConstants.FILE_NAME,"NSC数据表");
        map.put(NormalExcelConstants.CLASS,Nsc数据表Page.class);
        map.put(NormalExcelConstants.PARAMS,new ExportParams("NSC数据表列表", "导出人:Jeecg",
            "导出信息"));
        map.put(NormalExcelConstants.DATA_LIST,pageList);
        return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}

    /**
	 * 通过excel导入数据
	 * @param request
	 * @param
	 * @return
	 */
	@RequestMapping(params = "importExcel", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson importExcel(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile file = entity.getValue();// 获取上传文件对象
			ImportParams params = new ImportParams();
			params.setTitleRows(2);
			params.setHeadRows(2);
			params.setNeedSave(true);
			try {
				List<Nsc数据表Page> list =  ExcelImportUtil.importExcel(file.getInputStream(), Nsc数据表Page.class, params);
				Nsc数据表Entity entity1=null;
				for (Nsc数据表Page page : list) {
					entity1=new Nsc数据表Entity();
					MyBeanUtils.copyBeanNotNull2Bean(page,entity1);
		            nsc数据表Service.addMain(entity1, page.getNsc数据表结构参数List(),page.getNsc数据表材质List(),page.getNsc数据表性能List(),page.getNsc数据表供货List(),page.getNsc数据表原动机List());
				}
				j.setMsg("文件导入成功！");
			} catch (Exception e) {
				j.setMsg("文件导入失败！");
				logger.error(ExceptionUtil.getExceptionMessage(e));
			}finally{
				try {
					file.getInputStream().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			}
			return j;
	}
	/**
	* 导出excel 使模板
	*/
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(ModelMap map) {
		map.put(NormalExcelConstants.FILE_NAME,"NSC数据表");
		map.put(NormalExcelConstants.CLASS,Nsc数据表Page.class);
		map.put(NormalExcelConstants.PARAMS,new ExportParams("NSC数据表列表", "导出人:"+ ResourceUtil.getSessionUserName().getRealName(),
		"导出信息"));
		map.put(NormalExcelConstants.DATA_LIST,new ArrayList());
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	* 导入功能跳转
	*
	* @return
	*/
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name", "nsc数据表Controller");
		return new ModelAndView("common/upload/pub_excel_upload");
	}

 	
 	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public List<Nsc数据表Entity> list() {
		List<Nsc数据表Entity> listNsc数据表s=nsc数据表Service.getList(Nsc数据表Entity.class);
		return listNsc数据表s;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<?> get(@PathVariable("id") String id) {
		Nsc数据表Entity task = nsc数据表Service.get(Nsc数据表Entity.class, id);
		if (task == null) {
			return new ResponseEntity(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(task, HttpStatus.OK);
	}
 	
 	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<?> create(@RequestBody Nsc数据表Page nsc数据表Page, UriComponentsBuilder uriBuilder) {
		//调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
		Set<ConstraintViolation<Nsc数据表Page>> failures = validator.validate(nsc数据表Page);
		if (!failures.isEmpty()) {
			return new ResponseEntity(BeanValidators.extractPropertyAndMessage(failures), HttpStatus.BAD_REQUEST);
		}

		//保存
		List<Nsc数据表结构参数Entity> nsc数据表结构参数List =  nsc数据表Page.getNsc数据表结构参数List();
		List<Nsc数据表材质Entity> nsc数据表材质List =  nsc数据表Page.getNsc数据表材质List();
		List<Nsc数据表性能Entity> nsc数据表性能List =  nsc数据表Page.getNsc数据表性能List();
		List<Nsc数据表供货Entity> nsc数据表供货List =  nsc数据表Page.getNsc数据表供货List();
		List<Nsc数据表原动机Entity> nsc数据表原动机List =  nsc数据表Page.getNsc数据表原动机List();
		
		Nsc数据表Entity nsc数据表 = new Nsc数据表Entity();
		try{
			MyBeanUtils.copyBeanNotNull2Bean(nsc数据表,nsc数据表Page);
		}catch(Exception e){
            logger.info(e.getMessage());
        }
		nsc数据表Service.addMain(nsc数据表, nsc数据表结构参数List,nsc数据表材质List,nsc数据表性能List,nsc数据表供货List,nsc数据表原动机List);

		//按照Restful风格约定，创建指向新任务的url, 也可以直接返回id或对象.
		String id = nsc数据表Page.getId();
		URI uri = uriBuilder.path("/rest/nsc数据表Controller/" + id).build().toUri();
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(uri);

		return new ResponseEntity(headers, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> update(@RequestBody Nsc数据表Page nsc数据表Page) {
		//调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
		Set<ConstraintViolation<Nsc数据表Page>> failures = validator.validate(nsc数据表Page);
		if (!failures.isEmpty()) {
			return new ResponseEntity(BeanValidators.extractPropertyAndMessage(failures), HttpStatus.BAD_REQUEST);
		}

		//保存
		List<Nsc数据表结构参数Entity> nsc数据表结构参数List =  nsc数据表Page.getNsc数据表结构参数List();
		List<Nsc数据表材质Entity> nsc数据表材质List =  nsc数据表Page.getNsc数据表材质List();
		List<Nsc数据表性能Entity> nsc数据表性能List =  nsc数据表Page.getNsc数据表性能List();
		List<Nsc数据表供货Entity> nsc数据表供货List =  nsc数据表Page.getNsc数据表供货List();
		List<Nsc数据表原动机Entity> nsc数据表原动机List =  nsc数据表Page.getNsc数据表原动机List();
		
		Nsc数据表Entity nsc数据表 = new Nsc数据表Entity();
		try{
			MyBeanUtils.copyBeanNotNull2Bean(nsc数据表,nsc数据表Page);
		}catch(Exception e){
            logger.info(e.getMessage());
        }
		nsc数据表Service.updateMain(nsc数据表, nsc数据表结构参数List,nsc数据表材质List,nsc数据表性能List,nsc数据表供货List,nsc数据表原动机List);

		//按Restful约定，返回204状态码, 无内容. 也可以返回200状态码.
		return new ResponseEntity(HttpStatus.NO_CONTENT);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void delete(@PathVariable("id") String id) {
		Nsc数据表Entity nsc数据表 = nsc数据表Service.get(Nsc数据表Entity.class, id);
		nsc数据表Service.delMain(nsc数据表);
	}
}
