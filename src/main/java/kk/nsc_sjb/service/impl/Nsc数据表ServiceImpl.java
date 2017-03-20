package kk.nsc_sjb.service.impl;
import kk.nsc_sjb.service.Nsc数据表ServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import kk.nsc_sjb.entity.Nsc数据表Entity;
import kk.nsc_sjb.entity.Nsc数据表结构参数Entity;
import kk.nsc_sjb.entity.Nsc数据表材质Entity;
import kk.nsc_sjb.entity.Nsc数据表性能Entity;
import kk.nsc_sjb.entity.Nsc数据表供货Entity;
import kk.nsc_sjb.entity.Nsc数据表原动机Entity;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import java.util.ArrayList;
import java.util.UUID;
import java.io.Serializable;


@Service("nsc数据表Service")
@Transactional
public class Nsc数据表ServiceImpl extends CommonServiceImpl implements Nsc数据表ServiceI {
	
 	public <T> void delete(T entity) {
 		super.delete(entity);
 		//执行删除操作配置的sql增强
		this.doDelSql((Nsc数据表Entity)entity);
 	}
	
	public void addMain(Nsc数据表Entity nsc数据表,
	        List<Nsc数据表结构参数Entity> nsc数据表结构参数List,List<Nsc数据表材质Entity> nsc数据表材质List,List<Nsc数据表性能Entity> nsc数据表性能List,List<Nsc数据表供货Entity> nsc数据表供货List,List<Nsc数据表原动机Entity> nsc数据表原动机List){
			//保存主信息
			this.save(nsc数据表);
		
			/**保存-NSC数据表*/
			for(Nsc数据表结构参数Entity nsc数据表结构参数:nsc数据表结构参数List){
				//外键设置
				nsc数据表结构参数.setWj(nsc数据表.getId());
				this.save(nsc数据表结构参数);
			}
			/**保存-NSC数据表*/
			for(Nsc数据表材质Entity nsc数据表材质:nsc数据表材质List){
				//外键设置
				nsc数据表材质.setWj(nsc数据表.getId());
				this.save(nsc数据表材质);
			}
			/**保存-NSC数据表*/
			for(Nsc数据表性能Entity nsc数据表性能:nsc数据表性能List){
				//外键设置
				nsc数据表性能.setWj(nsc数据表.getId());
				this.save(nsc数据表性能);
			}
			/**保存-NSC数据表*/
			for(Nsc数据表供货Entity nsc数据表供货:nsc数据表供货List){
				//外键设置
				nsc数据表供货.setWj(nsc数据表.getId());
				this.save(nsc数据表供货);
			}
			/**保存-NSC数据表*/
			for(Nsc数据表原动机Entity nsc数据表原动机:nsc数据表原动机List){
				//外键设置
				nsc数据表原动机.setWj(nsc数据表.getId());
				this.save(nsc数据表原动机);
			}
			//执行新增操作配置的sql增强
 			this.doAddSql(nsc数据表);
	}

	
	public void updateMain(Nsc数据表Entity nsc数据表,
	        List<Nsc数据表结构参数Entity> nsc数据表结构参数List,List<Nsc数据表材质Entity> nsc数据表材质List,List<Nsc数据表性能Entity> nsc数据表性能List,List<Nsc数据表供货Entity> nsc数据表供货List,List<Nsc数据表原动机Entity> nsc数据表原动机List) {
		//保存主表信息
		this.saveOrUpdate(nsc数据表);
		//===================================================================================
		//获取参数
		Object wJ0 = nsc数据表.getId();
		Object wJ1 = nsc数据表.getId();
		Object wJ2 = nsc数据表.getId();
		Object wJ3 = nsc数据表.getId();
		Object wJ4 = nsc数据表.getId();
		//===================================================================================
		//1.查询出数据库的明细数据-NSC数据表
	    String hql0 = "from Nsc数据表结构参数Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表结构参数Entity> nsc数据表结构参数OldList = this.findHql(hql0,wJ0);
		//2.筛选更新明细数据-NSC数据表
		if(nsc数据表结构参数List!=null&&nsc数据表结构参数List.size()>0){
		for(Nsc数据表结构参数Entity oldE:nsc数据表结构参数OldList){
			boolean isUpdate = false;
				for(Nsc数据表结构参数Entity sendE:nsc数据表结构参数List){
					//需要更新的明细数据-NSC数据表
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-NSC数据表
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-NSC数据表
			for(Nsc数据表结构参数Entity nsc数据表结构参数:nsc数据表结构参数List){
				if(oConvertUtils.isEmpty(nsc数据表结构参数.getId())){
					//外键设置
					nsc数据表结构参数.setWj(nsc数据表.getId());
					this.save(nsc数据表结构参数);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-NSC数据表
	    String hql1 = "from Nsc数据表材质Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表材质Entity> nsc数据表材质OldList = this.findHql(hql1,wJ1);
		//2.筛选更新明细数据-NSC数据表
		if(nsc数据表材质List!=null&&nsc数据表材质List.size()>0){
		for(Nsc数据表材质Entity oldE:nsc数据表材质OldList){
			boolean isUpdate = false;
				for(Nsc数据表材质Entity sendE:nsc数据表材质List){
					//需要更新的明细数据-NSC数据表
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-NSC数据表
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-NSC数据表
			for(Nsc数据表材质Entity nsc数据表材质:nsc数据表材质List){
				if(oConvertUtils.isEmpty(nsc数据表材质.getId())){
					//外键设置
					nsc数据表材质.setWj(nsc数据表.getId());
					this.save(nsc数据表材质);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-NSC数据表
	    String hql2 = "from Nsc数据表性能Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表性能Entity> nsc数据表性能OldList = this.findHql(hql2,wJ2);
		//2.筛选更新明细数据-NSC数据表
		if(nsc数据表性能List!=null&&nsc数据表性能List.size()>0){
		for(Nsc数据表性能Entity oldE:nsc数据表性能OldList){
			boolean isUpdate = false;
				for(Nsc数据表性能Entity sendE:nsc数据表性能List){
					//需要更新的明细数据-NSC数据表
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-NSC数据表
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-NSC数据表
			for(Nsc数据表性能Entity nsc数据表性能:nsc数据表性能List){
				if(oConvertUtils.isEmpty(nsc数据表性能.getId())){
					//外键设置
					nsc数据表性能.setWj(nsc数据表.getId());
					this.save(nsc数据表性能);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-NSC数据表
	    String hql3 = "from Nsc数据表供货Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表供货Entity> nsc数据表供货OldList = this.findHql(hql3,wJ3);
		//2.筛选更新明细数据-NSC数据表
		if(nsc数据表供货List!=null&&nsc数据表供货List.size()>0){
		for(Nsc数据表供货Entity oldE:nsc数据表供货OldList){
			boolean isUpdate = false;
				for(Nsc数据表供货Entity sendE:nsc数据表供货List){
					//需要更新的明细数据-NSC数据表
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-NSC数据表
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-NSC数据表
			for(Nsc数据表供货Entity nsc数据表供货:nsc数据表供货List){
				if(oConvertUtils.isEmpty(nsc数据表供货.getId())){
					//外键设置
					nsc数据表供货.setWj(nsc数据表.getId());
					this.save(nsc数据表供货);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-NSC数据表
	    String hql4 = "from Nsc数据表原动机Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表原动机Entity> nsc数据表原动机OldList = this.findHql(hql4,wJ4);
		//2.筛选更新明细数据-NSC数据表
		if(nsc数据表原动机List!=null&&nsc数据表原动机List.size()>0){
		for(Nsc数据表原动机Entity oldE:nsc数据表原动机OldList){
			boolean isUpdate = false;
				for(Nsc数据表原动机Entity sendE:nsc数据表原动机List){
					//需要更新的明细数据-NSC数据表
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-NSC数据表
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-NSC数据表
			for(Nsc数据表原动机Entity nsc数据表原动机:nsc数据表原动机List){
				if(oConvertUtils.isEmpty(nsc数据表原动机.getId())){
					//外键设置
					nsc数据表原动机.setWj(nsc数据表.getId());
					this.save(nsc数据表原动机);
				}
			}
		}
		//执行更新操作配置的sql增强
 		this.doUpdateSql(nsc数据表);
	}

	
	public void delMain(Nsc数据表Entity nsc数据表) {
		//删除主表信息
		this.delete(nsc数据表);
		//===================================================================================
		//获取参数
		Object wJ0 = nsc数据表.getId();
		Object wJ1 = nsc数据表.getId();
		Object wJ2 = nsc数据表.getId();
		Object wJ3 = nsc数据表.getId();
		Object wJ4 = nsc数据表.getId();
		//===================================================================================
		//删除-NSC数据表
	    String hql0 = "from Nsc数据表结构参数Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表结构参数Entity> nsc数据表结构参数OldList = this.findHql(hql0,wJ0);
		this.deleteAllEntitie(nsc数据表结构参数OldList);
		//===================================================================================
		//删除-NSC数据表
	    String hql1 = "from Nsc数据表材质Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表材质Entity> nsc数据表材质OldList = this.findHql(hql1,wJ1);
		this.deleteAllEntitie(nsc数据表材质OldList);
		//===================================================================================
		//删除-NSC数据表
	    String hql2 = "from Nsc数据表性能Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表性能Entity> nsc数据表性能OldList = this.findHql(hql2,wJ2);
		this.deleteAllEntitie(nsc数据表性能OldList);
		//===================================================================================
		//删除-NSC数据表
	    String hql3 = "from Nsc数据表供货Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表供货Entity> nsc数据表供货OldList = this.findHql(hql3,wJ3);
		this.deleteAllEntitie(nsc数据表供货OldList);
		//===================================================================================
		//删除-NSC数据表
	    String hql4 = "from Nsc数据表原动机Entity where 1 = 1 AND wJ = ? ";
	    List<Nsc数据表原动机Entity> nsc数据表原动机OldList = this.findHql(hql4,wJ4);
		this.deleteAllEntitie(nsc数据表原动机OldList);
	}
	
 	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(Nsc数据表Entity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(Nsc数据表Entity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(Nsc数据表Entity t){
	 	return true;
 	}
 	
 	/**
	 * 替换sql中的变量
	 * @param sql
	 * @return
	 */
 	public String replaceVal(String sql,Nsc数据表Entity t){
 		sql  = sql.replace("#{id}",String.valueOf(t.getId()));
 		sql  = sql.replace("#{update_name}",String.valueOf(t.getUpdateName()));
 		sql  = sql.replace("#{update_time}",String.valueOf(t.getUpdateTime()));
 		sql  = sql.replace("#{数据表编号}",String.valueOf(t.get数据表编号()));
 		sql  = sql.replace("#{泵组序号}",String.valueOf(t.get泵组序号()));
 		sql  = sql.replace("#{数据表版本}",String.valueOf(t.get数据表版本()));
 		sql  = sql.replace("#{项目名称}",String.valueOf(t.get项目名称()));
 		sql  = sql.replace("#{客户单位}",String.valueOf(t.get客户单位()));
 		sql  = sql.replace("#{泵组类型}",String.valueOf(t.get泵组类型()));
 		sql  = sql.replace("#{需要台数}",String.valueOf(t.get需要台数()));
 		sql  = sql.replace("#{操作_备用}",String.valueOf(t.get操作备用()));
 		sql  = sql.replace("#{泵型号}",String.valueOf(t.get泵型号()));
 		sql  = sql.replace("#{流量}",String.valueOf(t.get流量()));
 		sql  = sql.replace("#{扬程}",String.valueOf(t.get扬程()));
 		sql  = sql.replace("#{输送介质}",String.valueOf(t.get输送介质()));
 		sql  = sql.replace("#{操作温度}",String.valueOf(t.get操作温度()));
 		sql  = sql.replace("#{密度}",String.valueOf(t.get密度()));
 		sql  = sql.replace("#{入口压力}",String.valueOf(t.get入口压力()));
 		sql  = sql.replace("#{出口压力}",String.valueOf(t.get出口压力()));
 		sql  = sql.replace("#{腐蚀}",String.valueOf(t.get腐蚀()));
 		sql  = sql.replace("#{粘度}",String.valueOf(t.get粘度()));
 		sql  = sql.replace("#{固体颗粒}",String.valueOf(t.get固体颗粒()));
 		sql  = sql.replace("#{安装位置}",String.valueOf(t.get安装位置()));
 		sql  = sql.replace("#{海拔高度}",String.valueOf(t.get海拔高度()));
 		sql  = sql.replace("#{运行条件}",String.valueOf(t.get运行条件()));
 		sql  = sql.replace("#{销售人员}",String.valueOf(t.get销售人员()));
 		sql  = sql.replace("#{销售人员日期}",String.valueOf(t.get销售人员日期()));
 		sql  = sql.replace("#{技术支持}",String.valueOf(t.get技术支持()));
 		sql  = sql.replace("#{技术支持日期}",String.valueOf(t.get技术支持日期()));
 		sql  = sql.replace("#{sys_org_code}",String.valueOf(t.getSysOrgCode()));
 		sql  = sql.replace("#{create_by}",String.valueOf(t.getCreateBy()));
 		sql  = sql.replace("#{UUID}",UUID.randomUUID().toString());
 		return sql;
 	}
}