package kk.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.jdbc.support.incrementer.OracleSequenceMaxValueIncrementer;
import org.springframework.jdbc.support.incrementer.PostgreSQLSequenceMaxValueIncrementer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kk.util.其他工具;
import kk.util.数据库服务器工具;

/**
 */
@Service("数据库服务器")
//--author：luobaoli---------date:20150616--------for: 修改spring事务回滚异常设置，以便支持BusinessException
@Transactional(rollbackFor=Exception.class)
//--author：luobaoli---------date:20150616--------for: 修改spring事务回滚异常设置，以便支持BusinessException
public class 数据库服务器 extends CommonServiceImpl  implements DataBaseService{
	private static final Logger logger = Logger.getLogger(数据库服务器.class);
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;
	@Autowired
	private AbstractRoutingDataSource dataSource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private 数据库服务器工具 数据库服务器工具;	
	/**
	 * 表单添加
	 * @param tableName 表名
	 * @param data 添加的数据map
	 * @throws BusinessException
	 */
	public void insertTable(String tableName, Map<String, Object> data) throws BusinessException {
		CgFormHeadEntity cgFormHeadEntity = cgFormFieldService.getCgFormHeadByTableName(tableName);
		//系统上下文变量赋值
		数据库服务器工具.fillInsertSysVar(data);
		//主键适配器（根据不同的数据库进行生成）
		数据库服务器工具.keyAdapter(cgFormHeadEntity,data);
		//数据类型转换（date，int，double等等）
		数据库服务器工具.dataAdapter(tableName,data);
		String comma = "";
		StringBuffer insertKey = new StringBuffer();
		StringBuffer insertValue = new StringBuffer();
		for (Entry<String, Object> entry : data.entrySet()) {
			// 判断key是否为表配置的属性
			if(数据库服务器工具.isContainsFieled(tableName,entry.getKey())){
				//插入SQL语法,兼容多数据库,去掉单引号
				insertKey.append(comma  + entry.getKey());
				if(entry.getValue()!=null && entry.getValue().toString().length()>0){
					insertValue.append(comma + ":"+entry.getKey());
				}else{
					insertValue.append(comma + "null");
				}
				comma = ", ";
			}
		}
		String sql = "INSERT INTO " + tableName + " (" + insertKey + ") VALUES (" + insertValue + ")";
		Object key = null;
		key = this.executeSqlReturnKey(sql,data);
		if(key!=null && key instanceof Long){
			data.put("id", key);
		}
		if(cgFormHeadEntity!=null){
			executeSqlExtend(cgFormHeadEntity.getId(),"add",data);
			executeJavaExtend(cgFormHeadEntity.getId(),"add",data);
		}
	}
	/**
	 * 表单修改
	 * @param tableName 表名
	 * @param id 表数据id
	 * @param data 修改的数据map
	 */
	public int updateTable(String tableName, Object id, Map<String, Object> data) throws BusinessException {
		数据库服务器工具.fillUpdateSysVar(data);
		数据库服务器工具.dataAdapter(tableName,data);
		String comma = "";
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append("update ").append(tableName).append(" set ");
		for (Entry<String, Object> entry : data.entrySet()) {
			// 判断key是否为表配置的属性
			if(数据库服务器工具.isContainsFieled(tableName,entry.getKey())){
				if(entry.getValue()!=null&&entry.getValue().toString().length()>0){
					sqlBuffer.append(comma).append(entry.getKey()).append("=:"+entry.getKey()+" ");
				}else{
					sqlBuffer.append(comma).append(entry.getKey()).append("=null");
				}
				comma = ", ";
			}
		}
		if(id instanceof java.lang.String){
			sqlBuffer.append(" where id='").append(id).append("'");
		}else{
			sqlBuffer.append(" where id=").append(id);
		}
		CgFormHeadEntity cgFormHeadEntity = cgFormFieldService.getCgFormHeadByTableName(tableName);
		int num = this.executeSql(sqlBuffer.toString(), data);
		if(cgFormHeadEntity!=null){
			executeSqlExtend(cgFormHeadEntity.getId(),"update",data);
			executeJavaExtend(cgFormHeadEntity.getId(),"update",data);
		}
		return num;
	}
	/**
	 * 查询表单
	 * @param tableName 表名
	 * @param id 表数据id
	 */
	public Map<String, Object> findOneForJdbc(String tableName, String id) {
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append("select * from ").append(tableName);
		sqlBuffer.append(" where id= ? ");
		Map<String, Object> map = commonDao.findOneForJdbc(sqlBuffer.toString(), id);
		return map;
	}
	/**
	 * sql业务增强
	 *
	 */
	public void executeSqlExtend(String formId,String buttonCode,Map<String, Object> data){
		//根据formId和buttonCode获取
		CgformButtonSqlEntity cgformButtonSqlVo = getCgformButtonSqlByCodeFormId(buttonCode,formId);
		if(cgformButtonSqlVo!=null){
			//获取sql参数注入参数
			String sqlPlugin = cgformButtonSqlVo.getCgbSqlStr();
			if(StringUtils.isNotEmpty(sqlPlugin)){
				String [] sqls = sqlPlugin.split(";");
				for(String sql:sqls){

					/*if(sql.toLowerCase().indexOf(CgAutoListConstant.SQL_INSERT)!=-1
							||sql.toLowerCase().indexOf(CgAutoListConstant.SQL_UPDATE)!=-1){*/
					if(true){

						//执行sql
						logger.debug("sql plugin -------->"+sql);
						sql = 数据库服务器工具.formateSQl(sql,  data);
						logger.debug("sql plugin -------->"+sql);
						int num = this.executeSql(sql);
						if(num>0){
							logger.debug("sql plugin --execute success------>"+sql);
						}else{
							logger.debug("sql plugin --execute fail------>"+sql);
						}
					}
				}
			}
		}
	}
	private CgformButtonSqlEntity getCgformButtonSqlByCodeFormId(String buttonCode, String formId) {
		StringBuilder hql = new StringBuilder("");
		hql.append(" from CgformButtonSqlEntity t");
		hql.append(" where t.formId=?");
		hql.append(" and  t.buttonCode =?");
		List<CgformButtonSqlEntity> list = this.findHql(hql.toString(),formId,buttonCode);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertTableMore(Map<String, List<Map<String, Object>>> mapMore, String mainTableName) throws BusinessException {
		//插入主表信息
		Map<String, Object> mainMap = mapMore.get(mainTableName).get(0);
		//消除字段
	    String [] filterName = {"tableName","saveOrUpdateMore","提交"};
	    mainMap = CommUtils.attributeMapFilter(mainMap,filterName);
	    if(mainMap.get("id")==null||"".equals((String)mainMap.get("id"))){
		    Object pkValue = getPkValue(mainTableName);
		    mainMap.put("id", pkValue);
	    }
		insertTable(mainTableName, mainMap);
		//插入附表信息
		//去除主表信息
		String [] filterMainTable = {mainTableName};
		mapMore = CommUtils.attributeMapFilter(mapMore,filterMainTable);
		Iterator it=mapMore.entrySet().iterator();
		while(it.hasNext()){
	        Map.Entry entry=(Map.Entry)it.next();
	        String ok=(String)entry.getKey();
	        List<Map<String, Object>> ov=(List<Map<String, Object>>)entry.getValue();
	        for(Map<String, Object> fieldMap:ov){
	        	//处理关联键
	        	List<Map<String, Object>> fkFieldList =  getFKField(mainTableName, ok);
	        	Object subPkValue = getPkValue(ok);
	        	fieldMap.put("id", subPkValue);
	        	fieldMap = CommUtils.convertFKMap(fieldMap,mainMap,fkFieldList);
	        	insertTable(ok, fieldMap);
	        }
		}
		return mainMap;
	}
	@SuppressWarnings("unchecked")
	public boolean updateTableMore(Map<String, List<Map<String, Object>>> mapMore, String mainTableName) throws BusinessException {
		//更新主表信息
		Map<String, Object> mainMap = mapMore.get(mainTableName).get(0);
		Object mainTableId = mainMap.get("id");
		//消除字段
	    String [] filterName =  {"tableName","saveOrUpdateMore","id","提交","自动完成第一步"};
	    mainMap = CommUtils.attributeMapFilter(mainMap,filterName);
		updateTable(mainTableName,mainTableId, mainMap);
		mainMap.put("id", mainTableId);
		//更新附表信息
		String [] filterMainTable = {mainTableName};
		mapMore = CommUtils.attributeMapFilter(mapMore,filterMainTable);
		Iterator it=mapMore.entrySet().iterator();
		while(it.hasNext()){
	        Map.Entry entry=(Map.Entry)it.next();
	        String ok=(String)entry.getKey();
	        List<Map<String, Object>> ov=(List<Map<String, Object>>)entry.getValue();
	        //处理关联键
        	List<Map<String, Object>> fkFieldList =  getFKField(mainTableName, ok);
        	//根据主表id获取附表信息
        	Map<Object,Map<String, Object>> subTableDateMap = getSubTableData(fkFieldList, mainTableName, ok, mainTableId);
	        for(Map<String, Object> fieldMap:ov){
	        	Object subId = fieldMap.get("id")==null?"":fieldMap.get("id");
	        	if(subId==null || "".equals(String.valueOf(subId))){
	        		fieldMap = CommUtils.convertFKMap(fieldMap,mainMap,fkFieldList);
		        	fieldMap.put("id", getPkValue(ok));
		        	insertTable(ok, fieldMap);
	        	}else{
	        		fieldMap = CommUtils.convertFKMap(fieldMap,mainMap,fkFieldList);
	        		//消除字段
	        	    String [] subFilterName =  {"id"};
	        	    fieldMap = CommUtils.attributeMapFilter(fieldMap,subFilterName);
	        		updateTable(ok,subId,fieldMap);
	        		//剔除已经更新了的数据
	        		if(subTableDateMap.containsKey(subId)){
	        			subTableDateMap.remove(subId);
	        		}
	        	}
	        }
	        //subTableDateMap中剩余的数据就是删除的数据
	        if(subTableDateMap.size()>0){
	        	Iterator itSub=subTableDateMap.entrySet().iterator();
		    	while(itSub.hasNext()){
		    		Map.Entry entrySub=(Map.Entry)itSub.next();
		    		Object subId=entrySub.getKey();
		    		deleteSubTableDataById(subId,ok);
		    	}
	        }
		}
		return true;
	}
	/**
	 * 获得主表附表关联键
	 *
	 * @param mainTableName 主表名
	 * @param subTableName  附表名
	 * @return
	 */
	private List<Map<String, Object>> getFKField(String mainTableName, String subTableName) {
		StringBuilder sql1 = new StringBuilder("");
		sql1.append("select f.* from cgform_field f ,cgform_head h");
		sql1.append(" where f.table_id = h.id ");
		sql1.append(" and h.table_name=? ");
		sql1.append(" and f.main_table=? ");
		List<Map<String,Object>> list = this.findForJdbc(sql1.toString(), subTableName,mainTableName);
		return list;
	}
	/**
	 * 根据主表id获取附表信息
	 *
	 * @param fkFieldList 主表附表关联键
	 * @param mainTableName 主表名
	 * @param subTableName  附表名
	 * @param mainTableId   主表id
	 * @return
	 */
	private Map<Object,Map<String, Object>> getSubTableData(List<Map<String, Object>> fkFieldList,String mainTableName, String subTableName,Object mainTableId) {

		StringBuilder sql2 = new StringBuilder("");
		sql2.append("select sub.* from ").append(subTableName).append(" sub ");
		sql2.append(", ").append(mainTableName).append(" main ");
		sql2.append("where 1=1 ");
		if(fkFieldList!=null&&fkFieldList.size()>0){
			for(Map<String,Object> map :fkFieldList){
				if(map.get("main_field")!=null){
					sql2.append(" and sub.").append((String)map.get("field_name")).append("=").append("main.").append((String)map.get("main_field"));
				}
			}
		}
		sql2.append(" and main.id= ? ");
		List<Map<String,Object>> subTableDataList = this.findForJdbc(sql2.toString(),mainTableId);
		Map<Object,Map<String, Object>> dataMap = new HashMap<Object, Map<String,Object>>();
		if(subTableDataList!=null){
			for(Map<String,Object> map:subTableDataList){
				dataMap.put(map.get("id"), map);
			}
		}
		return dataMap;
	}
	/**
	 * 根据主键策略获取实际插入的主键值
	 * @param tableName 表单名称
	 * @return
	 */
	public Object getPkValue(String tableName) {
		Object pkValue = null;
		CgFormHeadEntity  cghead = cgFormFieldService.getCgFormHeadByTableName(tableName);
		String dbType = DBTypeUtil.getDBType();
		String pkType = cghead.getJformPkType();
		String pkSequence = cghead.getJformPkSequence();
		if(StringUtil.isNotEmpty(pkType)&&"UUID".equalsIgnoreCase(pkType)){
			pkValue = UUIDGenerator.generate();
		}else if(StringUtil.isNotEmpty(pkType)&&"NATIVE".equalsIgnoreCase(pkType)){
			if(StringUtil.isNotEmpty(dbType)&&"oracle".equalsIgnoreCase(dbType)){
				OracleSequenceMaxValueIncrementer incr = new OracleSequenceMaxValueIncrementer(dataSource, "HIBERNATE_SEQUENCE");
				try{
					pkValue = incr.nextLongValue();
				}catch (Exception e) {
					logger.error(e,e);
				}
			}else if(StringUtil.isNotEmpty(dbType)&&"postgres".equalsIgnoreCase(dbType)){
				PostgreSQLSequenceMaxValueIncrementer incr = new PostgreSQLSequenceMaxValueIncrementer(dataSource, "HIBERNATE_SEQUENCE");
				try{
					pkValue = incr.nextLongValue();
				}catch (Exception e) {
					logger.error(e,e);
				}
			}else{
				pkValue = null;
			}
		}else if(StringUtil.isNotEmpty(pkType)&&"SEQUENCE".equalsIgnoreCase(pkType)){
			if(StringUtil.isNotEmpty(dbType)&&"oracle".equalsIgnoreCase(dbType)){
				OracleSequenceMaxValueIncrementer incr = new OracleSequenceMaxValueIncrementer(dataSource, pkSequence);
				try{
					pkValue = incr.nextLongValue();
				}catch (Exception e) {
					logger.error(e,e);
				}
			}else if(StringUtil.isNotEmpty(dbType)&&"postgres".equalsIgnoreCase(dbType)){
				PostgreSQLSequenceMaxValueIncrementer incr = new PostgreSQLSequenceMaxValueIncrementer(dataSource, pkSequence);
				try{
					pkValue = incr.nextLongValue();
				}catch (Exception e) {
					logger.error(e,e);
				}
			}else{
				pkValue = null;
			}
		}else{
			pkValue = UUIDGenerator.generate();
		}
		return pkValue;
	}
	/**
	 * 根据id删除附表信息
	 *
	 * @param subId 附表数据
	 * @param subTableName  附表名
	 * @return
	 */
	private void deleteSubTableDataById(Object subId,String subTableName){
		StringBuilder sql = new StringBuilder("");
		sql.append(" delete from ").append(subTableName).append(" where id = ? ");
		this.executeSql(sql.toString(), subId);
	}
	/**
	 * 执行JAVA增强实现类
	 */	
	@Override
	public void executeJavaExtend(String formId, String buttonCode,Map<String, Object> data) throws BusinessException{
		CgformEnhanceJavaEntity cgformEnhanceJavaEntity = getCgformEnhanceJavaEntityByCodeFormId(buttonCode,formId);
		if(cgformEnhanceJavaEntity!=null){
			String cgJavaType = cgformEnhanceJavaEntity.getCgJavaType();
			String cgJavaValue = cgformEnhanceJavaEntity.getCgJavaValue();

			if(StringUtil.isNotEmpty(cgJavaValue)){
				Object obj = null;
				try {
					if("class".equals(cgJavaType)){
						//因新增时已经校验了实例化是否可以成功，所以这块就不需要再做一次判断
						obj = MyClassLoader.getClassByScn(cgJavaValue).newInstance();
					}else if("spring".equals(cgJavaType)){
						obj = ApplicationContextUtil.getContext().getBean(cgJavaValue);
					}
					if(obj instanceof CgformEnhanceJavaInter){
						CgformEnhanceJavaInter javaInter = (CgformEnhanceJavaInter) obj;
						javaInter.execute(data);
					}
				} catch (Exception e) {
					logger.error(e.getMessage());
					e.printStackTrace();
					throw new BusinessException("执行JAVA增强出现异常！");
				} 
			}

		}
	}	
	public CgformEnhanceJavaEntity getCgformEnhanceJavaEntityByCodeFormId(String buttonCode, String formId) {
		StringBuilder hql = new StringBuilder("");
		hql.append(" from CgformEnhanceJavaEntity t");
		hql.append(" where t.formId='").append(formId).append("'");
		hql.append(" and  t.buttonCode ='").append(buttonCode).append("'");
		List<CgformEnhanceJavaEntity> list = this.findHql(hql.toString());
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}
	public List<CgformEnhanceJavaEntity> getCgformEnhanceJavaEntityByFormId( String formId) {
		StringBuilder hql = new StringBuilder("");
		hql.append(" from CgformEnhanceJavaEntity t");
		hql.append(" where t.formId='").append(formId).append("'");
		List<CgformEnhanceJavaEntity> list = this.findHql(hql.toString());
		return list;
	}

}






