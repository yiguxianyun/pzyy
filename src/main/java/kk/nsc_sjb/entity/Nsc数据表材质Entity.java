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
@Table(name = "NSC数据表_材质", schema = "")
@SuppressWarnings("serial")
public class Nsc数据表材质Entity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**外键*/
	private java.lang.String wj;
	/**泵体泵盖*/
	@Excel(name="泵体泵盖")
	private java.lang.String 泵体泵盖;
	/**叶轮*/
	@Excel(name="叶轮")
	private java.lang.String 叶轮;
	/**主轴*/
	@Excel(name="主轴")
	private java.lang.String 主轴;
	/**轴套*/
	@Excel(name="轴套")
	private java.lang.String 轴套;
	/**密封环*/
	@Excel(name="密封环")
	private java.lang.String 密封环;
	/**轴承*/
	@Excel(name="轴承")
	private java.lang.String 轴承;
	/**轴封*/
	@Excel(name="轴封")
	private java.lang.String 轴封;
	/**材质特殊要求*/
	@Excel(name="材质特殊要求")
	private java.lang.String 材质特殊要求;
	
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
	 *@return: java.lang.String  泵体泵盖
	 */
	@Column(name ="泵体泵盖",nullable=true,length=32)
	public java.lang.String get泵体泵盖(){
		return this.泵体泵盖;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  泵体泵盖
	 */
	public void set泵体泵盖(java.lang.String 泵体泵盖){
		this.泵体泵盖 = 泵体泵盖;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  叶轮
	 */
	@Column(name ="叶轮",nullable=true,length=32)
	public java.lang.String get叶轮(){
		return this.叶轮;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  叶轮
	 */
	public void set叶轮(java.lang.String 叶轮){
		this.叶轮 = 叶轮;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主轴
	 */
	@Column(name ="主轴",nullable=true,length=32)
	public java.lang.String get主轴(){
		return this.主轴;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主轴
	 */
	public void set主轴(java.lang.String 主轴){
		this.主轴 = 主轴;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  轴套
	 */
	@Column(name ="轴套",nullable=true,length=32)
	public java.lang.String get轴套(){
		return this.轴套;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  轴套
	 */
	public void set轴套(java.lang.String 轴套){
		this.轴套 = 轴套;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  密封环
	 */
	@Column(name ="密封环",nullable=true,length=32)
	public java.lang.String get密封环(){
		return this.密封环;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  密封环
	 */
	public void set密封环(java.lang.String 密封环){
		this.密封环 = 密封环;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  轴承
	 */
	@Column(name ="轴承",nullable=true,length=32)
	public java.lang.String get轴承(){
		return this.轴承;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  轴承
	 */
	public void set轴承(java.lang.String 轴承){
		this.轴承 = 轴承;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  轴封
	 */
	@Column(name ="轴封",nullable=true,length=32)
	public java.lang.String get轴封(){
		return this.轴封;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  轴封
	 */
	public void set轴封(java.lang.String 轴封){
		this.轴封 = 轴封;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  材质特殊要求
	 */
	@Column(name ="材质特殊要求",nullable=true,length=500)
	public java.lang.String get材质特殊要求(){
		return this.材质特殊要求;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  材质特殊要求
	 */
	public void set材质特殊要求(java.lang.String 材质特殊要求){
		this.材质特殊要求 = 材质特殊要求;
	}
}
