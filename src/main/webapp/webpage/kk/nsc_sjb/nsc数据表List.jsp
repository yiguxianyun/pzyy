<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="nsc数据表List" checkbox="true" fitColumns="false" title="NSC数据表" actionUrl="nsc数据表Controller.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"   query="true" queryMode="single"  width="90"></t:dgCol>
   <t:dgCol title="更新时间"  field="updateTime" formatter="yyyy-MM-dd hh:mm:ss"   queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="数据表编号"  field="数据表编号"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="泵组序号"  field="泵组序号"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="数据表版本"  field="数据表版本"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="项目名称"  field="项目名称"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="客户单位"  field="客户单位"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="泵组类型"  field="泵组类型"    queryMode="single" dictionary="NSC泵组类型" width="120"></t:dgCol>
   <t:dgCol title="需要台数"  field="需要台数"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作/备用"  field="操作备用"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="泵型号"  field="泵型号"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="流量m3/h"  field="流量"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="扬程m"  field="扬程"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="输送介质"  field="输送介质"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作温度 正常/最高℃"  field="操作温度"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作温度下密度kg/dm3"  field="密度"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="入口压力MPa"  field="入口压力"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="出口压力MPa"  field="出口压力"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="腐蚀成份和浓度ppm"  field="腐蚀"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作温度下粘度 cp"  field="粘度"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="固体颗粒成份和含量ppm"  field="固体颗粒"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="安装位置"  field="安装位置"    queryMode="single" dictionary="室内外" width="120"></t:dgCol>
   <t:dgCol title="海拔高度m"  field="海拔高度"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="运行条件(是否防爆)"  field="运行条件"    queryMode="single" dictionary="否是" width="120"></t:dgCol>
   <t:dgCol title="销售人员"  field="销售人员"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="销售人员日期"  field="销售人员日期" formatter="yyyy-MM-dd"   queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="技术支持"  field="技术支持"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="技术支持日期"  field="技术支持日期" formatter="yyyy-MM-dd"   queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="部门"  field="sysOrgCode"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建者"  field="createBy"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="nsc数据表Controller.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="nsc数据表Controller.do?goAdd" funname="add" width="100%" height="100%"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="nsc数据表Controller.do?goUpdate" funname="update" width="100%" height="100%"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="nsc数据表Controller.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="nsc数据表Controller.do?goUpdate" funname="detail" width="100%" height="100%"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/kk/nsc_sjb/nsc数据表List.js"></script>		
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#nsc数据表Listtb").find("input[name='updateTime']").attr("class","Wdate").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#nsc数据表Listtb").find("input[name='销售人员日期']").attr("class","Wdate").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#nsc数据表Listtb").find("input[name='技术支持日期']").attr("class","Wdate").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'nsc数据表Controller.do?upload', "nsc数据表List");
}

//导出
function ExportXls() {
	JeecgExcelExport("nsc数据表Controller.do?exportXls","nsc数据表List");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("nsc数据表Controller.do?exportXlsByT","nsc数据表List");
}
 </script>