<#import "online/template/ledefault/html/lib_kk.ftl" as kk>
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
  <link rel="stylesheet" href="plug-in/easyui/themes/metrole/main.css" type="text/css">
  <link rel="stylesheet" href="plug-in/easyui/themes/metrole/icon.css" type="text/css">
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
<!--   查询电机 -->
<style>
  .ui-autocomplete {
    max-height: 200px;
    overflow-y: auto;
    /* 防止水平滚动条 */
    overflow-x: hidden;
  }
  </style>
  <script>
$(function() {
	  function pinyZH(term) {
		  if (!/[\u4e00-\u9fa5]/g.test(term)){
			  var arr = { "n": "南", "j": "佳", "x": "湘", "d": "德" };
			  $.each(arr, function (key, value) { 
				  if (term==key) {term = value}
			  });
		  }		 
  		return term;  
	  }
	  
	  $( "#厂家" ).autocomplete({
      source: function( request, response ) {    	  
    	  $.post("选型报价.do?chaxunDJ",
  				{term: pinyZH(request.term),动作:"查厂家"},
  			function(data){
  					data = $.parseJSON(data);
  					response( $.map( data, function( item ) {
  		            	return {label: item.厂家,value: item.厂家 }
  		            }));
  			});          
        },
        minLength: 0,
    });
	  $("#功率,#ip,#电压,#频率,#型号,#系列").each(function(){
		  var id=$(this).attr("id");
		  $(this).autocomplete({
		      source: function( request, response ) {    	  
		    	  $.post("选型报价.do?chaxunDJ",
		  				{term: request.term,动作:"查"+id},
		  			function(data){
		  					data = $.parseJSON(data);
		  					response( $.map( data, function( item ) {
		  		            	return {label: item[id],value: item[id] }
		  		            }));
		  			});          
		        },
		        minLength: 0
		    });
		  
	    });
 
    
  });
  </script> 
</head>

 <body>
  <#--update-start--Author:luobaoli  Date:20150614 for：表单单表属性中增加了扩展参数 ${po.extend_json?if_exists}-->
  <form id="formobj" action="cgFormBuildController.do?saveOrUpdate" name="formobj" method="post">
			<input type="hidden" id="btn_sub" class="btn_sub"/>
			<input type="hidden" name="tableName" value="${tableName?if_exists?html}" >
			<input type="hidden" name="id" value="${id?if_exists?html}" >
			<#list columnhidden as po>
			  <input type="hidden" id="${po.field_name}" name="${po.field_name}" value="${data['${tableName}']['${po.field_name}']?if_exists?html}" >
			</#list>
			
			<div class="tab-wrapper">
			    <!-- tab -->
			    <ul class="nav nav-tabs">
			      <li role="presentation" class="active"><a href="javascript:void(0);">${head.content}</a></li>
			    </ul>
			    <!-- tab内容 -->
			    <div class="con-wrapper" id="con-wrapper1" style="display: block;">
			      <div class="row form-wrapper">
			        <#list columns as po>
				        <#if (columns?size>10)>
							<#if po_index%2==0>
							<div class="row show-grid">
							</#if>
						<#else>
							<div class="row show-grid">
						</#if>
			          <div class="col-xs-3 text-center">
			          	<b>${po.content}：</b>
			          </div>
			          <div class="col-xs-3">
			          	<#if head.isTree=='Y' && head.treeParentIdFieldName==po.field_name>
							
						<#elseif po.show_type=='text'>
							<@kk.ifTextZhuBiao po data tableName/>
							
						<#elseif po.show_type=='password'>
			
						
						<#elseif po.show_type=='radio'>					       
					               
						<#elseif po.show_type=='checkbox'>
												               
						<#elseif po.show_type=='list'>
							<@DictData name="${po.dict_field?if_exists?html}" text="${po.dict_text?if_exists?html}" tablename="${po.dict_table?if_exists?html}" var="dataList">
								<select id="${po.field_name}" ${po.extend_json?if_exists} class="form-control" name="${po.field_name}" <#if po.operationCodesReadOnly?if_exists>onfocus="this.defOpt=this.selectedIndex" onchange="this.selectedIndex=this.defOpt;"</#if><#if po.is_null != 'Y'>datatype="*"</#if> >
									<#list dataList as dictdata> 
									<option value="${dictdata.typecode?if_exists?html}" 
									<#if dictdata.typecode?if_exists?html=="${data['${tableName}']['${po.field_name}']?if_exists?html}"> selected="selected" </#if>>
										${dictdata.typename?if_exists?html}
									</option> 
									</#list> 
								</select>
							</@DictData>
							
						<#elseif po.show_type=='date'>
							<input id="${po.field_name}" ${po.extend_json?if_exists} name="${po.field_name}" type="text"
							         value="${data['${tableName}']['${po.field_name}']?if_exists?html}"
							       class="form-control" onClick="WdatePicker({<#if po.operationCodesReadOnly?if_exists> readonly = true</#if>})" 
					              <#if po.operationCodesReadOnly?exists> readonly = "readonly"</#if>
						       <#if po.field_valid_type?if_exists?html != ''>
					               datatype="${po.field_valid_type?if_exists?html}"
					               <#else>
					               <#if po.is_null != 'Y'>datatype="*"</#if> 
					               </#if>>
						
						<#elseif po.show_type=='datetime'>
							<input id="${po.field_name}" ${po.extend_json?if_exists} name="${po.field_name}" type="text"
							         value="${data['${tableName}']['${po.field_name}']?if_exists?html}"
							       class="form-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'<#if po.operationCodesReadOnly?if_exists> ,readonly = true</#if>})"
						         <#if po.operationCodesReadOnly?exists> readonly = "readonly"</#if>
						       <#if po.field_valid_type?if_exists?html != ''>
					               datatype="${po.field_valid_type?if_exists?html}"
					               <#else>
					               <#if po.is_null != 'Y'>datatype="*"</#if> 
					               </#if>>
						
						<#elseif po.show_type=='popup'>
							<input id="${po.field_name}" ${po.extend_json?if_exists} name="${po.field_name}"  type="text"
							        class="form-control searchbox-inputtext" 
							       onClick="inputClick(this,'${po.dict_text?if_exists?html}','${po.dict_table?if_exists?html}');" 
							       value="${data['${tableName}']['${po.field_name}']?if_exists?html}"
					               <#if po.operationCodesReadOnly?if_exists> readonly = "readonly"</#if>
						       <#if po.field_valid_type?if_exists?html != ''>
					               datatype="${po.field_valid_type?if_exists?html}"
					               <#else>
					               <#if po.is_null != 'Y'>datatype="*"</#if>
					               </#if>>
						
						<#elseif po.show_type=='file'>
							
						<#elseif po.show_type=='image'>
														
						<#else>
							<input id="${po.field_name}" ${po.extend_json?if_exists} name="${po.field_name}" type="text"
							        class="form-control" value="${data['${tableName}']['${po.field_name}']?if_exists?html}"
					               <#if po.field_valid_type?if_exists?html != ''>
					               datatype="${po.field_valid_type?if_exists?html}"
					               <#else>
					               <#if po.type == 'int'>
					               datatype="n" 
					               <#elseif po.type=='double'>
					               datatype="/^(-?\d+)(\.\d+)?$/" 
					               <#else>
					               <#if po.is_null != 'Y'>datatype="*"</#if>
					               </#if>
					               </#if>>

						</#if>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
			          </div>
			        <#if (columns?size>10)>
						<#if (po_index%2==0)&&(!po_has_next)>
							<div class="col-xs-2 text-center"><b></b></div>
			         		<div class="col-xs-4"></div>
						</#if>
						<#if (po_index%2!=0)||(!po_has_next)>
							</div>
						</#if>
					<#else>
						</div>
					</#if>	          
			        </#list>
			        
			       
			          <div class="row" id = "sub_tr" style="display: none;">
				        <div class="col-xs-12 layout-header">
				          <div class="col-xs-6"></div>
				          <div class="col-xs-6"><button type="button" onclick="neibuClick();" class="btn btn-default"> 提  &nbsp;交 </button></div>
				        </div>
				      </div>
			     </div>
			   </div>
			   
			   <div class="con-wrapper" id="con-wrapper2" style="display: block;"></div>
			 </div>
	</form>
