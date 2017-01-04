
										<input type="hidden" name="${sub}[0].id" id="${sub}[0].id" />
										<#list field['${sub}'].hiddenFieldList as subTableField >
										<input type="hidden" name="${sub}[0].${subTableField.field_name}" id="${sub}[0].${subTableField.field_name}"/>
										</#list> 
										<#list field['${sub}'].fieldNoAreaList as subTableField >
										<#if subTableField_index%2==0>
										<div class="row show-grid">
										</#if>
										<div class="col-xs-3 text-center">
								          <b>${subTableField.content?if_exists?html}：</b>
								        </div>
										<div class="col-xs-3">
										<#if subTableField.show_type=='text'>
											<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}" type="text"
											       style="width: 150px" class="form-control"
									               nullmsg="请输入${subTableField.content}！"
									               
									               <#if subTableField.field_valid_type?if_exists?html != ''>
									               datatype="${subTableField.field_valid_type?if_exists?html}"
									               <#else>
									               <#if subTableField.type == 'int'>
									               datatype="n" 
									               <#elseif subTableField.type=='double'>
									               datatype="/^(-?\d+)(\.\d+)?$/" 
									                <#else>
						               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
									               </#if></#if>>
										
										<#elseif subTableField.show_type=='password'>
											<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}"  type="password"
											       style="width: 150px" class="form-control" 
									               nullmsg="请输入${subTableField.content}！"
									               
									               <#if subTableField.field_valid_type?if_exists?html != ''>
									               datatype="${subTableField.field_valid_type?if_exists?html}"
									               <#else>
						               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
									               </#if>>
										
										<#elseif subTableField.show_type=='radio'>
									        <@DictData name="${subTableField.dict_field?if_exists?html}" text="${subTableField.dict_text?if_exists?html}" tablename="${subTableField.dict_table?if_exists?html}" var="dataList">
												<#list dataList as dictdata> 
												<input value="${dictdata.typecode?if_exists?html}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}" type="radio" <#if subTableField.is_null != 'Y'>datatype="*"</#if>>
													${dictdata.typename?if_exists?html}
												</#list> 
											</@DictData>
									               
										<#elseif subTableField.show_type=='checkbox'>
											<@DictData name="${subTableField.dict_field?if_exists?html}" text="${subTableField.dict_text?if_exists?html}" tablename="${subTableField.dict_table?if_exists?html}" var="dataList">
												<#list dataList as dictdata> 
												<input value="${dictdata.typecode?if_exists?html}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}" type="checkbox" <#if subTableField.is_null != 'Y'>datatype="*"</#if>>
													${dictdata.typename?if_exists?html}
												</#list> 
											</@DictData>
									               
										<#elseif subTableField.show_type=='list'>
											<@DictData name="${subTableField.dict_field?if_exists?html}" text="${subTableField.dict_text?if_exists?html}" tablename="${subTableField.dict_table?if_exists?html}" var="dataList">
												<select id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} class="form-control" name="${sub}[0].${subTableField.field_name}" <#if subTableField.is_null != 'Y'>datatype="*"</#if>>
													<#list dataList as dictdata> 
													<option value="${dictdata.typecode?if_exists?html}" >
														${dictdata.typename?if_exists?html}
													</option> 
													</#list> 
												</select>
											</@DictData>
											
										<#elseif subTableField.show_type=='date'>
											<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}" type="text"
											       style="width: 150px"  
											       class="form-control" onClick="WdatePicker()" 
									               nullmsg="请输入${subTableField.content}！"
									               
									               <#if subTableField.field_valid_type?if_exists?html != ''>
									               datatype="${subTableField.field_valid_type?if_exists?html}"
									               <#else>
						               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
									               </#if>>
										
										<#elseif subTableField.show_type=='datetime'>
											<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}" type="text"
											       style="width: 150px"  
											       class="form-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
									               nullmsg="请输入${subTableField.content}！"
									               
									               <#if subTableField.field_valid_type?if_exists?html != ''>
									               datatype="${subTableField.field_valid_type?if_exists?html}"
									               <#else>
						               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
									               </#if>>
									               
										<#elseif subTableField.show_type=='popup'>
											<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}"  type="text"
											       style="width: 150px" class="form-control searchbox-inputtext15" 
											       onClick="inputClick(this,'${subTableField.dict_text?if_exists?html}','${subTableField.dict_table?if_exists?html}');" 
									               nullmsg="请输入${subTableField.content}！"
									               
									               <#if subTableField.field_valid_type?if_exists?html != ''>
									               datatype="${subTableField.field_valid_type?if_exists?html}"
									               <#else>
						               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
									               </#if>>
										
										<#elseif subTableField.show_type=='file'>
											<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}" type="text"
											       style="width: 150px" class="form-control" 
									               nullmsg="请输入${subTableField.content}！"
									               
									               <#if subTableField.field_valid_type?if_exists?html != ''>
									               datatype="${subTableField.field_valid_type?if_exists?html}"
									               <#else>
						               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
									               </#if>>
									               
										<#else>
											<input id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}" type="text"
											       style="width: 150px" class="form-control"
									               nullmsg="请输入${subTableField.content}！"
									               
									               <#if subTableField.field_valid_type?if_exists?html != ''>
									               datatype="${subTableField.field_valid_type?if_exists?html}"
									               <#else>
									               <#if subTableField.type == 'int'>
									               datatype="n" 
									               <#elseif subTableField.type=='double'>
									               datatype="/^(-?\d+)(\.\d+)?$/" 
									                <#else>
						               				<#if subTableField.is_null != 'Y'>datatype="*"</#if>
									               </#if></#if>>
										</#if>
										<label class="Validform_label" style="display: none;">${subTableField.content?if_exists?html}</label>
										</div>
										<#if (subTableField_index%2==0)&&(!subTableField_has_next)>
											<div class="col-xs-3 text-center">
									          <b></b>
									        </div>
											<div class="col-xs-3">
											</div>
										</#if>
										<#if (subTableField_index%2!=0)||(!subTableField_has_next)>
											</div>
										</#if>
										</#list>
										<#list field['${sub}'].fieldAreaList as subTableField>
										  	<div class="row show-grid">
												<div class="col-xs-3 text-center">
										          <b>${subTableField.content?if_exists?html}：</b>
										        </div>
												<div class="col-xs-3">
													<textarea id="${sub}[0].${subTableField.field_name}" ${subTableField.extend_json?if_exists} name="${sub}[0].${subTableField.field_name}" 
													       style="width: 600px" class="form-control" rows="6"
											               <#if subTableField.field_valid_type?if_exists?html != ''>
											               datatype="${subTableField.field_valid_type?if_exists?html}"
											               <#else>
											               <#if subTableField.is_null != 'Y'>datatype="*"</#if>
											               </#if>></textarea>
													<span class="Validform_checktip"></span>
													<label class="Validform_label" style="display: none;">${sub}[0].${subTableField.content?if_exists?html}</label>
												</div>
											</div>
									  	</#list>
							</div>
						</div>
						<#--update-end--Author:luobaoli  Date:20150614 for：表单类型为onetoone子表属性中增加了扩展参数 ${po.extend_json?if_exists}-->
					