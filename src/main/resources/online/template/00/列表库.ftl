<#macro 屏蔽按钮>
	//将没有权限的按钮屏蔽掉
	<#list config_nolist as x>
		$("#${config_id}Listtb").find("#${x}").hide();
	</#list>
</#macro>
<#macro 查询>
	/**
	 * 列表查询
	 */
	function ${config_id}Listsearch(){
		var queryParams=$('#${config_id}List').<#if config_istree=="Y">treegrid<#else>datagrid</#if>('options').queryParams;
		$('#${config_id}Listtb').find('*').each(
			function(){
			queryParams[$(this).attr('name')]=$(this).val();});
			$('#${config_id}List').<#if config_istree=="Y">treegrid<#else>datagrid</#if>({url:'列表.do?datagrid&configId=${config_id}&field=${fileds}',pageNumber:1});
	}
	function dosearch(params){
		var jsonparams=$.parseJSON(params);
		$('#${config_id}List').<#if config_istree=="Y">treegrid<#else>datagrid</#if>({url:'列表.do?datagrid&configId=${config_id}&field=${fileds},',queryParams:jsonparams});
	}
	function ${config_id}Listsearchbox(value,name){
		var queryParams=$('#${config_id}List').<#if config_istree=="Y">treegrid<#else>datagrid</#if>('options').queryParams;
		queryParams[name]=value;
		queryParams.searchfield=name;
		$('#${config_id}List').<#if config_istree=="Y">treegrid<#else>datagrid</#if>('reload');
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
</#macro> 
<#macro 增改看>
    //----author:jg_xugj---start----date:20151219-------- for：#813 【online表单】扩展出三个请求：独立的添加、查看、编辑请求，原来的保留
	//新增
	function ${config_id}add(){

		//add('${config_name}录入','rest/cgform/form/${config_id}','${config_id}List',${config_id}Fw,${config_id}Fh);

		
		add('${config_name}录入','cgFormBuildController.do?goAddFtlForm&tableName=${config_id}&olstylecode=${_olstylecode}','${config_id}List',${config_id}Fw,${config_id}Fh);
	}
	//修改
	function ${config_id}update(){

		//update('${config_name}编辑','rest/cgform/form/${config_id}','${config_id}List',${config_id}Fw,${config_id}Fh,true);

		
		update('${config_name}编辑','cgFormBuildController.do?goUpdateFtlForm&tableName=${config_id}&olstylecode=${_olstylecode}','${config_id}List',${config_id}Fw,${config_id}Fh);
	}
	//查看
	function ${config_id}view(){
		detail('查看','cgFormBuildController.do?goDatilFtlForm&tableName=${config_id}&mode=read&olstylecode=${_olstylecode}','${config_id}List',${config_id}Fw,${config_id}Fh);
	}	
</#macro> 
<#macro 列表增改看kk>
function ${config_id}addkk(){
	addkk('${config_name}录入','表单.do?goAddFtlForm&tableName=${config_id}&olstylecode=${_olstylecode}','${config_id}List',${config_id}Fw,${config_id}Fh);
}
//修改
function ${config_id}updatekk(){
	updatekk('${config_name}编辑','表单.do?goUpdateFtlForm&tableName=${config_id}&olstylecode=${_olstylecode}','${config_id}List',${config_id}Fw,${config_id}Fh);
}
//查看
function ${config_id}view(){
	detail('查看','表单.do?goDatilFtlForm&tableName=${config_id}&mode=read&olstylecode=${_olstylecode}','${config_id}List',${config_id}Fw,${config_id}Fh);
}	
</#macro> 
<#macro 批量删除>
	//批量删除
	function ${config_id}delBatch(){
		//获取选中的ID串
		var ids = get${config_id}ListSelections('id');
		if(ids.length<=0){
			tip('请选择至少一条信息');
			return;
		}
		$.dialog.confirm('确定删除吗?', function(r) {
			if(!r){return;}
			$.ajax({
			    url:"列表.do?delBatch",
			    data:{'ids':ids,'configId':'${config_id}'},
				type:"Post",
			    dataType:"json",
			    success:function(data){
					tip(data.msg);
					reload${config_id}List();
			    },
				error:function(data){
					$.messager.alert('错误',data.msg);
				}
			});
			}
		);
	}
</#macro>

















