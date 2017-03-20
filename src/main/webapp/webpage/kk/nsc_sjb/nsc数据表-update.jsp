<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>NSC数据表</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="online/template/ledefault/css/vendor.css">
  <link rel="stylesheet" href="online/template/ledefault/css/bootstrap-theme.css">
  <link rel="stylesheet" href="online/template/ledefault/css/bootstrap.css">
  <link rel="stylesheet" href="online/template/ledefault/css/app.css">
  
  <link rel="stylesheet" href="plug-in/Validform/css/metrole/style.css" type="text/css"/>
  <link rel="stylesheet" href="plug-in/Validform/css/metrole/tablefrom.css" type="text/css"/>
  <script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="plug-in/tools/dataformat.js"></script>
  <script type="text/javascript" src="plug-in/easyui/jquery.easyui.min.1.3.2.js"></script>
  <script type="text/javascript" src="plug-in/easyui/locale/zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/tools/syUtil.js"></script>
  <script type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="plug-in/lhgDialog/lhgdialog.min.js"></script>
  <script type="text/javascript" src="plug-in/tools/curdtools_zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/tools/easyuiextend.js"></script>
  <script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/Validform/plugin/passwordStrength/passwordStrength-min.js"></script>
  <link rel="stylesheet" href="plug-in/uploadify/css/uploadify.css" type="text/css"></link>
  <script type="text/javascript" src="plug-in/uploadify/jquery.uploadify-3.1.js"></script>
  <link rel="stylesheet" href="plug-in/umeditor/themes/default/css/umeditor.css" type="text/css"></link>
  <script type="text/javascript" src="plug-in/umeditor/umeditor.config.js"></script>
  <script type="text/javascript" src="plug-in/umeditor/umeditor.min.js"></script>
  <script type="text/javascript" src="plug-in/umeditor/lang/zh-cn/zh-cn.js"></script>
