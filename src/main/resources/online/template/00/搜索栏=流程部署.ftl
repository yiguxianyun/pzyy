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
	<span style="float:left;" >

	<a  id="add" href="javascript:void(0)"  class="easyui-linkbutton" plain="true"  icon="icon-add" onclick="${config_id}addkk()">录入</a>
	<a  id="update" href="javascript:void(0)"  class="easyui-linkbutton" plain="true"  icon="icon-edit" onclick="${config_id}updatekk()">编辑</a>

	<a id="detail" href="javascript:void(0)" class="easyui-linkbutton" plain="true"  icon="icon-search" onclick="${config_id}view()">查看</a>

	
	<#list config_buttons as x>
		<#if x['buttonStyle'] == 'button' && x['buttonStatus']=='1'>
			<a id="${x['buttonCode']}" href="javascript:void(0)" class="easyui-linkbutton" plain="true"  icon="${x['buttonIcon']?if_exists?default('pictures')}" 
				<#if x['optType'] == 'action'>
				onclick="doBusButton('cgFormBuildController.do?doButton&formId=${x['formId']}&buttonCode=${x['buttonCode']}&tableName=${config_id}','${x['buttonName']}','${config_id}List')">${x['buttonName']}</a>
				<#else>
				onclick="${x['buttonCode']}();">${x['buttonName']}</a>
				</#if>
		</#if>
	</#list>
	</span>
	
		<span style="float:right">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="${config_id}Listsearch()">查询</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" onclick="${config_id}searchReset('${config_id}List')">重置</a>
		</span>
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
	</div>
</div>



