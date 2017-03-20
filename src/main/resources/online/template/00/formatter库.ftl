<#--   "外网" "113.240.240.142"   "内网" "192.168.40.235" -->
<#macro 样板工程链接 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='ftp://'+'${网址}'+':7777/'+rec.路径;
	 		var href='';
	 		href+='<a href="javascript:void(0)" onclick=window.open("'+url+'","_blank","toolbar=no,width=100%,height=100%");>';
			href+="→</a>";
	 		return href;				 		
	 		},
 		width:35,},
</#macro>
<#macro 通用lhg链接 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='${网址}'+rec.路径;
	 		var href='';
	 		href+='<a href="javascript:void(0)" onclick=createwindow("_blank","'+url+'","700","400");>';
			href+="→</a>";
	 		return href;				 		
	 		},
 		width:35,},
</#macro>
<#macro lhg_流程图 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='${网址}'+rec.流程定义id+'&resourceType=image';
	 		var href='';
	 		href+='<a href="javascript:void(0)" onclick=createwindow("_blank","'+url+'","700","400");>';
			href+="→</a>";
	 		return href;				 		
	 		},
 		width:35,}, 		
</#macro> 		
<#macro 新页签 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='${网址}'+rec.路径;
	 		var href='';
	 		href+='<a href="'+url+'" target=_blank">';
			href+="→</a>";
	 		return href;				 		
	 		},
 		width:35,},
</#macro>
<#macro 新页签_资质 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='${网址}'+'01资质/';
	 		var a=rec.类别;
	 		if (rec.类别.indexOf("长河")>=0){
	 			url+='南方长河资质统计/';
	 		}else{
	 			url+='中金+其他资质扫描件/';
	 		};
	 		var href='';
	 		href+='<a href="'+url+'" target=_blank">';
			href+="→</a>";
	 		return href;				 		
	 		},
 		width:35,},
</#macro>
<#macro 发起流程 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='${网址}'+rec.表单名称+'&走流程=是';
	 		var href='';
	 		href+='<a href="'+url+'"target=_blank" class="l-btn" style="padding:4px">';
			href+='<span class="l-btn-left"><span class="l-btn-text icon-qidong l-btn-icon-left">启动</span></span></a>';
	 		return href;				 		
	 		},
 		width:80,}, 		
</#macro> 
<#macro 删除流程 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='${网址}'+rec.流程id+'&原因=无理由删除&表单编号='+rec.表单编号+'&步骤='+rec.步骤
	 				+'&表单名称='+rec.表单名称;
	 		var href='';
	 		href+='<a href="javascript:void(0)" onclick=$.get("'+url+'",function(data){data=$.parseJSON(data);tip(data.msg);'+
	 			  'reload${config_id}List();}) class="l-btn" style="padding:4px">';
			href+='<span class="l-btn-left"><span class="l-btn-text icon-qidong l-btn-icon-left">删除</span></span></a>';
	 		return href;				 		
	 		},
 		width:80,}, 		
</#macro>  
<#macro 删除已结束流程 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='${网址}'+rec.流程id;
	 		var href='';
	 		href+='<a href="javascript:void(0)" onclick=$.get("'+url+'",function(data){data=$.parseJSON(data);tip(data.msg);'+
	 			  'reload${config_id}List();}) class="l-btn" style="padding:4px">';
			href+='<span class="l-btn-left"><span class="l-btn-text icon-qidong l-btn-icon-left">删除</span></span></a>';
	 		return href;				 		
	 		},
 		width:80,}, 		
</#macro>  
<#macro 删除流程部署 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='${网址}'+rec.部署id;
	 		var href='';
	 		href+='<a href="javascript:void(0)" onclick=$.get("'+url+'",function(data){data=$.parseJSON(data);'+
	 			  'reload${config_id}List();}) class="l-btn" style="padding:4px">';
			href+='<span class="l-btn-left"><span class="l-btn-text icon-qidong l-btn-icon-left">删除</span></span></a>';
	 		return href;				 		
	 		},
 		width:80,}, 		
</#macro>   		
<#macro 签收或办理 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='';
	 		var href='';
//	 		alert(rec.办理人);
	 		if (rec.办理人==null){
	 			url='${网址}'+'签收&任务id='+rec.id;
		 		href+='<a href="javascript:void(0)" onclick=$.get("'+url+'",function(data){'+
		 			  'reload${config_id}List();}) class="l-btn" style="padding:4px">';
				href+='<span class="l-btn-left"><span class="l-btn-text icon-put l-btn-icon-left">签收</span></span></a>';
	 		}else{
	 			url='通用.do?查表单id&表单名称='+rec.表单名称+'&表单编号='+rec.表单编号;
		 		href+='<a href="javascript:void(0)" onclick=办理("'+url+'","'+rec.表单名称+'","'+rec.表单编号+'") class="l-btn" style="padding:4px">';		 		
		 		href+='<span class="l-btn-left"><span class="l-btn-text icon-edit l-btn-icon-left">办理</span></span></a>';

	 		}	 		
	 		return href;				 		
	 		},
 		width:80,}, 		
</#macro>
<#macro 编辑式查看 字段 网址>
		{field:'${字段}',title:'${字段}',
	 	formatter:function(value,rec,index){
	 		var url='';
	 		var href='';
	 		if (rec.end_act_id_!=null){
	 			url='${网址}'+rec.表单名称+'&表单编号='+rec.表单编号;
		 		href+='<a href="javascript:void(0)" onclick=办理("'+url+'","'+rec.表单名称+'","'+rec.表单编号+'") class="l-btn" style="padding:4px">';		 		
		 		href+='<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查看</span></span></a>';
	 		}else{
		 		href+='<a href="javascript:void(0)" class="l-btn" style="padding:4px">';		 		
		 		href+='<span class="l-btn-left"><span class="l-btn-text icon-remove l-btn-icon-left">已删除</span></span></a>';
	 		}	 
	 		return href;
	 		},
 		width:80,}, 		
</#macro> 
<#macro 办理js>
function 办理(url,表单名称,表单编号){	
	$.get(url,function(data){
		data=$.parseJSON(data);
		var a='表单.do?goUpdateFtlForm&tableName='+表单名称+'&id='+data;
//		alert(a);
		window.open(a,'_blank');
	});
}
</#macro> 
<#macro 打开测试报告 字段 网址>
{field:'${字段}',title:'${字段}',
	formatter:function(value,rec,index){
 		var href='';
 		var url='${网址}';
 		href+='<a href="javascript:void(0)" onclick=打开测试报告("'+url+'","'+rec.泵型号+'")>';	
		href+="→</a>";
 		return href;
 	},
	width:80,}, 		
</#macro>










