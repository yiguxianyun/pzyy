   <#--update-start--Author:luobaoli  Date:20150614 for：表单类型为onetoone子表属性中增加了扩展参数 ${po.extend_json!}-->
   <div class="con-wrapper" id="con-wrapper${sub_index}" style="display: none;">
	 <div class="row form-wrapper">
			<#if data['${sub}']?exists&&(data['${sub}']?size>1) >
				<div><font color="red">该附表下存在多条数据</font></div>
			<#else>
				<input type="hidden" name="${sub}[0].id" id="${sub}[0].id" 
				 	<#if !data['${sub}']??> value=""<#else> value="${data['${sub}'][0]['id']?if_exists?html}"</#if>/>
				<#list field['${sub}'].hiddenFieldList as subTableField >
					<input type="hidden" name="${sub}[0].${subTableField.field_name}" id="${sub}[0].${subTableField.field_name}" 
					<#if !data['${sub}']??> value=""<#else> value="${data['${sub}'][0]['${subTableField.field_name}']!?html}"</#if>/>
				</#list>
			 				 
				<#list field['${sub}'].fieldNoAreaList as subTableField >
				<div class="col-xs-2" >
		          <b>${subTableField.content!?html}：</b>
     				
				<#if subTableField.show_type=='text'>
					<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="text"
						 class="form-control" 	<#if !data['${sub}']??> value="${subTableField.moren}"<#else> value="${data['${sub}'][0]['${subTableField.field_name}']!?html}"</#if>				         
					<@kk.字段验证 subTableField/>
					>
				
				<#elseif subTableField.show_type=='password'>
					<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}"  type="password"
					        class="form-control" value="${data['${sub}']['${subTableField.field_name}']!?html}"
			               nullmsg="请输入${subTableField.content}！"
			               
			               <#if subTableField.field_valid_type!?html != ''>
			               datatype="${subTableField.field_valid_type!?html}"
			               <#else>
               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
			               </#if>>
				
				<#elseif subTableField.show_type=='radio'>
			        <@DictData name="${subTableField.dict_field!?html}" text="${subTableField.dict_text!?html}" tablename="${subTableField.dict_table!?html}" var="dataList">
						<#list dataList as dictdata> 
						<input value="${dictdata.typecode!?html}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="radio" <#if subTableField.is_null != 'Y'>datatype="*"</#if>>
							${dictdata.typename!?html}
						</#list> 
					</@DictData>
			               
				<#elseif subTableField.show_type=='checkbox'>
					<@DictData name="${subTableField.dict_field!?html}" text="${subTableField.dict_text!?html}" tablename="${subTableField.dict_table!?html}" var="dataList">
						<#list dataList as dictdata> 
						<input value="${dictdata.typecode!?html}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="checkbox" <#if subTableField.is_null != 'Y'>datatype="*"</#if>>
							${dictdata.typename!?html}
						</#list> 
					</@DictData>
			               
				<#elseif subTableField.show_type=='list'>
					<@DictData name="${subTableField.dict_field!?html}" text="${subTableField.dict_text!?html}" tablename="${subTableField.dict_table!?html}" var="dataList">
						<select id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} class="form-control" name="${sub}[0].${subTableField.field_name}" <#if subTableField.is_null != 'Y'>datatype="*"</#if>>
							<#list dataList as dictdata> 
							<option value="${dictdata.typecode!?html}" 
							<#if dictdata.typecode!?html=="${data['${sub}']['${subTableField.field_name}']!?html}"> selected="selected" </#if>>
								${dictdata.typename!?html}
							</option> 
							</#list> 
						</select>
					</@DictData>
					
				<#elseif subTableField.show_type=='date'>
					<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="text"
					         value="${data['${sub}']['${subTableField.field_name}']?if_exists?html}"
					       class="form-control" onClick="WdatePicker()" 
			               nullmsg="请输入${subTableField.content}！"
			               
			               <#if subTableField.field_valid_type!?html != ''>
			               datatype="${subTableField.field_valid_type!?html}"
			               <#else>
               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
			               </#if>>
				
				<#elseif subTableField.show_type=='datetime'>
					<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="text"
					         value="${data['${sub}']['${subTableField.field_name}']?if_exists?html}"
					       class="form-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
			               nullmsg="请输入${subTableField.content}！"
			               
			               <#if subTableField.field_valid_type!?html != ''>
			               datatype="${subTableField.field_valid_type!?html}"
			               <#else>
               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
			               </#if>>
			               
				<#elseif subTableField.show_type=='popup'>
					<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}"  type="text"
					        class="form-control searchbox-inputtext15" 
					       onClick="inputClick(this,'${subTableField.dict_text!?html}','${subTableField.dict_table!?html}');"
					       value="${data['${sub}']['${subTableField.field_name}']?if_exists?html}" 
			               nullmsg="请输入${subTableField.content}！"
			               
			               <#if subTableField.field_valid_type!?html != ''>
			               datatype="${subTableField.field_valid_type!?html}"
			               <#else>
               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
			               </#if>>
				
				<#elseif subTableField.show_type=='file'>
					<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="text"
					        class="form-control" value="${data['${sub}']['${subTableField.field_name}']?if_exists?html}"
			               nullmsg="请输入${subTableField.content}！"
			               
			               <#if subTableField.field_valid_type!?html != ''>
			               datatype="${subTableField.field_valid_type!?html}"
			               <#else>
               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
			               </#if>>
			               
				<#else>
					<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" type="text"
					        class="form-control" value="${data['${sub}']['${subTableField.field_name}']?if_exists?html}"
			               nullmsg="请输入${subTableField.content}！"
			               
			               <#if subTableField.field_valid_type!?html != ''>
			               datatype="${subTableField.field_valid_type!?html}"
			               <#else>
			               <#if subTableField.type == 'int'>
			               datatype="n" 
			               <#elseif subTableField.type=='double'>
			               datatype="/^(-?\d+)(\.\d+)?$/" 
			                <#else>
               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
			               </#if></#if>>
			               
				</#if>
				
				<label class="Validform_label" style="display: none;">${subTableField.content!?html}</label>
				</div>
				</#list>
				<#list field['${sub}'].fieldAreaList as subTableField>
				  	<div class="row show-grid">
						<div class="col-xs-3 text-center">
				          <b>${subTableField.content!?html}：</b>
				        </div>
						<div class="col-xs-3">
							<textarea id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json!} name="${sub}[0].${subTableField.field_name}" 
							       style="width: 600px" class="form-control" rows="6"
					               <#if subTableField.field_valid_type!?html != ''>
					               datatype="${subTableField.field_valid_type!?html}"
					               <#else>
					               <#if subTableField.is_null != 'Y'>datatype="*"</#if>
					               </#if>>${data['${sub}']['${subTableField.field_name}']?if_exists?html}</textarea>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">${sub}[0].${subTableField.content!?html}</label>
						</div>
					</div>
			  	</#list>
		</#if>
		
	</div>
</div>
<#--update-end--Author:luobaoli  Date:20150614 for：表单类型为onetoone子表属性中增加了扩展参数 ${po.extend_json!}-->