</head>


 <script type="text/javascript">
 $(document).ready(function(){
	 init();
	 $("#jform_tab .con-wrapper").hide(); //Hide all tab content  
	 $("#jform_tab li:first").addClass("active").show(); //Activate first tab  
	 $("#jform_tab .con-wrapper:first").show(); //Show first tab content
	 
	 
	 //On Click Event  
    $("#jform_tab li").click(function() {  
        $("#jform_tab li").removeClass("active"); //Remove any "active" class  
        $(this).addClass("active"); //Add "active" class to selected tab  
        $("#jform_tab .con-wrapper").hide(); //Hide all tab content  
        var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content  
        $(activeTab).fadeIn(); //Fade in the active content
        //$(""+activeTab).show();   
        if( $(activeTab).html()!="") {
        	return false;
        }else{
        	$(activeTab).html('正在加载内容，请稍后...');
        	var url = $(this).attr("tab-ajax-url");
        	$.post(url, {}, function(data) {
        		 //$(this).attr("tab-ajax-cached", true);
        		$(activeTab).html(data);
        		
            });
        }  
        return false;  
    });  
  });
  //初始化下标
	function resetTrNum(tableId) {
		$tbody = $("#"+tableId+"");
		$tbody.find('>tr').each(function(i){
			$(':input, select', this).each(function(){
				var $this = $(this), name = $this.attr('name'), val = $this.val();
				if(name!=null){
					if (name.indexOf("#index#") >= 0){
						$this.attr("name",name.replace('#index#',i));
					}else{
						var s = name.indexOf("[");
						var e = name.indexOf("]");
						var new_name = name.substring(s+1,e);
						$this.attr("name",name.replace(new_name,i));
					}
				}
			});
			$(this).find('div[name=\'xh\']').html(i+1);
		});
	}
	
	function init(){
    	var tabHead =$("#jform_tab li:first");
    	var tabBox = $("#jform_tab .con-wrapper:first"); 
    	var url = tabHead.attr("tab-ajax-url");
    	tabBox.html('正在加载内容，请稍后...');
    	$.post(url, {}, function(data) {
            tabBox.html(data);
    		//tabHead.attr("tab-ajax-cached", true);
        });
    }
 </script>
 <body>
  <form id="formobj" action="nsc数据表Controller.do?doUpdate" name="formobj" method="post"><input type="hidden" id="btn_sub" class="btn_sub"/>
				
			<input type="hidden" id="btn_sub" class="btn_sub"/>
			<input type="hidden" name="id" value='${nsc数据表Page.id}' >
			
			
			<div class="tab-wrapper">
			    <!-- tab -->
			    <ul class="nav nav-tabs">
			      <li role="presentation" class="active"><a href="javascript:void(0);">NSC数据表</a></li>
			    </ul>
			    <!-- tab内容 -->
			    <div class="con-wrapper" style="display: block;">
			      <div class="row form-wrapper">
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>数据表编号：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="数据表编号" name="数据表编号" type="text" class="form-control"  value='${nsc数据表Page.数据表编号}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">数据表编号</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>泵组序号：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="泵组序号" name="泵组序号" type="text" class="form-control"  value='${nsc数据表Page.泵组序号}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">泵组序号</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>数据表版本：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="数据表版本" name="数据表版本" type="text" class="form-control"  value='${nsc数据表Page.数据表版本}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">数据表版本</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>项目名称：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="项目名称" name="项目名称" type="text" class="form-control"  value='${nsc数据表Page.项目名称}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">项目名称</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>客户单位：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="客户单位" name="客户单位" type="text" class="form-control"  value='${nsc数据表Page.客户单位}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">客户单位</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>泵组类型：</b>
			          </div>
			          <div class="col-xs-3">
								<t:dictSelect field="泵组类型" type="list" extendJson="{class:'form-control',style:'width:150px'}"
								typeGroupCode="NSC泵组类型" defaultVal="${nsc数据表Page.泵组类型}" hasLabel="false"  title="泵组类型"></t:dictSelect>     
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">泵组类型</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>需要台数：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="需要台数" name="需要台数" type="text" class="form-control"  value='${nsc数据表Page.需要台数}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">需要台数</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>操作/备用：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="操作备用" name="操作备用" type="text" class="form-control"  value='${nsc数据表Page.操作备用}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">操作/备用</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>泵型号：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="泵型号" name="泵型号" type="text" class="form-control"  value='${nsc数据表Page.泵型号}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">泵型号</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>流量m3/h：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="流量" name="流量" type="text" class="form-control"  value='${nsc数据表Page.流量}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">流量m3/h</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>扬程m：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="扬程" name="扬程" type="text" class="form-control"  value='${nsc数据表Page.扬程}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">扬程m</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>输送介质：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="输送介质" name="输送介质" type="text" class="form-control"  value='${nsc数据表Page.输送介质}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">输送介质</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>操作温度 正常/最高℃：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="操作温度" name="操作温度" type="text" class="form-control"  value='${nsc数据表Page.操作温度}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">操作温度 正常/最高℃</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>操作温度下密度kg/dm3：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="密度" name="密度" type="text" class="form-control"  value='${nsc数据表Page.密度}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">操作温度下密度kg/dm3</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>入口压力MPa：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="入口压力" name="入口压力" type="text" class="form-control" datatype="*" value='${nsc数据表Page.入口压力}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">入口压力MPa</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>出口压力MPa：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="出口压力" name="出口压力" type="text" class="form-control"  value='${nsc数据表Page.出口压力}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">出口压力MPa</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>腐蚀成份和浓度ppm：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="腐蚀" name="腐蚀" type="text" class="form-control"  value='${nsc数据表Page.腐蚀}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">腐蚀成份和浓度ppm</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>操作温度下粘度 cp：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="粘度" name="粘度" type="text" class="form-control"  value='${nsc数据表Page.粘度}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">操作温度下粘度 cp</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>固体颗粒成份和含量ppm：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="固体颗粒" name="固体颗粒" type="text" class="form-control"  value='${nsc数据表Page.固体颗粒}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">固体颗粒成份和含量ppm</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>安装位置：</b>
			          </div>
			          <div class="col-xs-3">
								<t:dictSelect field="安装位置" type="list" extendJson="{class:'form-control',style:'width:150px'}"
								typeGroupCode="室内外" defaultVal="${nsc数据表Page.安装位置}" hasLabel="false"  title="安装位置"></t:dictSelect>     
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">安装位置</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>海拔高度m：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="海拔高度" name="海拔高度" type="text" class="form-control"  value='${nsc数据表Page.海拔高度}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">海拔高度m</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>运行条件(是否防爆)：</b>
			          </div>
			          <div class="col-xs-3">
								<t:dictSelect field="运行条件" type="list" extendJson="{class:'form-control',style:'width:150px'}"
								typeGroupCode="否是" defaultVal="${nsc数据表Page.运行条件}" hasLabel="false"  title="运行条件(是否防爆)"></t:dictSelect>     
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">运行条件(是否防爆)</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>销售人员：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="销售人员" name="销售人员" type="text" class="form-control"  value='${nsc数据表Page.销售人员}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">销售人员</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>销售人员日期：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="销售人员日期" name="销售人员日期" type="text" style="width: 150px"  class="Wdate" onClick="WdatePicker()" value='<fmt:formatDate value='${nsc数据表Page.销售人员日期}' type="date" pattern="yyyy-MM-dd"/>'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">销售人员日期</label>
			          </div>
							</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>技术支持：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="技术支持" name="技术支持" type="text" class="form-control"  value='${nsc数据表Page.技术支持}'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">技术支持</label>
			          </div>
			          
			        
			          <div class="col-xs-3 text-center">
			          	<b>技术支持日期：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="技术支持日期" name="技术支持日期" type="text" style="width: 150px"  class="Wdate" onClick="WdatePicker()" value='<fmt:formatDate value='${nsc数据表Page.技术支持日期}' type="date" pattern="yyyy-MM-dd"/>'>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">技术支持日期</label>
			          </div>
							</div>
			          
			        

			     </div>
			   </div>
			   
			   <div class="con-wrapper" style="display: block;"></div>
	</div>
		
			
			
