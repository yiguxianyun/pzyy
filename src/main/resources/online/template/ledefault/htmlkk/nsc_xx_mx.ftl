${config_iframe}
<#import "/online/template/00/列表库.ftl" as 列表库>
<#import "/online/template/00/formatter库.ftl" as formatter库>
<script type="text/javascript">
/**
*表单的高度,表单的宽度
**/
var ${config_id}Fw = "1080",${config_id}Fh = "600";

$(function(){
	createDataGrid${config_id}();
//	alert($('#kk89').prop('tagName'));
	$('#kk88').bind('click', function(){   	  
	 alert($(this).text()); 
 	 return false;
    }); 
});

function createDataGrid${config_id}(){
	var initUrl = 'NSC选型明细.do?datagrid&configId=${config_id}&field=${fileds}${initquery}';
	initUrl = encodeURI(initUrl);
	var wj=window.parent.$("input[name='id']").val();
	var 状态=window.parent.$("#con-wrapper0").attr("状态");
	var qx=window.parent.$("#q_x").val();
	
	var qs=window.parent.$("#q_s").val();
	var hx=window.parent.$("#h_x").val();
	var hs=window.parent.$("#h_s").val();
	var js=window.parent.$("#js").val();
	js=="不指定"?js=0:{};
	
	$('#${config_id}List').datagrid(
	{
	<#if config_istree=="Y">treeField:'text',</#if>
	queryParams:{wj:wj,状态:状态,qx:qx,qs:qs,hx:hx,hs:hs,js:js},
	url:initUrl,
	idField: 'id', <#if config_istree=="Y">treeField:"${tree_fieldname}",</#if>
	title: '',
	fit:true,
	fitColumns:true,
	striped:true,
	autoRowHeight: true,
	pageSize: 10,
	pagination:true,
	singleSelect:true,
	<#if fileds?index_of("create_datetime")!=-1 >
		sortName:'create_datetime',
	<#elseif fileds?index_of("create_date")!=-1 && fileds?index_of("create_datetime")==-1>
		sortName:'create_date',
	<#else>
		sortName:'id',
	</#if>
	pageList:[50,100],
	sortOrder:'desc',
	rownumbers:true,
	showFooter:true,
	frozenColumns:[[]],
	columns:[
		[	
			<#if config_istree=="Y">
				<#list config_fieldList  as x>  
					<#if x_index==0>{field:"id", title:"${x['field_title']}", hidden:true}, </#if>
					<#if x_index!=0>{field:"${x['field_id']}", title:"${x['field_title']}",<#if x['field_isShow'] == "N" >hidden:true,</#if><#if x['field_href'] != "">formatter:function(value,rec,index){var href='';href+="<a href='javascript:void(0)' onclick=\"addOneTab('字段链接','${x['field_href']}')\" ><u>"+value+"</u></a>";return href;},</#if> width:100}, </#if>
				</#list>
			<#else>
					<#if config_ischeckbox=="Y">{field:'ck',checkbox:true},</#if>
					<#list config_fieldList  as x>  
						 {	field:'${x['field_id']}',
						 	title:'${x['field_title']}',
						 	<#if x['field_isShow'] == "N" >hidden:true,
						 	</#if>
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
						 	<#if (x['field_id']?contains("叶轮直径"))>
						 		<@formatter库.打开测试报告   "局域网" "外"/>
						 		<@formatter库.打开测试报告   "本地" "本地"/>
						 	</#if>
					</#list>
			</#if>
		]
	],
	onLoadSuccess:function(data){
		$("#${config_id}List").datagrid("clearSelections");			
	},
	onClickRow:function(rowIndex,rowData)
		{rowid=rowData.id;gridname='${config_id}List';
		window.parent.$("#xzxh").val(rowData.泵型号);
		window.parent.$("#zsu").val(rowData.转速);
		window.parent.$("#xzid").val(rowData.id);
		window.parent.$("#cslj").val(路径);
		window.parent.$("#gjxl").val(rowData.效率);
		window.parent.jsbzs();
		}
	});
//	$('#${config_id}List').datagrid('getPager').pagination({beforePageText:'',afterPageText:'/{pages}',displayMsg:'{from}-{to}共{total}条',showPageList:true,showRefresh:true});
//	$('#${config_id}List').datagrid('getPager').pagination({onBeforeRefresh:function(pageNumber, pageSize){ $(this).pagination('loading');$(this).pagination('loaded'); }});

	}
//kk收集数据保存——————————————————
	function sjsj(){
		var rows=$('#${config_id}List').datagrid('getRows');
		var result={};	
		for(var i=0;i<rows.length;i++){
			for(var d in rows[i]){
				result["nsc_xx_mx["+i+"]."+d]=rows[i][d];
			}
		}
		return result;

	}
	function 打开测试报告(内外,泵型号){
		var 路径前部;
		内外=="外"?路径前部='\\\\192.168.40.235\\技术支持\\已整理中开泵试验汇总\\':路径前部='E:\\我的工作\\报价所需-2016\\我的秘密武器-2016\\NSC系列测试报告\\已整理中开泵试验汇总\\';
		$.ajax({  
		    type : "post",  
		    url : "通用.do?查测试报告路径",  
		    data : {泵型号:泵型号},  
		    async : false,  
		    success : function(data){ 
		    	路径 = $.parseJSON(data);
		     	location.href='myexplorer:'+路径前部+路径;
// 		     	alert(data);

		    }  
		});
		
// 		var row = $('#'+name).datagrid('getRows')[index];
// 		location.href='myexplorer:'+row.路径;
//		 alert($("#kk88").prop('tagName')+row.路径);	
	}

//var rowIndex = $('#tt').datagrid('getRowIndex', id);

//kk收集数据保存——————————————————

<#include "/online/template/00/列表其他.ftl">
<@列表库.查询/>
<@列表库.增改看/>	
<@列表库.批量删除/>	

</script>
<table width="100%"   id="${config_id}List" toolbar="#${config_id}Listtb"></table>
<table width="100%"   id="kk" toolbar="#${config_id}Listtb"></table>

