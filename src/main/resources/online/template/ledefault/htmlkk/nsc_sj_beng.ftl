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
				<#if !zdmc?contains("_")><#--zdmc=字段名称-->
					<div class="col-xs-2">
	          		<p style="margin:-5px 0px -10px;font-weight:bold">${subTableField.content!?html}：</p>	          	
					<#if subTableField.show_type=='text'>
						<@kk.ifText subTableField sub subTableData/>	
					<#elseif subTableField.show_type=='list'>
						<@kk.ifList subTableField sub subTableData/>
					<#else>
					</#if>
					<label class="Validform_label" style="display: none;">${subTableField.content!?html}</label>
					</div>
				</#if>	
			</#list>
			
			<div class="col-xs-12" ><b class="text-info">按分项计算</b><hr class="text-info" style="margin:-5px;border:1px dashed ;"></div>			
			<#list field['${sub}'].fieldNoAreaList as subTableField >
				<#assign zdmc=subTableField.field_name>					
				<#if zdmc?starts_with("cz_")>
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
							<@kk.ifText subTableField2 sub subTableData/>		
						</#if>
					</#list>							
					<label class="Validform_label" style="display: none;">${subTableField.content!?html}</label>
					</div>				
				</#if>	
			</#list>
			
			<div class="col-xs-12" ><b class="text-info">按整体计算</b><hr class="text-info" style="margin:-5px;border:1px dashed ;"></div>			
			<#list field['${sub}'].fieldNoAreaList as subTableField >
				<#assign zdmc=subTableField.field_name>					
				<#if zdmc?starts_with("z_")>
					<div class="col-xs-2" >
		          	<b>${subTableField.content!?html}：</b>	          	
					<#if subTableField.show_type=='text'>
						<@kk.ifText subTableField sub subTableData/>	
					<#elseif subTableField.show_type=='list'>
						<@kk.ifList subTableField sub subTableData/>
					<#else>
					</#if>					
					<label class="Validform_label" style="display: none;">${subTableField.content!?html}</label>
					</div>				
				</#if>	
			</#list>
			
			<div class="col-xs-12" style="margin:-15px 0px -25px;"><hr class="text-info" style="border:1px dashed ;"></div>			
			<#list field['${sub}'].fieldNoAreaList as subTableField >
				<#assign zdmc=subTableField.field_name>					
				<#if zdmc?starts_with("f_")>
					<div class="col-xs-2" >
		          	<b>${subTableField.content!?html}：</b>	          	
					<#if subTableField.show_type=='text'>
						<@kk.ifText subTableField sub subTableData/>	
					<#elseif subTableField.show_type=='list'>
						<@kk.ifList subTableField sub subTableData/>
					<#else>
					</#if>					
					<label class="Validform_label" style="display: none;">${subTableField.content!?html}</label>
					</div>				
				</#if>	
			</#list>
			
		</#if>		
	</div>
</div>
