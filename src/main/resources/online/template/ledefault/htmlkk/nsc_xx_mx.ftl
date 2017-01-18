${config_iframe}
<script type="text/javascript">
/**
*表单的高度,表单的宽度
**/
var ${config_id}Fw = "1080",${config_id}Fh = "600";

$(function(){			
	$.get("cgFormHeadController.do?checkIsExit&checkIsTableCreate&name=${config_id}",
	function(data){
		data = $.parseJSON(data);
		if(data.success){
			createDataGrid${config_id}();
		}else{
			alertTip('表:<span style="color:red;">${config_id}</span>还没有生成,请到表单配置生成表');
		}
	});
	
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
							<#--kk-->
						 	<#if x['field_id'] = "链接">
						 	formatter:function(value,rec,index){
						 		var href='';
						 		href+="<a href='javascript:void(0)' onclick=dkwj("+index+",'${config_id}List')>";
								href+="→</a>";
						 		return href;
						 	},
						 	</#if>
						 	<#--kk-->						 	
						 	<#if x['field_href'] != "">
						 	formatter:function(value,rec,index){
						 		var href='';
						 		href+=applyHref('字段链接','${x['field_href']}',value,rec,index);
						 		return href;
						 	},
						 	</#if>
						 	<#if x['field_showType']=="file">
						 	formatter:function(value,rec,index){
						 		var href='';
						 		if(value==null || value.length==0){
						 			return href;
						 		}
						 		if(value.indexOf(".jpg")>-1 || value.indexOf(".gif")>-1 || value.indexOf(".png")>-1){
						 			href+="<img src='"+value+"'/>";
						 		}else{
						 			href+="<a href='"+value+"' target=_blank><u>点击下载</u></a>";
						 		}
						 		return href;
						 	},
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
						 	<#-- update-start--Author: jg_huangxg  Date:20160113 for：TASK #824 【online开发】控件类型扩展增加一个图片类型 image -->
						 	<#if x['field_showType']=="image">
						 	formatter:function(value,rec,index){
						 		var href='';
						 		if(value==null || value.length==0){
						 			return href;
						 		}
						 		href+="<img src='"+value+"' width=100 height=50/>";
						 		return href;
						 	},
						 	styler: function(value,row,index){
								return 'text-align: center;';
						 	},
						 	</#if>
						 	<#-- update-end--Author: jg_huangxg  Date:20160113 for：TASK #824 【online开发】控件类型扩展增加一个图片类型 image -->
						 	sortable:true,
						 	width:${x['field_length']}
						 	},
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
		window.parent.$("#cslj").val(rowData.路径);
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
	function dkwj(index,name){	
		var row = $('#'+name).datagrid('getRows')[index];
		location.href='myexplorer:'+row.路径;
//		 alert($("#kk88").prop('tagName')+row.路径);	
	}

//var rowIndex = $('#tt').datagrid('getRowIndex', id);

//kk收集数据保存——————————————————


	//列表刷新
	function reloadTable(){	
		try{
		<#if config_istree=="Y">
			$('#'+gridname).treegrid('reload');
		<#else>
			$('#'+gridname).datagrid('reload');
		</#if>
		}catch(ex){
			//donothing
		}
	}
	//列表刷新-推荐使用
	function reload${config_id}List(){
		$('#${config_id}List').datagrid('reload');
	}
	/**
	 * 获取列表中选中行的数据-推荐使用
	 * @param field 数据中字段名
	 * @return 选中行的给定字段值
	 */
	function get${config_id}ListSelected(field){
		var row = $('#${config_id}List').datagrid('getSelected');
		if(row!=null){value= row[field];
		}else{
			value='';
		}
		return value;
	}
	/**
	 * 获取列表中选中行的数据
	 * @param field 数据中字段名
	 * @return 选中行的给定字段值
	 */
	function getSelected(field){
		var row = $('#'+gridname).datagrid('getSelected');
		if(row!=null){value= row[field];
		}else{
			value='';
		}
		return value;
	}
	
	/**
	 * 获取表格对象
	 * @return 表格对象
	 */
	function getDataGrid(){
		var datagrid = $('#'+gridname);
		return datagrid;
	}
	/**
	 * 获取列表中选中行的数据（多行）
	 * @param field 数据中字段名-不传此参数则获取全部数据
	 * @return 选中行的给定字段值，以逗号分隔
	 */
	function get${config_id}ListSelections(field){
		var ids = '';
		var rows = $('#${config_id}List').datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			ids+=rows[i][field];
			ids+=',';
		}
		ids = ids.substring(0,ids.length-1);
		return ids;
	}
	/**
	 * 列表查询
	 */
	function ${config_id}Listsearch(){
		var queryParams=$('#${config_id}List').datagrid('options').queryParams;
		$('#${config_id}Listtb').find('*').each(
			function(){
			queryParams[$(this).attr('name')]=$(this).val();});
			$('#${config_id}List').datagrid({url:'cgAutoListController.do?datagrid&configId=${config_id}&field=${fileds}',pageNumber:1});
	}
	function dosearch(params){
		var jsonparams=$.parseJSON(params);
		$('#${config_id}List').datagrid({url:'cgAutoListController.do?datagrid&configId=${config_id}&field=${fileds},',queryParams:jsonparams});
	}
	function ${config_id}Listsearchbox(value,name){
		var queryParams=$('#${config_id}List').datagrid('options').queryParams;
		queryParams[name]=value;
		queryParams.searchfield=name;
		$('#${config_id}List').datagrid('reload');
	}
	$('#${config_id}Listsearchbox').searchbox({
		searcher:function(value,name){
			${config_id}Listsearchbox(value,name);
		},
		menu:'#${config_id}Listmm',
		prompt:'请输入查询关键字'
	});
	//查询重置
	function ${config_id}searchReset(name){ 
		$("#"+name+"tb").find("input[type!='hidden']").val("");
		<#if config_istree=="Y">
		//为树形表单时，删除id查询参数
		delete $('#${config_id}List').treegrid('options').queryParams.id;  
		</#if>
		${config_id}Listsearch();
	}
	//将字段href中的变量替换掉
	function applyHref(tabname,href,value,rec,index){
		//addOneTab(tabname,href);
		var hrefnew = href;
		var re = "";
		var p1 = /\#\{(\w+)\}/g;
		try{
			var vars =hrefnew.match(p1); 
			for(var i=0;i<vars.length;i++){
				var keyt = vars[i];
				var p2 = /\#\{(\w+)\}/g;
				var key = p2.exec(keyt);
				 hrefnew =  hrefnew.replace(keyt,rec[key[1]]);
			}
		}catch(ex){
		}
		re += "<a href = '#' onclick=\"addOneTab('"+tabname+"','"+ hrefnew+"')\" ><u>"+value+"</u></a>";
		return re;
	}
	//SQL增强入口-按钮
	function doBusButton(url,content,gridname){
		var rowData = $('#'+gridname).datagrid('getSelected');
		if (!rowData) {
			tip('请选择一条信息');
			return;
		}	
		url = url + '&id='+rowData.id;
		createdialog('确认 ', '确定'+content+'吗 ?', url,gridname);
	}
	//SQL增强入口-操作列里的链接
	function doBusButtonForLink(url,content,gridname,rowData){
		if (!rowData) {
			tip('请选择一条信息');
			return;
		}	
		url = url + '&id='+rowData;
		createdialog('确认 ', '确定'+content+'吗 ?', url,gridname);
	}

</script>
<table width="100%"   id="${config_id}List" toolbar="#${config_id}Listtb"></table>
<table width="100%"   id="kk" toolbar="#${config_id}Listtb"></table>

