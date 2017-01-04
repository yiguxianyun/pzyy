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
			 class="form-control" 	value="${subTableData['${subTableField.field_name}']!'${subTableField.moren}'?html}"				         
		<@字段验证 subTableField/>
		>    
</#macro>        

<#macro ifList subTableField sub subTableData>
	<@DictData name="${subTableField.dict_field!?html}" text="${subTableField.dict_text!?html}" tablename="${subTableField.dict_table!?html}" var="dataList">
		<select id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} class="form-control" name="${sub}[0].${subTableField.field_name}"
		 <#if subTableField.is_null != 'Y'>datatype="*"</#if>>
			<#list dataList as dictdata> 
			<option value="${dictdata.typecode!?html}" 
			<#if dictdata.typecode!?html=="${subTableData['${subTableField.field_name}']!?html}"> selected="selected" </#if>>
				${dictdata.typename!?html}
			</option> 
			</#list>
			<#if data['${sub}']??> 
			<option value="${subTableData['${subTableField.field_name}']}" selected="selected">
					${subTableData['${subTableField.field_name}']}</option>
			</#if>
		</select>
	</@DictData>  
</#macro> 
<!-- <#--主表判断--> -->
<#macro ifTextZhuBiao po data tableName>
		<input id="${po.field_name}" ${po.extend_json?if_exists} name="${po.field_name}" type="text"
	        class="form-control" 
	        <#if id?if_exists?html == ''> value="${po.moren}"
				        <#else> value="${data['${tableName}']['${po.field_name}']?if_exists?html}"
				        </#if>	
              <#if po.operationCodesReadOnly?exists> readonly = "readonly"</#if>
       <@字段验证 po/>
		>
</#macro>























