<#import "/online/template/ledefault/html/lib_list.ftl" as 列表>
${config_iframe}
<link rel="stylesheet" href="online/template/ledefault/css/kk.css">
<link rel="stylesheet" href="plug-in/jquery-ui-1.12.1.custom/jquery-ui.css" type="text/css"/>
<script type="text/javascript" src="plug-in/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

<script type="text/javascript">
/**
*表单的高度,表单的宽度
**/
var ${config_id}Fw = 700,${config_id}Fh = 400;
$(function(){
	createDataGrid${config_id}();
	
});

function createDataGrid${config_id}(){
	var initUrl = 'cgAutoListController.do?datagrid&configId=${config_id}&field=${fileds}${initquery}';
	initUrl = encodeURI(initUrl);
	$('#${config_id}List').datagrid(
	{
	<#if config_istree=="Y">treeField:'text',</#if>
	url:initUrl,
	idField: 'id', <#if config_istree=="Y">treeField:"${tree_fieldname}",</#if>
	title: false,
	fit:true,
	fitColumns:false,
	striped:true,
	autoRowHeight: true,
	pageSize: 10,
	<#if config_ispagination =="Y">pagination:true,</#if>
	<#if config_ischeckbox=="Y">singleSelect:false,<#else>singleSelect:true,</#if>
	<#if fileds?index_of("update_time")!=-1 >
		sortName:'update_time',
	<#elseif fileds?index_of("create_date")!=-1 && fileds?index_of("create_datetime")==-1>
		sortName:'create_date',
	<#else>
		sortName:'id',
	</#if>
	pageList:[10,30,50,100],
	sortOrder:'desc',
	rownumbers:true,
	showFooter:true,
	frozenColumns:[[]],
	columns:[
		[	
			<#if config_ischeckbox=="Y">{field:'ck',checkbox:true},</#if>
			<#list config_fieldList  as x> 
		 		<#if x['field_id']?contains("图片")>
		 			{field:'链接',title:'链接',
				 	formatter:function(value,rec,index){
				 		var url='工作流.do?resourceRead&processDefinitionId='+rec.流程id+'&resourceType=image';
				 		var href='';
				 		href+='<a href="javascript:void(0)" onclick=window.open("'+url+'","_blank","width=800,height=800");>';
						href+="→</a>";
				 		return href;				 		
				 		},
			 		width:30,},
			 	</#if>				 		
				 {	field:'${x['field_id']}',
				 	title:'${x['field_title']}',
				 	<#if x['field_isShow'] == "N" >hidden:true,	</#if>			 		
				 	<#-- update-start--Author: scott  Date:20160503 for：列表加时间格式化 -->
				 	<#if x['field_showType']=="date">
				 	formatter:function(value,rec,index){
				 		if (value == undefined) {
				            return "";
				        }
				        return new Date().format('yyyy-MM-dd', value);
				 	},
				 	</#if>
				 	<#if x['field_showType']=="datetime">
				 	formatter:function(value,rec,index){
				 		if (value == undefined) {
				            return "";
				        }
				        return new Date().format('yyyy-MM-dd hh:mm:ss', value);
				 	},
				 	</#if>
				 	<#-- update-end--Author: scott  Date:20160503 for：列表加时间格式化 -->
				 	sortable:true,
				 	width:${x['field_length']}
				 	},
				 	<#if x['field_id']?contains("图片")>
		 			{field:'发起流程',title:'发起流程',
				 	formatter:function(value,rec,index){				 		
				 		var href='';
				 		href+='<a href="javascript:void(0)" onclick=发起流程("'+rec.流程id+'") class="l-btn">';
						href+='<span class="l-btn-left"><span class="l-btn-text icon-qidong l-btn-icon-left">启动</span></span></a>';
				 		return href;				 		
				 		},				 		
			 		width:30,},
			 	</#if>				 		
			</#list>
		]
	],
	onLoadSuccess:function(data){
		$("#${config_id}List").<#if config_istree=="Y">treegrid<#else>datagrid</#if>("clearSelections");
	},
	onClickRow:function(rowIndex,rowData)
		{rowid=rowData.id;gridname='${config_id}List';}
	});
	$('#${config_id}List').datagrid('getPager').pagination({beforePageText:'',afterPageText:'/{pages}',displayMsg:'{from}-{to}共{total}条',showPageList:true,showRefresh:true});
	$('#${config_id}List').datagrid('getPager').pagination({onBeforeRefresh:function(pageNumber, pageSize){ $(this).pagination('loading');$(this).pagination('loaded'); }});
}
function 发起流程(id){
	var url='工作流.do?resourceRead&processDefinitionId='+id+'&resourceType=image';
	window.open(url,"_blank","width=800,height=800");
	}

