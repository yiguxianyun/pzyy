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
@Table(name = "NSC数据表_结构参数", schema = "")
@SuppressWarnings("serial")
public class Nsc数据表结构参数Entity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**外键*/
	private java.lang.String wj;
	/**安装方式*/
	@Excel(name="安装方式")
	private java.lang.String 安装方式;
	/**旋转方向（从驱动端看）*/
	@Excel(name="旋转方向（从驱动端看）")
	private java.lang.String 旋转方向;
	/**支撑方式*/
	@Excel(name="支撑方式")
	private java.lang.String 支撑方式;
	/**联轴器*/
	@Excel(name="联轴器")
	private java.lang.String 联轴器形式;
	/**底座*/
	@Excel(name="底座")
	private java.lang.String 底座形式;
	/**轴承及润滑方式*/
	@Excel(name="轴承及润滑方式")
	private java.lang.String 轴承及润滑方式;
	/**轴封方式*/
	@Excel(name="轴封方式")
	private java.lang.String 轴封方式;
	
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
	 *@return: java.lang.String  安装方式
	 */
	@Column(name ="安装方式",nullable=true,length=32)
	public java.lang.String get安装方式(){
		return this.安装方式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  安装方式
	 */
	public void set安装方式(java.lang.String 安装方式){
		this.安装方式 = 安装方式;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  旋转方向（从驱动端看）
	 */
	@Column(name ="旋转方向",nullable=true,length=32)
	public java.lang.String get旋转方向(){
		return this.旋转方向;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  旋转方向（从驱动端看）
	 */
	public void set旋转方向(java.lang.String 旋转方向){
		this.旋转方向 = 旋转方向;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  支撑方式
	 */
	@Column(name ="支撑方式",nullable=true,length=32)
	public java.lang.String get支撑方式(){
		return this.支撑方式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  支撑方式
	 */
	public void set支撑方式(java.lang.String 支撑方式){
		this.支撑方式 = 支撑方式;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联轴器
	 */
	@Column(name ="联轴器形式",nullable=true,length=32)
	public java.lang.String get联轴器形式(){
		return this.联轴器形式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联轴器
	 */
	public void set联轴器形式(java.lang.String 联轴器形式){
		this.联轴器形式 = 联轴器形式;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  底座
	 */
	@Column(name ="底座形式",nullable=true,length=32)
	public java.lang.String get底座形式(){
		return this.底座形式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  底座
	 */
	public void set底座形式(java.lang.String 底座形式){
		this.底座形式 = 底座形式;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  轴承及润滑方式
	 */
	@Column(name ="轴承及润滑方式",nullable=true,length=32)
	public java.lang.String get轴承及润滑方式(){
		return this.轴承及润滑方式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  轴承及润滑方式
	 */
	public void set轴承及润滑方式(java.lang.String 轴承及润滑方式){
		this.轴承及润滑方式 = 轴承及润滑方式;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  轴封方式
	 */
	@Column(name ="轴封方式",nullable=true,length=32)
	public java.lang.String get轴封方式(){
		return this.轴封方式;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  轴封方式
	 */
	public void set轴封方式(java.lang.String 轴封方式){
		this.轴封方式 = 轴封方式;
	}
}
