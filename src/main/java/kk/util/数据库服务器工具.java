package kk.util;

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
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 */
@Component
public class 数据库服务器工具{
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;
	/**
	 * 插入操作时将系统变量约定的字段赋值
	 * @param data
	 */
	public void fillInsertSysVar(Map<String, Object> data) {
		if(data.containsKey(DataBaseConstant.CREATE_DATE_TABLE)){
			data.put(DataBaseConstant.CREATE_DATE_TABLE, DateUtils.formatDate());
		}
		if(data.containsKey(DataBaseConstant.CREATE_TIME_TABLE)){
			data.put(DataBaseConstant.CREATE_TIME_TABLE, DateUtils.formatDateTime());
		}
		if(data.containsKey(DataBaseConstant.CREATE_BY_TABLE)){
			data.put(DataBaseConstant.CREATE_BY_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_CODE));
		}
		if(data.containsKey(DataBaseConstant.CREATE_NAME_TABLE)){
			data.put(DataBaseConstant.CREATE_NAME_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_NAME));
		}
		if(data.containsKey(DataBaseConstant.SYS_COMPANY_CODE_TABLE)){
			data.put(DataBaseConstant.SYS_COMPANY_CODE_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_COMPANY_CODE));
		}
		if(data.containsKey(DataBaseConstant.SYS_ORG_CODE_TABLE)){
			data.put(DataBaseConstant.SYS_ORG_CODE_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_ORG_CODE));
		}
		if(data.containsKey(DataBaseConstant.SYS_USER_CODE_TABLE)){
			data.put(DataBaseConstant.SYS_USER_CODE_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_CODE));	
		}
		if(data.containsKey(DataBaseConstant.UPDATE_DATE_TABLE)){
			data.put(DataBaseConstant.UPDATE_DATE_TABLE, DateUtils.formatDate());
		}
		if(data.containsKey(DataBaseConstant.UPDATE_TIME_TABLE)){
			data.put(DataBaseConstant.UPDATE_TIME_TABLE, DateUtils.formatDateTime());
		}
		if(data.containsKey(DataBaseConstant.UPDATE_BY_TABLE)){
			data.put(DataBaseConstant.UPDATE_BY_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_CODE));
		}
		if(data.containsKey(DataBaseConstant.UPDATE_NAME_TABLE)){
			data.put(DataBaseConstant.UPDATE_NAME_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_NAME));
		}
	}
	/**
	 * 更新操作时将系统变量约定的字段赋值
	 * @param data
	 */
	public void fillUpdateSysVar(Map<String, Object> data) {
		if(data.containsKey(DataBaseConstant.UPDATE_DATE_TABLE)){
			data.put(DataBaseConstant.UPDATE_DATE_TABLE, DateUtils.formatDate());
		}
		if(data.containsKey(DataBaseConstant.UPDATE_TIME_TABLE)){
			data.put(DataBaseConstant.UPDATE_TIME_TABLE, DateUtils.formatTime());
		}
		if(data.containsKey(DataBaseConstant.UPDATE_BY_TABLE)){
			data.put(DataBaseConstant.UPDATE_BY_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_CODE));
		}
		if(data.containsKey(DataBaseConstant.UPDATE_NAME_TABLE)){
			data.put(DataBaseConstant.UPDATE_NAME_TABLE, ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_NAME));
		}
	}
	/**
	 * 根据数据库和主键策略来适配Insert的sql语句
	 * @param cgFormHeadEntity 表单配置
	 * @param data	插入的数据
	 */
	public void keyAdapter(CgFormHeadEntity cgFormHeadEntity,Map<String, Object> data) {
		String pkType = cgFormHeadEntity.getJformPkType();
		String dbType = DBTypeUtil.getDBType();
		if("NATIVE".equalsIgnoreCase(pkType)||"SEQUENCE".equalsIgnoreCase(pkType)){
			if("sqlserver".equalsIgnoreCase(dbType)){
				//如果是数据库自增,sqlserver的insert语句中不允许出现该字段
				data.remove("id");
			}
		}
	}
	/**
	 * 数据类型适配-根据表单配置的字段类型将前台传递的值将map-value转换成相应的类型
	 * @param tableName 表单名
	 * @param data 数据
	 */
	public Map<String, Object> dataAdapter(String tableName,Map<String, Object> data) {
		//step.1 获取表单的字段配置
		Map<String, CgFormFieldEntity> fieldConfigs =cgFormFieldService.getAllCgFormFieldByTableName(tableName);
		//step.2 迭代将要持久化的数据
		Iterator it = fieldConfigs.keySet().iterator();
		for(;it.hasNext();){
			Object key = it.next();
			//根据表单配置的字段名 获取 前台数据
			Object beforeV = data.get(key.toString().toLowerCase());

			//如果值不为空
			if(oConvertUtils.isNotEmpty(beforeV)){
				//获取字段配置-字段类型
				CgFormFieldEntity fieldConfig = fieldConfigs.get(key);
				String type = fieldConfig.getType();
				//根据类型进行值的适配
				if("date".equalsIgnoreCase(type)){
					//日期->java.util.Date
					Object newV = String.valueOf(beforeV);
					try {
						String dateType = fieldConfig.getShowType();
						if("datetime".equalsIgnoreCase(dateType)){
							newV =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(String.valueOf(beforeV));
						}else if("date".equalsIgnoreCase(dateType)){
							newV = new SimpleDateFormat("yyyy-MM-dd").parse(String.valueOf(beforeV));
						}
						if(data.containsKey(key)){
							data.put(String.valueOf(key), newV);
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}else if("int".equalsIgnoreCase(type)){
					//int->java.lang.Integer
					Object newV = null;
					try{
						newV = Integer.parseInt(String.valueOf(beforeV));
					}catch (Exception e) {
						e.printStackTrace();
					}
					if(data.containsKey(key)){
						data.put(String.valueOf(key), newV);
					}
				}else if("double".equalsIgnoreCase(type)){
					//double->java.lang.Double
					Object newV = new Double(0);
					try{
						newV = Double.parseDouble(String.valueOf(beforeV));
					}catch (Exception e) {
						e.printStackTrace();
					}
					if(data.containsKey(key)){
						data.put(String.valueOf(key), newV);
					}
				}
			} else if(oConvertUtils.isNotEmpty(fieldConfigs.get(key).getFieldDefault())) {
				data.remove(key.toString().toLowerCase());
			}
		}
		return data;
	}
	/**
	 * 将Sql增强中的系统变量替换掉
	 * @param sql
	 * @return
	 */
	public String replaceExtendSqlSysVar(String sql){
		sql = sql.replace("{"+DataBaseConstant.SYS_USER_CODE_TABLE+"}", ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_CODE))
				.replace("{"+DataBaseConstant.SYS_USER_NAME_TABLE+"}", ResourceUtil.getUserSystemData(DataBaseConstant.SYS_USER_NAME))
				.replace("{"+DataBaseConstant.SYS_ORG_CODE_TABLE+"}", ResourceUtil.getUserSystemData(DataBaseConstant.SYS_ORG_CODE))
				.replace("{"+DataBaseConstant.SYS_COMPANY_CODE_TABLE+"}", ResourceUtil.getUserSystemData(DataBaseConstant.SYS_COMPANY_CODE))
				.replace("{"+DataBaseConstant.SYS_DATE_TABLE+"}",  DateUtils.formatDate())
				.replace("{"+DataBaseConstant.SYS_TIME_TABLE+"}",  DateUtils.formatTime());
		return sql;
	}

	private Map<String,CgFormFieldEntity> getAllFieldByTableName(String tableName){
		//获取版本号
        String version = cgFormFieldService.getCgFormVersionByTableName(tableName);
        Map<String,CgFormFieldEntity> map  = cgFormFieldService.getAllCgFormFieldByTableName(tableName, version);
		return map;
	}

	//判断key是否为表配置的属性
	public boolean isContainsFieled(String tableName,String fieledName){
		boolean flag = false;
		if(getAllFieldByTableName(tableName).containsKey(fieledName)){
			flag = true;
		}
		return flag;
	}
	/**
	 * sql值替换
	 * @param sql
	 * @param params
	 * @return
	 */
	public String formateSQl(String sql, Map<String, Object> params) {
		sql = replaceExtendSqlSysVar(sql);
		if (params == null) {
			return sql;
		}
		if(sql.toLowerCase().indexOf(CgAutoListConstant.SQL_INSERT)!=-1){
			sql = sql.replace("#{UUID}", UUIDGenerator.generate());
		}
		for (String key : params.keySet()) {
//            sql = sql.replace("${" + key + "}", "'"+String.valueOf(params.get(key))+"'");
			sql = sql.replace("#{" + key + "}",String.valueOf(params.get(key)));
		}
		return sql;
	}
	
}




