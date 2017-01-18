<#macro 字段验证 subTableField>
	nullmsg="“${subTableField.content}”请输入合适的数据！"
	<#if subTableField.is_null = 'Y'>
		datatype="/.*/"									               
	<#elseif subTableField.field_valid_type?if_exists?html != ''>
		datatype="${subTableField.field_valid_type?if_exists?html}"
	<#elseif subTableField.type == 'int'>
		datatype="n" 
	<#elseif subTableField.type=='double'>
		datatype="/^(-?\d+)(\.\d+)?$/" 
	<#else>
		<#if subTableField.is_null != 'Y'>datatype="*"</#if>
	</#if>
</#macro>	 

<#macro ifText subTableField sub subTableData>
		<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="text"
			 class="form-control" 
         	<#if !data['${sub}']??> value="${subTableField.moren}"
	        <#else> value="${subTableData['${subTableField.field_name}']!?html}"
	        </#if>					         
		<@字段验证 subTableField/>
		>    
</#macro>
<#macro ifList subTableField sub subTableData class="form-control">
	<@DictData name="${subTableField.dict_field!?html}" text="${subTableField.dict_text!?html}" tablename="${subTableField.dict_table!?html}" var="dataList">
		<select id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} class=${class} name="${sub}[0].${subTableField.field_name}"
		 <#if subTableField.is_null != 'Y'>datatype="*"</#if>>
			<#list dataList as dictdata> 
			<option value="${dictdata.typecode!?html}" 
			<#if !data['${sub}']??> <#if dictdata.typecode!?html=="${subTableField.moren}"> selected="selected" </#if>>
	        <#else> <#if dictdata.typecode!?html=="${subTableData['${subTableField.field_name}']!?html}"> selected="selected" </#if>>
	        </#if>
			${dictdata.typename!?html}
			</option> 
			</#list>
			<#if (data['${sub}']??)&&(subTableField.dict_field!?html== '')> 
			<option value="${subTableData['${subTableField.field_name}']}" selected="selected">
			${subTableData['${subTableField.field_name}']}</option>
			</#if>
		</select>
	</@DictData>  
</#macro>
<#macro textarea subTableField sub subTableData rows=2>
	<textarea id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" 
	      style="overflow:visible" class="form-control" rows=${rows}  <@字段验证 subTableField/> >
	${subTableData['${subTableField.field_name}']?if_exists?html}</textarea>	             
</#macro>
<#macro ifcheckbox subTableField sub subTableData value="true">
	<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="checkbox"
	style="-webkit-transform: scale(1.3)" value=${value} 
	<#if !data['${sub}']??>
		<#if subTableData['${subTableField.field_name}']!'${subTableField.moren}'?html=='${value}'>checked</#if>
	<#else>
		<#if subTableData['${subTableField.field_name}']!?html=='${value}'>checked</#if>
	</#if>	
	>
</#macro>
<#macro ifradio subTableField sub subTableData>	
	<@DictData name="${subTableField.dict_field!?html}" text="${subTableField.dict_text!?html}" tablename="${subTableField.dict_table!?html}" var="dataList">
		<#list dataList as dictdata> 
		<input value="${dictdata.typecode!?html}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="radio" 
			style="-webkit-transform: scale(1.2)" 
			<#if !data['${sub}']??>
				<#if subTableData['${subTableField.field_name}']!'${subTableField.moren}'?html=="${dictdata.typecode!?html}" >checked</#if>
			<#else>
				<#if subTableData['${subTableField.field_name}']!?html=="${dictdata.typecode!?html}">checked</#if>
			</#if>	
		>	${dictdata.typename!?html}
		</#list> 
	</@DictData>
</#macro> 
<!-- <#--主表判断--> -->
<#macro ifTextZhuBiao po>
	<input id="${po.field_name}" ${po.extend_json?if_exists} name="${po.field_name}" type="text"
        class="form-control" 
        <#if id?if_exists?html == ''> value="${po.moren}"
        <#else> value="${data['${tableName}']['${po.field_name}']?if_exists?html}"
        </#if>	
           <#if po.operationCodesReadOnly?exists> readonly = "readonly"</#if>
      <@字段验证 po/>
	>
</#macro>
<#macro ifListZhuBiao po>
	<@DictData name="${po.dict_field?if_exists?html}" text="${po.dict_text?if_exists?html}" tablename="${po.dict_table?if_exists?html}" var="dataList">
		<select id="${po.field_name}" ${po.extend_json?if_exists} class="form-control" name="${po.field_name}" <#if po.operationCodesReadOnly?if_exists>onfocus="this.defOpt=this.selectedIndex" onchange="this.selectedIndex=this.defOpt;"</#if><#if po.is_null != 'Y'>datatype="*"</#if> >
			<#list dataList as dictdata> 
			<option value="${dictdata.typecode?if_exists?html}" 
			<#if id?if_exists?html == ''> <#if dictdata.typecode?if_exists?html=="${po.moren}"> selected="selected" </#if>>
	        <#else> <#if dictdata.typecode?if_exists?html=="${data['${tableName}']['${po.field_name}']?if_exists?html}"> selected="selected" </#if>>
	        </#if>
				${dictdata.typename?if_exists?html}
			</option> 
			</#list>		
		</select>
	</@DictData>
</#macro>
<#macro ifdateZhuBiao po>
<input id="${po.field_name}" ${po.extend_json?if_exists} name="${po.field_name}" type="text"
	value="${data['${tableName}']['${po.field_name}']?if_exists?html}"
	class="form-control" onClick="WdatePicker({<#if po.operationCodesReadOnly?if_exists> readonly = true</#if>})" 
	<@字段验证 po/>
	>
</#macro>

<#macro 找字段 sub 字段名称>
	<#list field['${sub}'].fieldNoAreaList as subTableField >
		<#if subTableField.field_name?matches(字段名称)>
			<#assign 字段=subTableField>
		</#if>		
	</#list>
</#macro>	

<#macro 找主表字段 字段名称>
	<#list columns as po>
		<#if po.field_name?matches(字段名称)>
			<#assign 字段=po>
		</#if>		
	</#list>
</#macro>


