<script type="text/javascript">
   $(function(){
    //查看模式情况下,删除和上传附件功能禁止使用
	if(location.href.indexOf("load=detail")!=-1){
		$(".jeecgDetail").hide();
	}
	
	if(location.href.indexOf("mode=read")!=-1){
		//查看模式控件禁用
		$("#formobj").find(":input").attr("disabled","disabled");
	}
	if(location.href.indexOf("mode=onbutton")!=-1){
		//其他模式显示提交按钮
		$("#sub_tr").show();
	}
   });

  var neibuClickFlag = false;
  function neibuClick() {
	  neibuClickFlag = true; 
	  $('#btn_sub').trigger('click');
  }
</script>

<div id="jform_tab" class="tab-wrapper">
	<!-- tab -->
    <ul class="nav nav-tabs">
		    	<li role="presentation" tab-ajax-url="nsc数据表Controller.do?nsc数据表结构参数List&wJ=${nsc数据表Page.wJ}"><a href="#con-wrapper0">NSC数据表</a></li>
		    	<li role="presentation" tab-ajax-url="nsc数据表Controller.do?nsc数据表材质List&wJ=${nsc数据表Page.wJ}"><a href="#con-wrapper1">NSC数据表</a></li>
		    	<li role="presentation" tab-ajax-url="nsc数据表Controller.do?nsc数据表性能List&wJ=${nsc数据表Page.wJ}"><a href="#con-wrapper2">NSC数据表</a></li>
		    	<li role="presentation" tab-ajax-url="nsc数据表Controller.do?nsc数据表供货List&wJ=${nsc数据表Page.wJ}"><a href="#con-wrapper3">NSC数据表</a></li>
		    	<li role="presentation" tab-ajax-url="nsc数据表Controller.do?nsc数据表原动机List&wJ=${nsc数据表Page.wJ}"><a href="#con-wrapper4">NSC数据表</a></li>
    </ul>
    
	     <div class="con-wrapper" id="con-wrapper0" style="display: none;"></div>
	     <div class="con-wrapper" id="con-wrapper1" style="display: none;"></div>
	     <div class="con-wrapper" id="con-wrapper2" style="display: none;"></div>
	     <div class="con-wrapper" id="con-wrapper3" style="display: none;"></div>
	     <div class="con-wrapper" id="con-wrapper4" style="display: none;"></div>
