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
<table id="nsc数据表性能_table" class="table table-bordered table-hover" style="margin-bottom: 0;">
		
	<tbody id="add_nsc数据表性能_table" >	
	<c:if test="${fn:length(nsc数据表性能List)  <= 0 }">
			<tr>
					<input name="nsc数据表性能List[0].id" type="hidden"  value="${poVal.id}"/>
					<input name="nsc数据表性能List[0].wj" type="hidden"  value="${poVal.wj}"/>
			</tr>
				<tr>
				    <td class="text-center">
						<b>额定点流量m3/h:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点流量" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">额定点流量m3/h</label>
					</td>
				    <td class="text-center">
						<b>额定点扬程m:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点扬程" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">额定点扬程m</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>额定点效率%:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点效率" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">额定点效率%</label>
					</td>
				    <td class="text-center">
						<b>额定点轴功率kW:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点轴功率" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">额定点轴功率kW</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>额定点必需汽蚀余量m:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点必需汽蚀余量" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">额定点必需汽蚀余量m</label>
					</td>
				    <td class="text-center">
						<b>转速r/min:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].转速" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">转速r/min</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>最小连续流量m3/h:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].最小连续流量" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">最小连续流量m3/h</label>
					</td>
				    <td class="text-center">
						<b>最大流量m3/h:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].最大流量" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">最大流量m3/h</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>关闭点扬程m:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].关闭点扬程" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control" >
					  <label class="Validform_label" style="display: none;">关闭点扬程m</label>
					</td>
				</tr>
	</c:if>
	<c:if test="${fn:length(nsc数据表性能List)  > 0 }">
		<c:forEach items="${nsc数据表性能List}" var="poVal" varStatus="stuts" begin="0" end="0">
			<tr>
					<input name="nsc数据表性能List[0].id" type="hidden" value="${poVal.id}"/>
					<input name="nsc数据表性能List[0].wj" type="hidden" value="${poVal.wj}"/>
			</tr>
			<tr>
				  <td class="text-center">
						<b>额定点流量m3/h:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点流量" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.额定点流量 }">
					  <label class="Validform_label" style="display: none;">额定点流量m3/h</label>
					</td>
				  <td class="text-center">
						<b>额定点扬程m:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点扬程" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.额定点扬程 }">
					  <label class="Validform_label" style="display: none;">额定点扬程m</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>额定点效率%:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点效率" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.额定点效率 }">
					  <label class="Validform_label" style="display: none;">额定点效率%</label>
					</td>
				  <td class="text-center">
						<b>额定点轴功率kW:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点轴功率" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.额定点轴功率 }">
					  <label class="Validform_label" style="display: none;">额定点轴功率kW</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>额定点必需汽蚀余量m:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].额定点必需汽蚀余量" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.额定点必需汽蚀余量 }">
					  <label class="Validform_label" style="display: none;">额定点必需汽蚀余量m</label>
					</td>
				  <td class="text-center">
						<b>转速r/min:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].转速" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.转速 }">
					  <label class="Validform_label" style="display: none;">转速r/min</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>最小连续流量m3/h:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].最小连续流量" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.最小连续流量 }">
					  <label class="Validform_label" style="display: none;">最小连续流量m3/h</label>
					</td>
				  <td class="text-center">
						<b>最大流量m3/h:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].最大流量" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.最大流量 }">
					  <label class="Validform_label" style="display: none;">最大流量m3/h</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>关闭点扬程m:</b>
					</td>
				  <td>
					  	<input name="nsc数据表性能List[0].关闭点扬程" maxlength="32" 
					  		type="text" style="width:120px;" class="form-control"  value="${poVal.关闭点扬程 }">
					  <label class="Validform_label" style="display: none;">关闭点扬程m</label>
					</td>
				</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>