<div class="con-wrapper" id="con-wrapper${sub_index}" style="display: none;">
	<div class="row form-wrapper">
		<#if data['${sub}']??> <#assign subTableData=data['${sub}'][0]> 
		<#else> <#assign subTableData={}> 
		</#if>
		<#if data['${sub}']?exists&&(data['${sub}']?size>1) >
			<div><font color="red">该附表下存在多条数据</font></div>
		<#else>
			<input type="hidden" name="${sub}[0].id" id="${sub}[0].id" value="${subTableData['id']!?html}"/>
			<#list field['${sub}'].hiddenFieldList as subTableField >
				<input type="hidden" name="${sub}[0].${subTableField.field_name}" id="${sub}[0].${subTableField.field_name}" 
				value="${subTableData['${subTableField.field_name}']!?html}"/>
			</#list>
			<#list field['${sub}'].fieldNoAreaList as subTableField >
				<#assign zdmc=subTableField.field_name>
				<#if !(zdmc?starts_with("cz_"))||!(zdmc?starts_with("jg_"))><#--zdmc=字段名称-->
					<div class="col-xs-2">
	          		<b style="vertical-align:bottom;">${subTableField.content!?html}：</b>	          	
					<#if subTableField.show_type=='text'>
						<@kk.ifText subTableField sub subTableData/>	
					<#elseif subTableField.show_type=='list'>
						<@kk.ifList subTableField sub subTableData/>
					<#else>
					</#if>
					<label class="Validform_label" style="display: none;">${subTableField.content!?html}</label>
					</div>
				<#elseif (zdmc?starts_with("cz_"))>
					<div class="col-xs-2" >
		          	<b>${subTableField.content!?html}：</b>	          	
					<#if subTableField.show_type=='text'>
						<@kk.ifText subTableField sub subTableData/>	
					<#elseif subTableField.show_type=='list'>
						<@kk.ifList subTableField sub subTableData/>
					<#else>
					</#if>
					<#assign zdmc2=zdmc?replace("cz_","jg_")>
					<#list field['${sub}'].fieldNoAreaList as subTableField2 >					
						<#if subTableField2.field_name==zdmc2>
							<b>${subTableField2.content!?html}：</b>
							<@kk.ifText subTableField2 sub subTableData/>		
						</#if>
					</#list>	
							
				<label class="Validform_label" style="display: none;">${subTableField.content!?html}</label>
				</div>
				
				</#if>	
			</#list>
		</#if>		
	</div>
</div>
