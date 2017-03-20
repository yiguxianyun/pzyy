<#import "字段库.ftl" as 字段库>
<#setting number_format="0.#####################">
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>${head.content}</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="online/template/ledefault/css/vendor.css">
	<link rel="stylesheet" href="online/template/ledefault/css/bootstrap-theme.css">
	<link rel="stylesheet" href="online/template/ledefault/css/bootstrap.css">
	<link rel="stylesheet" href="online/template/ledefault/css/app.css">
	
	<link rel="stylesheet" href="plug-in/Validform/css/metrole/style.css" type="text/css"/>
	<link rel="stylesheet" href="plug-in/Validform/css/metrole/tablefrom.css" type="text/css"/>
	<link rel="stylesheet" href="plug-in/easyui/themes/metrole/easyui.css" type="text/css">
	<link rel="stylesheet" href="plug-in/easyui/themes/metrole/icon.css" type="text/css">
	<link rel="stylesheet" href="online/template/ledefault/css/kk.css">
	  
	<link rel="stylesheet" href="plug-in/jquery-ui-1.12.1.custom/jquery-ui.css" type="text/css"/>
	<script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="plug-in/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
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
	
	<script type="text/javascript" src="plug-in/kk/kk.js"></script>
	
	<link rel="stylesheet" href="plug-in/jQuery步骤条/css/step-dc-style1.css" />
	<script type="text/javascript" src="plug-in/jQuery步骤条/js/step-jquery-dc.js"></script>
	
    <script type=text/javascript src="plug-in/clipboard/ZeroClipboard.js"></script>
   
  <style type="text/css">
  	.combo_self{height: 30px !important;}
  </style>
  <script type="text/javascript">
  		$(function(){
  			$(".combo").removeClass("combo").addClass("combo combo_self");
  			$(".combo").each(function(){
  				$(this).parent().css("line-height","0px");
  			});   
  		});
  </script>
<script type="text/javascript">
$(document).ready(function(){
//将没有权限的按钮屏蔽掉
<#list config_nolist as x>
	$("#${x}").hide();
</#list>	 
});
</script>
</head>