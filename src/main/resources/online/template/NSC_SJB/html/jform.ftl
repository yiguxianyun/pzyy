<#import "/online/template/ledefault/html/lib_kk.ftl" as kk>
<#setting number_format="0.#####################">
<!DOCTYPE html>
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
  <style type="text/css">
  	.combo_self{height: 30px !important;}
  </style>
  <style>
	@media print {
	 .Noprn{display: none;}
	}
  </style>
  <script type="text/javascript">
  		$(function(){
  			$(".combo").removeClass("combo").addClass("combo combo_self");
  			$(".combo").each(function(){
  				$(this).parent().css("line-height","0px");
  			});   
  		});
  </script>  
</head>
<body style="width:210mm;">
	<form id="formobj" action="cgFormBuildController.do?saveOrUpdate" name="formobj" method="post" >
	<input type="hidden" name="tableName" value="${tableName?if_exists?html}" >
	<input type="hidden" name="id" value="${id?if_exists?html}" >
	<#list columnhidden as po>
	  <input type="hidden" id="${po.field_name}" name="${po.field_name}" value="${data['${tableName}']['${po.field_name}']?if_exists?html}" >
	</#list>
<div style="position:fixed;width:210mm;z-index:100">
	<div class="Noprn">
	<input type="button" value="保存"  id="btn_sub" class="ui_state_highlight" style="margin-left: 10px;font-size:16px"/>
	</div>	
	<div class="row form-wrapper">
		<div class="col-xs-3" >
		<img src="userfiles/images/logo.jpg" class="img-responsive" alt="Cinque Terre" 	>
		</div>
		<div class="col-xs-4 text-center" >
			<h2 style="letter-spacing:3px;">NSC泵组数据表</h2>
			<h4>湖南南方长河泵业有限公司</h4>
		</div>
		<div class="col-xs-5" >
			<@kk.找主表字段 "数据表编号"/>
			<div class="input-group">
            <p class="input-group-addon">${kk.字段.content}
             	<a href="#"><span class="glyphicon glyphicon-repeat"></span></a>
            </p> <@kk.ifTextZhuBiao kk.字段 />
       		</div>

       		<@kk.找主表字段 "项目名称"/>
       		<div class="input-group" style="">
            <p class="input-group-addon">${kk.字段.content}	             	
            </p> <@kk.ifTextZhuBiao kk.字段 />
       		</div>
       		<@kk.找主表字段 "客户单位"/>
       		<div class="input-group" style="">
            <p class="input-group-addon">${kk.字段.content}	             	
            </p> <@kk.ifTextZhuBiao kk.字段 />
       		</div>       		
		</div>
	</div>
	
	<div class="row form-wrapper">
	<#list columns as po>
		<#if (po_index>=5)&&(po_index<=8) >
			<div class="input-group" style="">
            <p class="input-group-addon">${po.content}</p>            
            <#if po.show_type=='text'>
				<@kk.ifTextZhuBiao po/>
			<#else>
				<@kk.ifListZhuBiao po/>
			</#if>
       		</div>  
			
		</#if>
	
	</#list>	
	
	
	</div>

</div> 

			<div class="tab-wrapper" style="height:2100mm;padding-top:300px;">
			    <div class="con-wrapper" id="con-wrapper1" style="display: block;">
			      <div class="row form-wrapper">
			        <#list columns as po>
			          <div class="col-xs-3 text-center">
			          	<b>${po.content}：${po.field_name}</b>
			          </div>
			        </#list>

			     </div>
			   </div>			   
			 </div>
	</form>
<script type="text/javascript">$(function(){$("#formobj").Validform({tiptype:1,btnSubmit:"#btn_sub",btnReset:"#btn_reset",ajaxPost:true,usePlugin:{passwordstrength:{minLen:6,maxLen:18,trigger:function(obj,error){if(error){obj.parent().next().find(".Validform_checktip").show();obj.find(".passwordStrength").hide();}else{$(".passwordStrength").show();obj.parent().next().find(".Validform_checktip").hide();}}}},callback:function(data){if(data.success==true){uploadFile(data);}else{if(data.responseText==''||data.responseText==undefined){$.messager.alert('错误', data.msg);$.Hidemsg();}else{try{var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'),data.responseText.indexOf('错误信息')); $.messager.alert('错误',emsg);$.Hidemsg();}catch(ex){$.messager.alert('错误',data.responseText+'');}} return false;}if(!neibuClickFlag){var win = frameElement.api.opener; win.reloadTable();}}});});</script>
	<#--update-end--Author:luobaoli  Date:20150614 for：表单单表属性中增加了扩展参数 ${po.extend_json?if_exists}-->
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
  function upload() {
  	<#list columns as po>
  		<#if po.show_type=='file'>
  		$('#${po.field_name}').uploadify('upload', '*');		
  		</#if>
  		<#if po.show_type=='image'>
  		$('#${po.field_name}').uploadify('upload', '*');		
  		</#if>
  	</#list>
  }
  var neibuClickFlag = false;
  function neibuClick() {
	  neibuClickFlag = true; 
	  $('#btn_sub').trigger('click');
  }
  function cancel() {
  	<#list columns as po>
  		<#if po.show_type=='file'>
 	 $('#${po.field_name}').uploadify('cancel', '*');
 	 	</#if>
 	 	<#if po.show_type=='image'>
 	 $('#${po.field_name}').uploadify('cancel', '*');
 	 	</#if>
  	</#list>
  }
  function uploadFile(data){
  		if(!$("input[name='id']").val()){
  			if(data.obj!=null && data.obj!='undefined'){
  				$("input[name='id']").val(data.obj.id);
  			}
  		}
  		if($(".uploadify-queue-item").length>0){
  			upload();
  		}else{
  			if (neibuClickFlag){
  				alert(data.msg);
  				neibuClickFlag = false;
  			}else {
	  			var win = frameElement.api.opener;
				win.reloadTable();
				win.tip(data.msg);
				frameElement.api.close();
  			}
  		}
  	}

</script>
	<script type="text/javascript">${js_plug_in?if_exists}</script>		
 </body>
</html>






