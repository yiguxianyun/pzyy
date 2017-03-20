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
@Table(name = "NSC数据表_供货", schema = "")
@SuppressWarnings("serial")
public class Nsc数据表供货Entity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**外键*/
	private java.lang.String wj;
	/**泵*/
	@Excel(name="泵")
	private java.lang.String 泵价;
	/**机封*/
	@Excel(name="机封")
	private java.lang.String 机封价;
	/**底座*/
	@Excel(name="底座")
	private java.lang.String 底座价;
	/**进/出口反法兰*/
	@Excel(name="进/出口反法兰")
	private java.lang.String 反法兰价;
	/**联轴器*/
	@Excel(name="联轴器")
	private java.lang.String 联轴器价;
	/**电或柴*/
	@Excel(name="电或柴")
	private java.lang.String 电或柴价;
	/**控制柜*/
	@Excel(name="控制柜")
	private java.lang.String 控制柜价;
	/**单价*/
	@Excel(name="单价")
	private java.lang.String 单价;
	/**总价*/
	@Excel(name="总价")
	private java.lang.String 总价;
	/**有无_泵价*/
	@Excel(name="有无_泵价")
	private java.lang.String 有无泵价;
	/**有无_机封价*/
	@Excel(name="有无_机封价")
	private java.lang.String 有无机封价;
	/**有无_底座价*/
	@Excel(name="有无_底座价")
	private java.lang.String 有无底座价;
	/**有无_反法兰价*/
	@Excel(name="有无_反法兰价")
	private java.lang.String 有无反法兰价;
	/**有无_联轴器价*/
	@Excel(name="有无_联轴器价")
	private java.lang.String 有无联轴器价;
	/**有无_电或柴价*/
	@Excel(name="有无_电或柴价")
	private java.lang.String 有无电或柴价;
	/**有无_控制柜价*/
	@Excel(name="有无_控制柜价")
	private java.lang.String 有无控制柜价;
	/**包装方式*/
	@Excel(name="包装方式")
	private java.lang.String 包装方式;
	/**运输方式*/
	@Excel(name="运输方式")
	private java.lang.String 运输方式;
	/**油漆颜色*/
	@Excel(name="油漆颜色")
	private java.lang.String 油漆颜色;
	/**其他附件和配件*/
	@Excel(name="其他附件和配件")
	private java.lang.String 附配件;
	
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
	 *@return: java.lang.String  泵
	 */
	@Column(name ="泵价",nullable=true,length=32)
	public java.lang.String get泵价(){
		return this.泵价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  泵
	 */
	public void set泵价(java.lang.String 泵价){
		this.泵价 = 泵价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  机封
	 */
	@Column(name ="机封价",nullable=true,length=32)
	public java.lang.String get机封价(){
		return this.机封价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  机封
	 */
	public void set机封价(java.lang.String 机封价){
		this.机封价 = 机封价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  底座
	 */
	@Column(name ="底座价",nullable=true,length=32)
	public java.lang.String get底座价(){
		return this.底座价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  底座
	 */
	public void set底座价(java.lang.String 底座价){
		this.底座价 = 底座价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  进/出口反法兰
	 */
	@Column(name ="反法兰价",nullable=true,length=32)
	public java.lang.String get反法兰价(){
		return this.反法兰价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  进/出口反法兰
	 */
	public void set反法兰价(java.lang.String 反法兰价){
		this.反法兰价 = 反法兰价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联轴器
	 */
	@Column(name ="联轴器价",nullable=true,length=32)
	public java.lang.String get联轴器价(){
		return this.联轴器价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联轴器
	 */
	public void set联轴器价(java.lang.String 联轴器价){
		this.联轴器价 = 联轴器价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电或柴
	 */
	@Column(name ="电或柴价",nullable=true,length=32)
	public java.lang.String get电或柴价(){
		return this.电或柴价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电或柴
	 */
	public void set电或柴价(java.lang.String 电或柴价){
		this.电或柴价 = 电或柴价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  控制柜
	 */
	@Column(name ="控制柜价",nullable=true,length=32)
	public java.lang.String get控制柜价(){
		return this.控制柜价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  控制柜
	 */
	public void set控制柜价(java.lang.String 控制柜价){
		this.控制柜价 = 控制柜价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  单价
	 */
	@Column(name ="单价",nullable=true,length=32)
	public java.lang.String get单价(){
		return this.单价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  单价
	 */
	public void set单价(java.lang.String 单价){
		this.单价 = 单价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  总价
	 */
	@Column(name ="总价",nullable=true,length=32)
	public java.lang.String get总价(){
		return this.总价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  总价
	 */
	public void set总价(java.lang.String 总价){
		this.总价 = 总价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  有无_泵价
	 */
	@Column(name ="有无_泵价",nullable=true,length=32)
	public java.lang.String get有无泵价(){
		return this.有无泵价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  有无_泵价
	 */
	public void set有无泵价(java.lang.String 有无泵价){
		this.有无泵价 = 有无泵价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  有无_机封价
	 */
	@Column(name ="有无_机封价",nullable=true,length=32)
	public java.lang.String get有无机封价(){
		return this.有无机封价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  有无_机封价
	 */
	public void set有无机封价(java.lang.String 有无机封价){
		this.有无机封价 = 有无机封价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  有无_底座价
	 */
	@Column(name ="有无_底座价",nullable=true,length=32)
	public java.lang.String get有无底座价(){
		return this.有无底座价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  有无_底座价
	 */
	public void set有无底座价(java.lang.String 有无底座价){
		this.有无底座价 = 有无底座价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  有无_反法兰价
	 */
	@Column(name ="有无_反法兰价",nullable=true,length=32)
	public java.lang.String get有无反法兰价(){
		return this.有无反法兰价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  有无_反法兰价
	 */
	public void set有无反法兰价(java.lang.String 有无反法兰价){
		this.有无反法兰价 = 有无反法兰价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  有无_联轴器价
	 */
	@Column(name ="有无_联轴器价",nullable=true,length=32)
	public java.lang.String get有无联轴器价(){
		return this.有无联轴器价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  有无_联轴器价
	 */
	public void set有无联轴器价(java.lang.String 有无联轴器价){
		this.有无联轴器价 = 有无联轴器价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  有无_电或柴价
	 */
	@Column(name ="有无_电或柴价",nullable=true,length=32)
	public java.lang.String get有无电或柴价(){
		return this.有无电或柴价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  有无_电或柴价
	 */
	public void set有无电或柴价(java.lang.String 有无电或柴价){
		this.有无电或柴价 = 有无电或柴价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  有无_控制柜价
	 */
	@Column(name ="有无_控制柜价",nullable=true,length=32)
	public java.lang.String get有无控制柜价(){
		return this.有无控制柜价;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  有无_控制柜价
	 */
	public void set有无控制柜价(java.lang.String 有无控制柜价){
		this.有无控制柜价 = 有无控制柜价;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  包装方式
	 */
	@Column(name ="包装方式",nullable=true,length=32)
	public java.lang.String get包装方式(){
		return this.包装方式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  包装方式
	 */
	public void set包装方式(java.lang.String 包装方式){
		this.包装方式 = 包装方式;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  运输方式
	 */
	@Column(name ="运输方式",nullable=true,length=32)
	public java.lang.String get运输方式(){
		return this.运输方式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  运输方式
	 */
	public void set运输方式(java.lang.String 运输方式){
		this.运输方式 = 运输方式;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  油漆颜色
	 */
	@Column(name ="油漆颜色",nullable=true,length=32)
	public java.lang.String get油漆颜色(){
		return this.油漆颜色;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  油漆颜色
	 */
	public void set油漆颜色(java.lang.String 油漆颜色){
		this.油漆颜色 = 油漆颜色;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  其他附件和配件
	 */
	@Column(name ="附配件",nullable=true,length=32)
	public java.lang.String get附配件(){
		return this.附配件;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  其他附件和配件
	 */
	public void set附配件(java.lang.String 附配件){
		this.附配件 = 附配件;
	}
}
