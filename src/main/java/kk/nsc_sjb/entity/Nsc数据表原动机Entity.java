package kk.nsc_sjb.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.lang.String;
import java.lang.Double;
import java.lang.Integer;
import java.math.BigDecimal;
import javax.xml.soap.Text;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: NSC数据表
 * @author onlineGenerator
 * @date 2017-02-17 11:51:58
 * @version V1.0   
 *
 */
@Entity
@Table(name = "NSC数据表_原动机", schema = "")
@SuppressWarnings("serial")
public class Nsc数据表原动机Entity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**外键*/
	private java.lang.String wj;
	/**原动机厂家*/
	@Excel(name="原动机厂家")
	private java.lang.String 原动机厂家;
	/**原动机型号*/
	@Excel(name="原动机型号")
	private java.lang.String 原动机型号;
	/**电压或油箱*/
	@Excel(name="电压或油箱")
	private java.lang.String 电压或油箱;
	/**配套功率(kw)*/
	@Excel(name="配套功率(kw)")
	private java.lang.String 配套功率;
	/**转速(r/min)     */
	@Excel(name="转速(r/min)     ")
	private java.lang.String 原动机转速;
	/**IP或材质*/
	@Excel(name="IP或材质")
	private java.lang.String ip或材质;
	/**启动或冷却方式*/
	@Excel(name="启动或冷却方式")
	private java.lang.String 启动或冷却方式;
	/**接线盒进线方式/个数*/
	@Excel(name="接线盒进线方式/个数")
	private java.lang.String 接线盒;
	/**最高工作温度(℃)*/
	@Excel(name="最高工作温度(℃)")
	private java.lang.String 最高工作温度;
	/**其它条件(特殊要求)*/
	@Excel(name="其它条件(特殊要求)")
	private java.lang.String 其它条件;
	/**极数*/
	@Excel(name="极数")
	private java.lang.String 电机极数;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
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
	 *@return: java.lang.String  外键
	 */
	@Column(name ="WJ",nullable=true,length=32)
	public java.lang.String getWj(){
		return this.wj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外键
	 */
	public void setWj(java.lang.String wj){
		this.wj = wj;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原动机厂家
	 */
	@Column(name ="原动机厂家",nullable=true,length=32)
	public java.lang.String get原动机厂家(){
		return this.原动机厂家;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原动机厂家
	 */
	public void set原动机厂家(java.lang.String 原动机厂家){
		this.原动机厂家 = 原动机厂家;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原动机型号
	 */
	@Column(name ="原动机型号",nullable=true,length=32)
	public java.lang.String get原动机型号(){
		return this.原动机型号;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原动机型号
	 */
	public void set原动机型号(java.lang.String 原动机型号){
		this.原动机型号 = 原动机型号;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电压或油箱
	 */
	@Column(name ="电压或油箱",nullable=true,length=32)
	public java.lang.String get电压或油箱(){
		return this.电压或油箱;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电压或油箱
	 */
	public void set电压或油箱(java.lang.String 电压或油箱){
		this.电压或油箱 = 电压或油箱;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  配套功率(kw)
	 */
	@Column(name ="配套功率",nullable=true,length=32)
	public java.lang.String get配套功率(){
		return this.配套功率;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  配套功率(kw)
	 */
	public void set配套功率(java.lang.String 配套功率){
		this.配套功率 = 配套功率;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  转速(r/min)     
	 */
	@Column(name ="原动机转速",nullable=true,length=32)
	public java.lang.String get原动机转速(){
		return this.原动机转速;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  转速(r/min)     
	 */
	public void set原动机转速(java.lang.String 原动机转速){
		this.原动机转速 = 原动机转速;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  IP或材质
	 */
	@Column(name ="IP或材质",nullable=true,length=32)
	public java.lang.String getIp或材质(){
		return this.ip或材质;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  IP或材质
	 */
	public void setIp或材质(java.lang.String ip或材质){
		this.ip或材质 = ip或材质;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  启动或冷却方式
	 */
	@Column(name ="启动或冷却方式",nullable=true,length=32)
	public java.lang.String get启动或冷却方式(){
		return this.启动或冷却方式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  启动或冷却方式
	 */
	public void set启动或冷却方式(java.lang.String 启动或冷却方式){
		this.启动或冷却方式 = 启动或冷却方式;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  接线盒进线方式/个数
	 */
	@Column(name ="接线盒",nullable=true,length=32)
	public java.lang.String get接线盒(){
		return this.接线盒;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  接线盒进线方式/个数
	 */
	public void set接线盒(java.lang.String 接线盒){
		this.接线盒 = 接线盒;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  最高工作温度(℃)
	 */
	@Column(name ="最高工作温度",nullable=true,length=32)
	public java.lang.String get最高工作温度(){
		return this.最高工作温度;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  最高工作温度(℃)
	 */
	public void set最高工作温度(java.lang.String 最高工作温度){
		this.最高工作温度 = 最高工作温度;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  其它条件(特殊要求)
	 */
	@Column(name ="其它条件",nullable=true,length=32)
	public java.lang.String get其它条件(){
		return this.其它条件;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  其它条件(特殊要求)
	 */
	public void set其它条件(java.lang.String 其它条件){
		this.其它条件 = 其它条件;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  极数
	 */
	@Column(name ="电机极数",nullable=true,length=32)
	public java.lang.String get电机极数(){
		return this.电机极数;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  极数
	 */
	public void set电机极数(java.lang.String 电机极数){
		this.电机极数 = 电机极数;
	}
}
