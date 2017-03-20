<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
    	if(location.href.indexOf("load=detail")!=-1){
			$(":input").attr("disabled","true");
		}
    });
</script>

<div style="margin: 0 15px; background-color: white;">    
	    <!-- Table -->
<table id="nsc数据表材质_table" class="table table-bordered table-hover" style="margin-bottom: 0;">
		
	<tbody id="add_nsc数据表材质_table" >	
	<c:if test="${fn:length(nsc数据表材质List)  <= 0 }">
			<tr>
					<input name="nsc数据表材质List[0].id" type="hidden"  value="${poVal.id}"/>
					<input name="nsc数据表材质List[0].wj" type="hidden"  value="${poVal.wj}"/>
			</tr>
				<tr>
				    <td class="text-center">
						<b>泵体泵盖:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].泵体泵盖" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">泵体泵盖</label>
					</td>
				    <td class="text-center">
						<b>叶轮:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].叶轮" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">叶轮</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>主轴:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].主轴" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">主轴</label>
					</td>
				    <td class="text-center">
						<b>轴套:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].轴套" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">轴套</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>密封环:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].密封环" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">密封环</label>
					</td>
				    <td class="text-center">
						<b>轴承:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].轴承" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">轴承</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>轴封:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].轴封" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">轴封</label>
					</td>
				    <td class="text-center">
						<b>材质特殊要求:</b>
					</td>
				  <td>
					       	<input name="nsc数据表材质List[0].材质特殊要求" maxlength="500" 
						  		type="text" style="width:120px;" class="form-control"   >
					  <label class="Validform_label" style="display: none;">材质特殊要求</label>
					</td>
				</tr>
	</c:if>
	<c:if test="${fn:length(nsc数据表材质List)  > 0 }">
		<c:forEach items="${nsc数据表材质List}" var="poVal" varStatus="stuts" begin="0" end="0">
			<tr>
					<input name="nsc数据表材质List[0].id" type="hidden" value="${poVal.id}"/>
					<input name="nsc数据表材质List[0].wj" type="hidden" value="${poVal.wj}"/>
			</tr>
			<tr>
				  <td class="text-center">
						<b>泵体泵盖:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].泵体泵盖" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.泵体泵盖 }">
					  <label class="Validform_label" style="display: none;">泵体泵盖</label>
					</td>
				  <td class="text-center">
						<b>叶轮:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].叶轮" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.叶轮 }">
					  <label class="Validform_label" style="display: none;">叶轮</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>主轴:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].主轴" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.主轴 }">
					  <label class="Validform_label" style="display: none;">主轴</label>
					</td>
				  <td class="text-center">
						<b>轴套:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].轴套" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.轴套 }">
					  <label class="Validform_label" style="display: none;">轴套</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>密封环:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].密封环" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.密封环 }">
					  <label class="Validform_label" style="display: none;">密封环</label>
					</td>
				  <td class="text-center">
						<b>轴承:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].轴承" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.轴承 }">
					  <label class="Validform_label" style="display: none;">轴承</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>轴封:</b>
					</td>
				  <td>
					  	<input name="nsc数据表材质List[0].轴封" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.轴封 }">
					  <label class="Validform_label" style="display: none;">轴封</label>
					</td>
				  <td class="text-center">
						<b>材质特殊要求:</b>
					</td>
				  <td>
					       	<input name="nsc数据表材质List[0].材质特殊要求" maxlength="500" 
						  		type="text" style="width:120px;" class="form-control"   value="${poVal.材质特殊要求 }">
					  <label class="Validform_label" style="display: none;">材质特殊要求</label>
					</td>
				</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>