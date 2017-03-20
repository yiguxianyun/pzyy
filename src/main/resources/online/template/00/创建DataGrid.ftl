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
	<#if fileds?index_of("序号")!=-1 >
		sortName:'序号',
	<#elseif fileds?index_of("update_time")!=-1 >
		sortName:'update_time',
	<#elseif fileds?index_of("create_date")!=-1 && fileds?index_of("create_datetime")==-1>
		sortName:'create_date',
	<#else>
		sortName:'id',
	</#if>
	pageList:[10,30,50,100],
	<#if fileds?index_of("序号")!=-1 >sortOrder:'asc',<#else>sortOrder:'desc',</#if>
	rownumbers:true,
	showFooter:true,
	frozenColumns:[[]],
	<#if config_id?index_of("发起流程")==-1 >nowrap:false,</#if>
	columns:[
		[	
			<#if config_ischeckbox=="Y">{field:'ck',checkbox:true},</#if>
			<#list config_fieldList  as x> 
		 		<#if config_id?contains("样板工程")&&(x['field_id']?contains("路径"))>
		 			<@formatter库.新页签   "外网" "ftp://113.240.240.142:7777/"/>
			 	</#if>	
			 	<#if config_id?contains("资质")&&(x['field_id']?contains("资质原件"))>
	 				<@formatter库.新页签_资质   "外网" "ftp://113.240.240.142:7777/"/>
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
				 	<#if config_id?contains("样板工程")&&(x['field_id']?contains("路径"))>
			 			<@formatter库.新页签   "内网" "ftp://192.168.40.235:7777/"/>
				 	</#if>
				 	<#if config_id?contains("资质")&&(x['field_id']?contains("资质原件"))>
		 				<@formatter库.新页签_资质   "内网" "ftp://192.168.40.235:7777/"/>
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