</div>


			
		<div align="center"  id = "sub_tr" style="display: none;" > <input type="button" value="提交" onclick="neibuClick();" class="ui_state_highlight"></div>
		<script type="text/javascript">
		$(function() {
			$("#formobj").Validform({
				tiptype: 1,
				btnSubmit: "#btn_sub",
				btnReset: "#btn_reset",
				ajaxPost: true,
				beforeSubmit: function(curform) {
					var tag = true;
					//提交前处理
					return tag;
				},
				usePlugin: {
					passwordstrength: {
						minLen: 6,
						maxLen: 18,
						trigger: function(obj, error) {
							if (error) {
								obj.parent().next().find(".Validform_checktip").show();
								obj.find(".passwordStrength").hide();
							} else {
								$(".passwordStrength").show();
								obj.parent().next().find(".Validform_checktip").hide();
							}
						}
					}
				},
				callback: function(data) {
					if (data.success == true) {
						 var win = frameElement.api.opener;
						 win.reloadTable();
						 win.tip(data.msg);
						 frameElement.api.close();
					} else {
						if (data.responseText == '' || data.responseText == undefined) {
							$.messager.alert('错误', data.msg);
							$.Hidemsg();
						} else {
							try {
								var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'), data.responseText.indexOf('错误信息'));
								$.messager.alert('错误', emsg);
								$.Hidemsg();
							} catch(ex) {
								$.messager.alert('错误', data.responseText + '');
							}
						}
						return false;
					}
				}
			});
		});
		</script>
		
		</form>
		<!-- 添加 产品明细 模版 -->
		<table style="display:none">
			<tbody id="add_nsc数据表结构参数_table_template">
				<tr>
					 <th scope="row"><div name="xh"></div></th>
					 <td><input style="width:20px;" type="checkbox" name="ck"/></td>
						  <td align="left">
									<t:dictSelect field="nsc数据表结构参数List[#index#].安装方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="卧立式" defaultVal="" hasLabel="false"  title="安装方式"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">安装方式</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表结构参数List[#index#].旋转方向" type="list" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="顺逆" defaultVal="" hasLabel="false"  title="旋转方向（从驱动端看）"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">旋转方向（从驱动端看）</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表结构参数List[#index#].支撑方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="支撑方式" defaultVal="" hasLabel="false"  title="支撑方式"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">支撑方式</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表结构参数List[#index#].联轴器形式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="联轴器形式" defaultVal="" hasLabel="false"  title="联轴器"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">联轴器</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表结构参数List[#index#].底座形式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="底座形式" defaultVal="" hasLabel="false"  title="底座"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">底座</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表结构参数List[#index#].轴承及润滑方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="轴承及润滑方式" defaultVal="" hasLabel="false"  title="轴承及润滑方式"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">轴承及润滑方式</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表结构参数List[#index#].轴封方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="轴封方式" defaultVal="" hasLabel="false"  title="轴封方式"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">轴封方式</label>
						  </td>
					</tr>
				 </tbody>
			<tbody id="add_nsc数据表材质_table_template">
				<tr>
					 <th scope="row"><div name="xh"></div></th>
					 <td><input style="width:20px;" type="checkbox" name="ck"/></td>
						  <td align="left">
							  	<input name="nsc数据表材质List[#index#].泵体泵盖" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">泵体泵盖</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表材质List[#index#].叶轮" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">叶轮</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表材质List[#index#].主轴" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">主轴</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表材质List[#index#].轴套" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">轴套</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表材质List[#index#].密封环" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">密封环</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表材质List[#index#].轴承" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">轴承</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表材质List[#index#].轴封" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">轴封</label>
						  </td>
						  <td align="left">
							       	<input name="nsc数据表材质List[#index#].材质特殊要求" maxlength="500" 
								  		type="text" class="form-control"  style="width:120px;"
								  		 >
							  <label class="Validform_label" style="display: none;">材质特殊要求</label>
						  </td>
					</tr>
				 </tbody>
			<tbody id="add_nsc数据表性能_table_template">
				<tr>
					 <th scope="row"><div name="xh"></div></th>
					 <td><input style="width:20px;" type="checkbox" name="ck"/></td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].额定点流量" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">额定点流量m3/h</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].额定点扬程" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">额定点扬程m</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].额定点效率" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">额定点效率%</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].额定点轴功率" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">额定点轴功率kW</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].额定点必需汽蚀余量" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">额定点必需汽蚀余量m</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].转速" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">转速r/min</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].最小连续流量" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">最小连续流量m3/h</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].最大流量" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">最大流量m3/h</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表性能List[#index#].关闭点扬程" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">关闭点扬程m</label>
						  </td>
					</tr>
				 </tbody>
			<tbody id="add_nsc数据表供货_table_template">
				<tr>
					 <th scope="row"><div name="xh"></div></th>
					 <td><input style="width:20px;" type="checkbox" name="ck"/></td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].泵价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">泵</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].机封价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">机封</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].底座价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">底座</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].反法兰价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">进/出口反法兰</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].联轴器价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">联轴器</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].电或柴价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">电或柴</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].控制柜价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">控制柜</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].单价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">单价</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表供货List[#index#].总价" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">总价</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].有无泵价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="" defaultVal="" hasLabel="false"  title="有无_泵价"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">有无_泵价</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].有无机封价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="" defaultVal="" hasLabel="false"  title="有无_机封价"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">有无_机封价</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].有无底座价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="" defaultVal="" hasLabel="false"  title="有无_底座价"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">有无_底座价</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].有无反法兰价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="" defaultVal="" hasLabel="false"  title="有无_反法兰价"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">有无_反法兰价</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].有无联轴器价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="" defaultVal="" hasLabel="false"  title="有无_联轴器价"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">有无_联轴器价</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].有无电或柴价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="" defaultVal="" hasLabel="false"  title="有无_电或柴价"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">有无_电或柴价</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].有无控制柜价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="有无" defaultVal="" hasLabel="false"  title="有无_控制柜价"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">有无_控制柜价</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].包装方式" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="包装方式" defaultVal="" hasLabel="false"  title="包装方式"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">包装方式</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].运输方式" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="运输方式" defaultVal="" hasLabel="false"  title="运输方式"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">运输方式</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表供货List[#index#].油漆颜色" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="油漆颜色" defaultVal="" hasLabel="false"  title="油漆颜色"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">油漆颜色</label>
						  </td>
						  <td align="left">
							       	<input name="nsc数据表供货List[#index#].附配件" maxlength="32" 
								  		type="text" class="form-control"  style="width:120px;"
								  		 >
							  <label class="Validform_label" style="display: none;">其他附件和配件</label>
						  </td>
					</tr>
				 </tbody>
			<tbody id="add_nsc数据表原动机_table_template">
				<tr>
					 <th scope="row"><div name="xh"></div></th>
					 <td><input style="width:20px;" type="checkbox" name="ck"/></td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].原动机厂家" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">原动机厂家</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].原动机型号" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">原动机型号</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].电压或油箱" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">电压或油箱</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].配套功率" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">配套功率(kw)</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].原动机转速" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">转速(r/min)     </label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].ip或材质" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">IP或材质</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].启动或冷却方式" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">启动或冷却方式</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].接线盒" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">接线盒进线方式/个数</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].最高工作温度" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">最高工作温度(℃)</label>
						  </td>
						  <td align="left">
							  	<input name="nsc数据表原动机List[#index#].其它条件" maxlength="32" 
							  		type="text" class="form-control"  style="width:120px;" >
							  <label class="Validform_label" style="display: none;">其它条件(特殊要求)</label>
						  </td>
						  <td align="left">
									<t:dictSelect field="nsc数据表原动机List[#index#].电机极数" type="list" extendJson="{class:'form-control',style:'width:150px'}"
												typeGroupCode="djjs" defaultVal="" hasLabel="false"  title="极数"></t:dictSelect>     
							  <label class="Validform_label" style="display: none;">极数</label>
						  </td>
					</tr>
				 </tbody>
		</table>
	<script src = "webpage/kk/nsc_sjb/nsc数据表.js"></script>	
 </body>
 </html>