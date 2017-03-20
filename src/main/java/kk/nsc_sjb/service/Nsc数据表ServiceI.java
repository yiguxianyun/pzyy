package kk.nsc_sjb.service;
import kk.nsc_sjb.entity.Nsc数据表Entity;
import kk.nsc_sjb.entity.Nsc数据表结构参数Entity;
import kk.nsc_sjb.entity.Nsc数据表材质Entity;
import kk.nsc_sjb.entity.Nsc数据表性能Entity;
import kk.nsc_sjb.entity.Nsc数据表供货Entity;
import kk.nsc_sjb.entity.Nsc数据表原动机Entity;

import java.util.List;
import org.jeecgframework.core.common.service.CommonService;
import java.io.Serializable;

public interface Nsc数据表ServiceI extends CommonService{
	
 	public <T> void delete(T entity);
	/**
	 * 添加一对多
	 * 
	 */
	public void addMain(Nsc数据表Entity nsc数据表,
	        List<Nsc数据表结构参数Entity> nsc数据表结构参数List,List<Nsc数据表材质Entity> nsc数据表材质List,List<Nsc数据表性能Entity> nsc数据表性能List,List<Nsc数据表供货Entity> nsc数据表供货List,List<Nsc数据表原动机Entity> nsc数据表原动机List) ;
	/**
	 * 修改一对多
	 * 
	 */
	public void updateMain(Nsc数据表Entity nsc数据表,
	        List<Nsc数据表结构参数Entity> nsc数据表结构参数List,List<Nsc数据表材质Entity> nsc数据表材质List,List<Nsc数据表性能Entity> nsc数据表性能List,List<Nsc数据表供货Entity> nsc数据表供货List,List<Nsc数据表原动机Entity> nsc数据表原动机List);
	public void delMain (Nsc数据表Entity nsc数据表);
	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(Nsc数据表Entity t);
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(Nsc数据表Entity t);
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(Nsc数据表Entity t);
}
