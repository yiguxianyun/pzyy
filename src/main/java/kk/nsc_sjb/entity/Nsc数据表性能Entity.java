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
@Table(name = "NSC数据表_性能", schema = "")
@SuppressWarnings("serial")
public class Nsc数据表性能Entity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**外键*/
	private java.lang.String wj;
	/**额定点流量m3/h*/
	@Excel(name="额定点流量m3/h")
	private java.lang.String 额定点流量;
	/**额定点扬程m*/
	@Excel(name="额定点扬程m")
	private java.lang.String 额定点扬程;
	/**额定点效率%*/
	@Excel(name="额定点效率%")
	private java.lang.String 额定点效率;
	/**额定点轴功率kW*/
	@Excel(name="额定点轴功率kW")
	private java.lang.String 额定点轴功率;
	/**额定点必需汽蚀余量m*/
	@Excel(name="额定点必需汽蚀余量m")
	private java.lang.String 额定点必需汽蚀余量;
	/**转速r/min*/
	@Excel(name="转速r/min")
	private java.lang.String 转速;
	/**最小连续流量m3/h*/
	@Excel(name="最小连续流量m3/h")
	private java.lang.String 最小连续流量;
	/**最大流量m3/h*/
	@Excel(name="最大流量m3/h")
	private java.lang.String 最大流量;
	/**关闭点扬程m*/
	@Excel(name="关闭点扬程m")
	private java.lang.String 关闭点扬程;
	
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
	 *@return: java.lang.String  额定点流量m3/h
	 */
	@Column(name ="额定点流量",nullable=true,length=32)
	public java.lang.String get额定点流量(){
		return this.额定点流量;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  额定点流量m3/h
	 */
	public void set额定点流量(java.lang.String 额定点流量){
		this.额定点流量 = 额定点流量;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  额定点扬程m
	 */
	@Column(name ="额定点扬程",nullable=true,length=32)
	public java.lang.String get额定点扬程(){
		return this.额定点扬程;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  额定点扬程m
	 */
	public void set额定点扬程(java.lang.String 额定点扬程){
		this.额定点扬程 = 额定点扬程;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  额定点效率%
	 */
	@Column(name ="额定点效率",nullable=true,length=32)
	public java.lang.String get额定点效率(){
		return this.额定点效率;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  额定点效率%
	 */
	public void set额定点效率(java.lang.String 额定点效率){
		this.额定点效率 = 额定点效率;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  额定点轴功率kW
	 */
	@Column(name ="额定点轴功率",nullable=true,length=32)
	public java.lang.String get额定点轴功率(){
		return this.额定点轴功率;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  额定点轴功率kW
	 */
	public void set额定点轴功率(java.lang.String 额定点轴功率){
		this.额定点轴功率 = 额定点轴功率;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  额定点必需汽蚀余量m
	 */
	@Column(name ="额定点必需汽蚀余量",nullable=true,length=32)
	public java.lang.String get额定点必需汽蚀余量(){
		return this.额定点必需汽蚀余量;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  额定点必需汽蚀余量m
	 */
	public void set额定点必需汽蚀余量(java.lang.String 额定点必需汽蚀余量){
		this.额定点必需汽蚀余量 = 额定点必需汽蚀余量;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  转速r/min
	 */
	@Column(name ="转速",nullable=true,length=32)
	public java.lang.String get转速(){
		return this.转速;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  转速r/min
	 */
	public void set转速(java.lang.String 转速){
		this.转速 = 转速;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  最小连续流量m3/h
	 */
	@Column(name ="最小连续流量",nullable=true,length=32)
	public java.lang.String get最小连续流量(){
		return this.最小连续流量;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  最小连续流量m3/h
	 */
	public void set最小连续流量(java.lang.String 最小连续流量){
		this.最小连续流量 = 最小连续流量;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  最大流量m3/h
	 */
	@Column(name ="最大流量",nullable=true,length=32)
	public java.lang.String get最大流量(){
		return this.最大流量;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  最大流量m3/h
	 */
	public void set最大流量(java.lang.String 最大流量){
		this.最大流量 = 最大流量;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  关闭点扬程m
	 */
	@Column(name ="关闭点扬程",nullable=true,length=32)
	public java.lang.String get关闭点扬程(){
		return this.关闭点扬程;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  关闭点扬程m
	 */
	public void set关闭点扬程(java.lang.String 关闭点扬程){
		this.关闭点扬程 = 关闭点扬程;
	}
}
