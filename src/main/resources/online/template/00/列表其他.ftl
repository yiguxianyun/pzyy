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
		$('#${config_id}List').<#if config_istree=="Y">treegrid<#else>datagrid</#if>('reload');
	}
/**
	 * 获取列表中选中行的数据-推荐使用
	 * @param field 数据中字段名
	 * @return 选中行的给定字段值
	 */
	function get${config_id}ListSelected(field){
		var row = $('#${config_id}List').<#if config_istree=="Y">treegrid<#else>datagrid</#if>('getSelected');
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
		var row = $('#'+gridname).<#if config_istree=="Y">treegrid<#else>datagrid</#if>('getSelected');
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
		var rows = $('#${config_id}List').<#if config_istree=="Y">treegrid<#else>datagrid</#if>('getSelections');
		for(var i=0;i<rows.length;i++){
			ids+=rows[i][field];
			ids+=',';
		}
		ids = ids.substring(0,ids.length-1);
		return ids;
	}

