<script type="text/javascript">
$(function(){
	$("#formobj").Validform({
		tiptype:1,
		btnSubmit:"#btn_sub",
		btnReset:"#btn_reset",
		ajaxPost:true,
		usePlugin:{
			passwordstrength:{minLen:6,maxLen:18,trigger:function(obj,error){if(error){obj.parent().next().find(".Validform_checktip").show();
					obj.find(".passwordStrength").hide();}else{$(".passwordStrength").show();obj.parent().next().find(".Validform_checktip").hide();}}}
		},
		callback:function(data){
			if(data.success==true){uploadFile(data);
			}else{
				if(data.responseText==''||data.responseText==undefined){$.messager.alert('错误', data.msg);$.Hidemsg();}
				else{try{var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'),data.responseText.indexOf('错误信息')); 
				$.messager.alert('错误',emsg);$.Hidemsg();}catch(ex){$.messager.alert('错误',data.responseText+'');}} return false;}
			if(!neibuClickFlag){var win = frameElement.api.opener; win.reloadTable();}}
	}).config({
	  ajaxpost:{async : false,}
	});
	  
});
</script>
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
	$.dialog.setting.zIndex =1990;
	function del(url,obj){
		$.dialog.confirm("确认删除该条记录?", function(){
		  	$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : url,// 请求的action路径
				error : function() {// 请求失败处理函数
				},
				success : function(data) {
					var d = $.parseJSON(data);
					if (d.success) {
						var msg = d.msg;
						tip(msg);
						$(obj).closest("tr").hide("slow");
					}
				}
			});  
		}, function(){
	});
}

<#--add-start--Author:钟世云  Date:20150614 for：online支持树配置-->
/**树形列表数据转换**/
function convertTreeData(rows, textField) {
    for(var i = 0; i < rows.length; i++) {
        var row = rows[i];
        row.text = row[textField];
        if(row.children) {
        	row.state = "open";
            convertTreeData(row.children, textField);
        }
    }
}
/**树形列表加入子元素**/
function joinTreeChildren(arr1, arr2) {
    for(var i = 0; i < arr1.length; i++) {
        var row1 = arr1[i];
        for(var j = 0; j < arr2.length; j++) {
            if(row1.id == arr2[j].id) {
                var children = arr2[j].children;
                if(children) {
                    row1.children = children;
                }
                
            }
        }
    }
}
<#--add-end--Author:钟世云  Date:20150614 for：online支持树配置-->
</script>
	<script type="text/javascript">${js_plug_in?if_exists}</script>		
 </body>
</html>