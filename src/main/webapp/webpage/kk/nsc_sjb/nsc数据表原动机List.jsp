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
<table id="nsc数据表原动机_table" class="table table-bordered table-hover" style="margin-bottom: 0;">
		
	<tbody id="add_nsc数据表原动机_table" >	
	<c:if test="${fn:length(nsc数据表原动机List)  <= 0 }">
			<tr>
					<input name="nsc数据表原动机List[0].id" type="hidden"  value="${poVal.id}"/>
					<input name="nsc数据表原动机List[0].wj" type="hidden"  value="${poVal.wj}"/>
			</tr>
				<tr>
				    <td class="text-center">
						<b>原动机厂家:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].原动机厂家" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">原动机厂家</label>
					</td>
				    <td class="text-center">
						<b>原动机型号:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].原动机型号" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">原动机型号</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>电压或油箱:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].电压或油箱" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">电压或油箱</label>
					</td>
				    <td class="text-center">
						<b>配套功率(kw):</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].配套功率" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">配套功率(kw)</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>转速(r/min)     :</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].原动机转速" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">转速(r/min)     </label>
					</td>
				    <td class="text-center">
						<b>IP或材质:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].ip或材质" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">IP或材质</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>启动或冷却方式:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].启动或冷却方式" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">启动或冷却方式</label>
					</td>
				    <td class="text-center">
						<b>接线盒进线方式/个数:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].接线盒" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">接线盒进线方式/个数</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>最高工作温度(℃):</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].最高工作温度" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">最高工作温度(℃)</label>
					</td>
				    <td class="text-center">
						<b>其它条件(特殊要求):</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].其它条件" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">其它条件(特殊要求)</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>极数:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表原动机List[0].电机极数" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="djjs" defaultVal="${nsc数据表原动机Page.电机极数}" hasLabel="false"  title="极数"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">极数</label>
					</td>
				</tr>
	</c:if>
	<c:if test="${fn:length(nsc数据表原动机List)  > 0 }">
		<c:forEach items="${nsc数据表原动机List}" var="poVal" varStatus="stuts" begin="0" end="0">
			<tr>
					<input name="nsc数据表原动机List[0].id" type="hidden" value="${poVal.id}"/>
					<input name="nsc数据表原动机List[0].wj" type="hidden" value="${poVal.wj}"/>
			</tr>
			<tr>
				  <td class="text-center">
						<b>原动机厂家:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].原动机厂家" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.原动机厂家 }">
					  <label class="Validform_label" style="display: none;">原动机厂家</label>
					</td>
				  <td class="text-center">
						<b>原动机型号:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].原动机型号" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.原动机型号 }">
					  <label class="Validform_label" style="display: none;">原动机型号</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>电压或油箱:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].电压或油箱" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.电压或油箱 }">
					  <label class="Validform_label" style="display: none;">电压或油箱</label>
					</td>
				  <td class="text-center">
						<b>配套功率(kw):</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].配套功率" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.配套功率 }">
					  <label class="Validform_label" style="display: none;">配套功率(kw)</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>转速(r/min)     :</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].原动机转速" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.原动机转速 }">
					  <label class="Validform_label" style="display: none;">转速(r/min)     </label>
					</td>
				  <td class="text-center">
						<b>IP或材质:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].ip或材质" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.ip或材质 }">
					  <label class="Validform_label" style="display: none;">IP或材质</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>启动或冷却方式:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].启动或冷却方式" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.启动或冷却方式 }">
					  <label class="Validform_label" style="display: none;">启动或冷却方式</label>
					</td>
				  <td class="text-center">
						<b>接线盒进线方式/个数:</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].接线盒" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.接线盒 }">
					  <label class="Validform_label" style="display: none;">接线盒进线方式/个数</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>最高工作温度(℃):</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].最高工作温度" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.最高工作温度 }">
					  <label class="Validform_label" style="display: none;">最高工作温度(℃)</label>
					</td>
				  <td class="text-center">
						<b>其它条件(特殊要求):</b>
					</td>
				  <td>
					  	<input name="nsc数据表原动机List[0].其它条件" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.其它条件 }">
					  <label class="Validform_label" style="display: none;">其它条件(特殊要求)</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>极数:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表原动机List[0].电机极数" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="djjs" defaultVal="${poVal.电机极数}" hasLabel="false"  title="极数"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">极数</label>
					</td>
				</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>