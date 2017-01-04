
					    <#--update-start--Author:luobaoli  Date:20150614 for：表单类型为onetoone子表属性中增加了扩展参数 ${po.extend_json?if_exists}-->
					    <div class="con-wrapper" id="con-wrapper${sub_index}" style="display: none;">
							 <div class="row form-wrapper"> 
								<#if data['${sub}']?exists&&(data['${sub}']?size>0) >
								<#if (data['${sub}']?size>1) >
									<div><font color="red">该附表下存在多条数据</font></div>
								<#else>
										<#list data['${sub}'] as subTableData >
											<input type="hidden" name="${sub}[${subTableData_index}].id" id="${sub}[${subTableData_index}].id" value="${subTableData['id']?if_exists?html}"/>
											<#list field['${sub}'].hiddenFieldList as subTableField >
											<input type="hidden" name="${sub}[${subTableData_index}].${subTableField.field_name}" id="${sub}[${subTableData_index}].${subTableField.field_name}" value="${subTableData['${subTableField.field_name}']?if_exists?html}"/>
											</#list> 
											

										</#list>
									</#if>
									<#else>

								</#if>
							</div>
						</div>
						<#--update-end--Author:luobaoli  Date:20150614 for：表单类型为onetoone子表属性中增加了扩展参数 ${po.extend_json?if_exists}-->
					