<@列表.查询/>
	<@列表.批量删除/>	
	//JS增强
	${config_jsenhance}
</script>
<table width="100%"   id="${config_id}List" toolbar="#${config_id}Listtb"></table>
<div id="${config_id}Listtb" style="padding:3px; height: auto">
<div name="searchColums">
<#if config_querymode == "group">
	<#list config_queryList  as x>
		<#if x['field_isQuery']=="Y">
		<span style="display:-moz-inline-box;display:inline-block;">
		<span style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 100px;text-align:right;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap;" title="${x['field_title']}">${x['field_title']}：</span>
		</#if>
		<#if x['field_queryMode']=="group">
			<#if x['field_isQuery']=="Y">
			<input type="text" name="${x['field_id']}_begin"  style="width: 94px"  <#if x['field_type']=="Date">class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"</#if> value="${x['field_value_begin']}" />
			<span style="display:-moz-inline-box;display:inline-block;width: 8px;text-align:right;">~</span>
			<input type="text" name="${x['field_id']}_end"  style="width: 94px" <#if x['field_type']=="Date">class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"</#if> value="${x['field_value_end']}"/>
			<#else>
			<input type="hidden" name="${x['field_id']}_begin"   value="${x['field_value_begin']}"/>
			<input type="hidden" name="${x['field_id']}_end"    value="${x['field_value_end']}"/>
			</#if>
		</#if>
		<#if x['field_queryMode']=="single">
			<#if x['field_isQuery']=="Y">
				<#if  (x['field_dictlist']?size >0)>
					<select name = "${x['field_id']}"  style="width: 104px">
					<option value = "">---请选择---</option>
					<#list x['field_dictlist']  as xd>
						<option value = "${xd['typecode']}">${xd['typename']}</option>
					</#list>
					</select>
				</#if>
				<#if  (x['field_dictlist']?size <= 0)>
					<#if x['field_showType']!='popup'>
					<input id="${x['field_id']}" type="text" name="${x['field_id']}" style="width: 100px" <#if x['field_type']=="Date">class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"</#if>  value="${x['field_value']?if_exists?default('')}" />
					<#else>
					<input type="text" name="${x['field_id']}"  style="width: 100px" 
									class="searchbox-inputtext" value="${x['field_value']?if_exists?default('')}"
							       onClick="inputClick(this,'${x['field_dictField']?if_exists?html}','${x['field_dictTable']?if_exists?html}');" />
					</#if>
				</#if>
			<#else>
					<input type="hidden" name="${x['field_id']}"    value="${x['field_value']?if_exists?default('')}" />
			</#if>
		</#if>
		</span>	
	</#list>
</#if>
	</div>
	<div style="height:30px;" class="datagrid-toolbar">
	
<#if  (config_queryList?size >0)>
	<#if config_querymode == "group" >
		<span style="float:right">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="${config_id}Listsearch()">查询</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" onclick="${config_id}searchReset('${config_id}List')">重置</a>
		</span>
	</#if>
	<#if config_querymode == "single">
		<span style="float:right">
		<input id="${config_id}Listsearchbox" class="easyui-searchbox"  data-options="searcher:${config_id}Listsearchbox,prompt:'请输入关键字',menu:'#${config_id}Listmm'"></input>
		<div id="${config_id}Listmm" style="width:120px">
		<#list config_queryList  as x>
			<#if x['field_isQuery']=="Y">
			<div data-options="name:'${x['field_id']}',iconCls:'icon-ok'  ">${x['field_title']}</div>
			<#else>
			</#if>
		</#list>
		</div>
		</span>
	</#if>
</#if>
	</div>
</div>
<!--update-end--Author:luobaoli  Date:20150703 for：将本文档中所有href="#"修改为href="javascript:void(0)",避免rest风格下新增/删除等操作跳转到主页问题-->