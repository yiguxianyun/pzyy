
package kk.nsc_sjb.page;
import kk.nsc_sjb.entity.Nsc数据表Entity;
import kk.nsc_sjb.entity.Nsc数据表结构参数Entity;
import kk.nsc_sjb.entity.Nsc数据表材质Entity;
import kk.nsc_sjb.entity.Nsc数据表性能Entity;
import kk.nsc_sjb.entity.Nsc数据表供货Entity;
import kk.nsc_sjb.entity.Nsc数据表原动机Entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;
import org.jeecgframework.poi.excel.annotation.ExcelCollection;

/**   
 * @Title: Entity
 * @Description: NSC数据表
 * @author onlineGenerator
 * @date 2017-02-17 11:51:58
 * @version V1.0   
 *
 */
public class Nsc数据表Page implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**更新人名称*/
	private java.lang.String updateName;
	/**更新时间*/
	private java.util.Date updateTime;
	/**数据表编号*/
    @Excel(name="数据表编号")
	private java.lang.String 数据表编号;
	/**泵组序号*/
    @Excel(name="泵组序号")
	private java.lang.String 泵组序号;
	/**数据表版本*/
    @Excel(name="数据表版本")
	private java.lang.String 数据表版本;
	/**项目名称*/
    @Excel(name="项目名称")
	private java.lang.String 项目名称;
	/**客户单位*/
    @Excel(name="客户单位")
	private java.lang.String 客户单位;
	/**泵组类型*/
    @Excel(name="泵组类型")
	private java.lang.String 泵组类型;
	/**需要台数*/
    @Excel(name="需要台数")
	private java.lang.String 需要台数;
	/**操作/备用*/
    @Excel(name="操作/备用")
	private java.lang.String 操作备用;
	/**泵型号*/
    @Excel(name="泵型号")
	private java.lang.String 泵型号;
	/**流量m3/h*/
    @Excel(name="流量m3/h")
	private java.lang.String 流量;
	/**扬程m*/
    @Excel(name="扬程m")
	private java.lang.String 扬程;
	/**输送介质*/
    @Excel(name="输送介质")
	private java.lang.String 输送介质;
	/**操作温度 正常/最高℃*/
    @Excel(name="操作温度 正常/最高℃")
	private java.lang.String 操作温度;
	/**操作温度下密度kg/dm3*/
    @Excel(name="操作温度下密度kg/dm3")
	private java.lang.String 密度;
	/**入口压力MPa*/
    @Excel(name="入口压力MPa")
	private java.lang.String 入口压力;
	/**出口压力MPa*/
    @Excel(name="出口压力MPa")
	private java.lang.String 出口压力;
	/**腐蚀成份和浓度ppm*/
    @Excel(name="腐蚀成份和浓度ppm")
	private java.lang.String 腐蚀;
	/**操作温度下粘度 cp*/
    @Excel(name="操作温度下粘度 cp")
	private java.lang.String 粘度;
	/**固体颗粒成份和含量ppm*/
    @Excel(name="固体颗粒成份和含量ppm")
	private java.lang.String 固体颗粒;
	/**安装位置*/
    @Excel(name="安装位置")
	private java.lang.String 安装位置;
	/**海拔高度m*/
    @Excel(name="海拔高度m")
	private java.lang.String 海拔高度;
	/**运行条件(是否防爆)*/
    @Excel(name="运行条件(是否防爆)")
	private java.lang.String 运行条件;
	/**销售人员*/
    @Excel(name="销售人员")
	private java.lang.String 销售人员;
	/**销售人员日期*/
    @Excel(name="销售人员日期")
	private java.lang.String 销售人员日期;
	/**技术支持*/
    @Excel(name="技术支持")
	private java.lang.String 技术支持;
	/**技术支持日期*/
    @Excel(name="技术支持日期")
	private java.lang.String 技术支持日期;
	/**部门*/
	private java.lang.String sysOrgCode;
	/**创建者*/
	private java.lang.String createBy;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人名称
	 */
	public java.lang.String getUpdateName(){
		return this.updateName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人名称
	 */
	public void setUpdateName(java.lang.String updateName){
		this.updateName = updateName;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  更新时间
	 */
	public java.util.Date getUpdateTime(){
		return this.updateTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  更新时间
	 */
	public void setUpdateTime(java.util.Date updateTime){
		this.updateTime = updateTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  数据表编号
	 */
	public java.lang.String get数据表编号(){
		return this.数据表编号;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  数据表编号
	 */
	public void set数据表编号(java.lang.String 数据表编号){
		this.数据表编号 = 数据表编号;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  泵组序号
	 */
	public java.lang.String get泵组序号(){
		return this.泵组序号;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  泵组序号
	 */
	public void set泵组序号(java.lang.String 泵组序号){
		this.泵组序号 = 泵组序号;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  数据表版本
	 */
	public java.lang.String get数据表版本(){
		return this.数据表版本;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  数据表版本
	 */
	public void set数据表版本(java.lang.String 数据表版本){
		this.数据表版本 = 数据表版本;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  项目名称
	 */
	public java.lang.String get项目名称(){
		return this.项目名称;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  项目名称
	 */
	public void set项目名称(java.lang.String 项目名称){
		this.项目名称 = 项目名称;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  客户单位
	 */
	public java.lang.String get客户单位(){
		return this.客户单位;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  客户单位
	 */
	public void set客户单位(java.lang.String 客户单位){
		this.客户单位 = 客户单位;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  泵组类型
	 */
	public java.lang.String get泵组类型(){
		return this.泵组类型;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  泵组类型
	 */
	public void set泵组类型(java.lang.String 泵组类型){
		this.泵组类型 = 泵组类型;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  需要台数
	 */
	public java.lang.String get需要台数(){
		return this.需要台数;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  需要台数
	 */
	public void set需要台数(java.lang.String 需要台数){
		this.需要台数 = 需要台数;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  操作/备用
	 */
	public java.lang.String get操作备用(){
		return this.操作备用;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  操作/备用
	 */
	public void set操作备用(java.lang.String 操作备用){
		this.操作备用 = 操作备用;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  泵型号
	 */
	public java.lang.String get泵型号(){
		return this.泵型号;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  泵型号
	 */
	public void set泵型号(java.lang.String 泵型号){
		this.泵型号 = 泵型号;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  流量m3/h
	 */
	public java.lang.String get流量(){
		return this.流量;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  流量m3/h
	 */
	public void set流量(java.lang.String 流量){
		this.流量 = 流量;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  扬程m
	 */
	public java.lang.String get扬程(){
		return this.扬程;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  扬程m
	 */
	public void set扬程(java.lang.String 扬程){
		this.扬程 = 扬程;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  输送介质
	 */
	public java.lang.String get输送介质(){
		return this.输送介质;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  输送介质
	 */
	public void set输送介质(java.lang.String 输送介质){
		this.输送介质 = 输送介质;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  操作温度 正常/最高℃
	 */
	public java.lang.String get操作温度(){
		return this.操作温度;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  操作温度 正常/最高℃
	 */
	public void set操作温度(java.lang.String 操作温度){
		this.操作温度 = 操作温度;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  操作温度下密度kg/dm3
	 */
	public java.lang.String get密度(){
		return this.密度;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  操作温度下密度kg/dm3
	 */
	public void set密度(java.lang.String 密度){
		this.密度 = 密度;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  入口压力MPa
	 */
	public java.lang.String get入口压力(){
		return this.入口压力;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  入口压力MPa
	 */
	public void set入口压力(java.lang.String 入口压力){
		this.入口压力 = 入口压力;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  出口压力MPa
	 */
	public java.lang.String get出口压力(){
		return this.出口压力;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  出口压力MPa
	 */
	public void set出口压力(java.lang.String 出口压力){
		this.出口压力 = 出口压力;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  腐蚀成份和浓度ppm
	 */
	public java.lang.String get腐蚀(){
		return this.腐蚀;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  腐蚀成份和浓度ppm
	 */
	public void set腐蚀(java.lang.String 腐蚀){
		this.腐蚀 = 腐蚀;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  操作温度下粘度 cp
	 */
	public java.lang.String get粘度(){
		return this.粘度;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  操作温度下粘度 cp
	 */
	public void set粘度(java.lang.String 粘度){
		this.粘度 = 粘度;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  固体颗粒成份和含量ppm
	 */
	public java.lang.String get固体颗粒(){
		return this.固体颗粒;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  固体颗粒成份和含量ppm
	 */
	public void set固体颗粒(java.lang.String 固体颗粒){
		this.固体颗粒 = 固体颗粒;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  安装位置
	 */
	public java.lang.String get安装位置(){
		return this.安装位置;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  安装位置
	 */
	public void set安装位置(java.lang.String 安装位置){
		this.安装位置 = 安装位置;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  海拔高度m
	 */
	public java.lang.String get海拔高度(){
		return this.海拔高度;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  海拔高度m
	 */
	public void set海拔高度(java.lang.String 海拔高度){
		this.海拔高度 = 海拔高度;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  运行条件(是否防爆)
	 */
	public java.lang.String get运行条件(){
		return this.运行条件;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  运行条件(是否防爆)
	 */
	public void set运行条件(java.lang.String 运行条件){
		this.运行条件 = 运行条件;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  销售人员
	 */
	public java.lang.String get销售人员(){
		return this.销售人员;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  销售人员
	 */
	public void set销售人员(java.lang.String 销售人员){
		this.销售人员 = 销售人员;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  销售人员日期
	 */
	public java.lang.String get销售人员日期(){
		return this.销售人员日期;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  销售人员日期
	 */
	public void set销售人员日期(java.lang.String 销售人员日期){
		this.销售人员日期 = 销售人员日期;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  技术支持
	 */
	public java.lang.String get技术支持(){
		return this.技术支持;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  技术支持
	 */
	public void set技术支持(java.lang.String 技术支持){
		this.技术支持 = 技术支持;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  技术支持日期
	 */
	public java.lang.String get技术支持日期(){
		return this.技术支持日期;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  技术支持日期
	 */
	public void set技术支持日期(java.lang.String 技术支持日期){
		this.技术支持日期 = 技术支持日期;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  部门
	 */
	public java.lang.String getSysOrgCode(){
		return this.sysOrgCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  部门
	 */
	public void setSysOrgCode(java.lang.String sysOrgCode){
		this.sysOrgCode = sysOrgCode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建者
	 */
	public java.lang.String getCreateBy(){
		return this.createBy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建者
	 */
	public void setCreateBy(java.lang.String createBy){
		this.createBy = createBy;
	}

	/**保存-NSC数据表*/
    @ExcelCollection(name="NSC数据表")
	private List<Nsc数据表结构参数Entity> nsc数据表结构参数List = new ArrayList<Nsc数据表结构参数Entity>();
		public List<Nsc数据表结构参数Entity> getNsc数据表结构参数List() {
		return nsc数据表结构参数List;
		}
		public void setNsc数据表结构参数List(List<Nsc数据表结构参数Entity> nsc数据表结构参数List) {
		this.nsc数据表结构参数List = nsc数据表结构参数List;
		}
	/**保存-NSC数据表*/
    @ExcelCollection(name="NSC数据表")
	private List<Nsc数据表材质Entity> nsc数据表材质List = new ArrayList<Nsc数据表材质Entity>();
		public List<Nsc数据表材质Entity> getNsc数据表材质List() {
		return nsc数据表材质List;
		}
		public void setNsc数据表材质List(List<Nsc数据表材质Entity> nsc数据表材质List) {
		this.nsc数据表材质List = nsc数据表材质List;
		}
	/**保存-NSC数据表*/
    @ExcelCollection(name="NSC数据表")
	private List<Nsc数据表性能Entity> nsc数据表性能List = new ArrayList<Nsc数据表性能Entity>();
		public List<Nsc数据表性能Entity> getNsc数据表性能List() {
		return nsc数据表性能List;
		}
		public void setNsc数据表性能List(List<Nsc数据表性能Entity> nsc数据表性能List) {
		this.nsc数据表性能List = nsc数据表性能List;
		}
	/**保存-NSC数据表*/
    @ExcelCollection(name="NSC数据表")
	private List<Nsc数据表供货Entity> nsc数据表供货List = new ArrayList<Nsc数据表供货Entity>();
		public List<Nsc数据表供货Entity> getNsc数据表供货List() {
		return nsc数据表供货List;
		}
		public void setNsc数据表供货List(List<Nsc数据表供货Entity> nsc数据表供货List) {
		this.nsc数据表供货List = nsc数据表供货List;
		}
	/**保存-NSC数据表*/
    @ExcelCollection(name="NSC数据表")
	private List<Nsc数据表原动机Entity> nsc数据表原动机List = new ArrayList<Nsc数据表原动机Entity>();
		public List<Nsc数据表原动机Entity> getNsc数据表原动机List() {
		return nsc数据表原动机List;
		}
		public void setNsc数据表原动机List(List<Nsc数据表原动机Entity> nsc数据表原动机List) {
		this.nsc数据表原动机List = nsc数据表原动机List;
		}
}
