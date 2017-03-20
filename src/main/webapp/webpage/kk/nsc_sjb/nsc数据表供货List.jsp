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
<table id="nsc数据表供货_table" class="table table-bordered table-hover" style="margin-bottom: 0;">
		
	<tbody id="add_nsc数据表供货_table" >	
	<c:if test="${fn:length(nsc数据表供货List)  <= 0 }">
			<tr>
					<input name="nsc数据表供货List[0].id" type="hidden"  value="${poVal.id}"/>
					<input name="nsc数据表供货List[0].wj" type="hidden"  value="${poVal.wj}"/>
			</tr>
				<tr>
				    <td class="text-center">
						<b>泵:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].泵价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">泵</label>
					</td>
				    <td class="text-center">
						<b>机封:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].机封价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">机封</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>底座:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].底座价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">底座</label>
					</td>
				    <td class="text-center">
						<b>进/出口反法兰:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].反法兰价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">进/出口反法兰</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>联轴器:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].联轴器价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">联轴器</label>
					</td>
				    <td class="text-center">
						<b>电或柴:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].电或柴价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">电或柴</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>控制柜:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].控制柜价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">控制柜</label>
					</td>
				    <td class="text-center">
						<b>单价:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].单价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">单价</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>总价:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].总价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">总价</label>
					</td>
				    <td class="text-center">
						<b>有无_泵价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无泵价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${nsc数据表供货Page.有无泵价}" hasLabel="false"  title="有无_泵价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_泵价</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>有无_机封价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无机封价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${nsc数据表供货Page.有无机封价}" hasLabel="false"  title="有无_机封价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_机封价</label>
					</td>
				    <td class="text-center">
						<b>有无_底座价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无底座价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${nsc数据表供货Page.有无底座价}" hasLabel="false"  title="有无_底座价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_底座价</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>有无_反法兰价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无反法兰价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${nsc数据表供货Page.有无反法兰价}" hasLabel="false"  title="有无_反法兰价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_反法兰价</label>
					</td>
				    <td class="text-center">
						<b>有无_联轴器价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无联轴器价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${nsc数据表供货Page.有无联轴器价}" hasLabel="false"  title="有无_联轴器价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_联轴器价</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>有无_电或柴价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无电或柴价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${nsc数据表供货Page.有无电或柴价}" hasLabel="false"  title="有无_电或柴价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_电或柴价</label>
					</td>
				    <td class="text-center">
						<b>有无_控制柜价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无控制柜价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="有无" defaultVal="${nsc数据表供货Page.有无控制柜价}" hasLabel="false"  title="有无_控制柜价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_控制柜价</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>包装方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].包装方式" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="包装方式" defaultVal="${nsc数据表供货Page.包装方式}" hasLabel="false"  title="包装方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">包装方式</label>
					</td>
				    <td class="text-center">
						<b>运输方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].运输方式" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="运输方式" defaultVal="${nsc数据表供货Page.运输方式}" hasLabel="false"  title="运输方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">运输方式</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>油漆颜色:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].油漆颜色" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="油漆颜色" defaultVal="${nsc数据表供货Page.油漆颜色}" hasLabel="false"  title="油漆颜色"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">油漆颜色</label>
					</td>
				    <td class="text-center">
						<b>其他附件和配件:</b>
					</td>
				  <td>
					       	<input name="nsc数据表供货List[0].附配件" maxlength="32" 
						  		type="text" style="width:120px;" class="form-control"   >
					  <label class="Validform_label" style="display: none;">其他附件和配件</label>
					</td>
				</tr>
	</c:if>
	<c:if test="${fn:length(nsc数据表供货List)  > 0 }">
		<c:forEach items="${nsc数据表供货List}" var="poVal" varStatus="stuts" begin="0" end="0">
			<tr>
					<input name="nsc数据表供货List[0].id" type="hidden" value="${poVal.id}"/>
					<input name="nsc数据表供货List[0].wj" type="hidden" value="${poVal.wj}"/>
			</tr>
			<tr>
				  <td class="text-center">
						<b>泵:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].泵价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.泵价 }">
					  <label class="Validform_label" style="display: none;">泵</label>
					</td>
				  <td class="text-center">
						<b>机封:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].机封价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.机封价 }">
					  <label class="Validform_label" style="display: none;">机封</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>底座:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].底座价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.底座价 }">
					  <label class="Validform_label" style="display: none;">底座</label>
					</td>
				  <td class="text-center">
						<b>进/出口反法兰:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].反法兰价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.反法兰价 }">
					  <label class="Validform_label" style="display: none;">进/出口反法兰</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>联轴器:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].联轴器价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.联轴器价 }">
					  <label class="Validform_label" style="display: none;">联轴器</label>
					</td>
				  <td class="text-center">
						<b>电或柴:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].电或柴价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.电或柴价 }">
					  <label class="Validform_label" style="display: none;">电或柴</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>控制柜:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].控制柜价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.控制柜价 }">
					  <label class="Validform_label" style="display: none;">控制柜</label>
					</td>
				  <td class="text-center">
						<b>单价:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].单价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.单价 }">
					  <label class="Validform_label" style="display: none;">单价</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>总价:</b>
					</td>
				  <td>
					  	<input name="nsc数据表供货List[0].总价" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.总价 }">
					  <label class="Validform_label" style="display: none;">总价</label>
					</td>
				  <td class="text-center">
						<b>有无_泵价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无泵价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${poVal.有无泵价}" hasLabel="false"  title="有无_泵价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_泵价</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>有无_机封价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无机封价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${poVal.有无机封价}" hasLabel="false"  title="有无_机封价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_机封价</label>
					</td>
				  <td class="text-center">
						<b>有无_底座价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无底座价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${poVal.有无底座价}" hasLabel="false"  title="有无_底座价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_底座价</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>有无_反法兰价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无反法兰价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${poVal.有无反法兰价}" hasLabel="false"  title="有无_反法兰价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_反法兰价</label>
					</td>
				  <td class="text-center">
						<b>有无_联轴器价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无联轴器价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${poVal.有无联轴器价}" hasLabel="false"  title="有无_联轴器价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_联轴器价</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>有无_电或柴价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无电或柴价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="" defaultVal="${poVal.有无电或柴价}" hasLabel="false"  title="有无_电或柴价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_电或柴价</label>
					</td>
				  <td class="text-center">
						<b>有无_控制柜价:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].有无控制柜价" type="checkbox" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="有无" defaultVal="${poVal.有无控制柜价}" hasLabel="false"  title="有无_控制柜价"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">有无_控制柜价</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>包装方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].包装方式" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="包装方式" defaultVal="${poVal.包装方式}" hasLabel="false"  title="包装方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">包装方式</label>
					</td>
				  <td class="text-center">
						<b>运输方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].运输方式" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="运输方式" defaultVal="${poVal.运输方式}" hasLabel="false"  title="运输方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">运输方式</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>油漆颜色:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表供货List[0].油漆颜色" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="油漆颜色" defaultVal="${poVal.油漆颜色}" hasLabel="false"  title="油漆颜色"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">油漆颜色</label>
					</td>
				  <td class="text-center">
						<b>其他附件和配件:</b>
					</td>
				  <td>
					       	<input name="nsc数据表供货List[0].附配件" maxlength="32" 
						  		type="text" style="width:120px;" class="form-control"   value="${poVal.附配件 }">
					  <label class="Validform_label" style="display: none;">其他附件和配件</label>
					</td>
				</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>