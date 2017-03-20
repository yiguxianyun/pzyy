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
<table id="nsc数据表结构参数_table" class="table table-bordered table-hover" style="margin-bottom: 0;">
		
	<tbody id="add_nsc数据表结构参数_table" >	
	<c:if test="${fn:length(nsc数据表结构参数List)  <= 0 }">
			<tr>
					<input name="nsc数据表结构参数List[0].id" type="hidden"  value="${poVal.id}"/>
					<input name="nsc数据表结构参数List[0].wj" type="hidden"  value="${poVal.wj}"/>
			</tr>
				<tr>
				    <td class="text-center">
						<b>安装方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].安装方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="卧立式" defaultVal="${nsc数据表结构参数Page.安装方式}" hasLabel="false"  title="安装方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">安装方式</label>
					</td>
				    <td class="text-center">
						<b>旋转方向（从驱动端看）:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].旋转方向" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="顺逆" defaultVal="${nsc数据表结构参数Page.旋转方向}" hasLabel="false"  title="旋转方向（从驱动端看）"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">旋转方向（从驱动端看）</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>支撑方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].支撑方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="支撑方式" defaultVal="${nsc数据表结构参数Page.支撑方式}" hasLabel="false"  title="支撑方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">支撑方式</label>
					</td>
				    <td class="text-center">
						<b>联轴器:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].联轴器形式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="联轴器形式" defaultVal="${nsc数据表结构参数Page.联轴器形式}" hasLabel="false"  title="联轴器"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">联轴器</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>底座:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].底座形式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="底座形式" defaultVal="${nsc数据表结构参数Page.底座形式}" hasLabel="false"  title="底座"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">底座</label>
					</td>
				    <td class="text-center">
						<b>轴承及润滑方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].轴承及润滑方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="轴承及润滑方式" defaultVal="${nsc数据表结构参数Page.轴承及润滑方式}" hasLabel="false"  title="轴承及润滑方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">轴承及润滑方式</label>
					</td>
				</tr>
				<tr>
				    <td class="text-center">
						<b>轴封方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].轴封方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="轴封方式" defaultVal="${nsc数据表结构参数Page.轴封方式}" hasLabel="false"  title="轴封方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">轴封方式</label>
					</td>
				</tr>
	</c:if>
	<c:if test="${fn:length(nsc数据表结构参数List)  > 0 }">
		<c:forEach items="${nsc数据表结构参数List}" var="poVal" varStatus="stuts" begin="0" end="0">
			<tr>
					<input name="nsc数据表结构参数List[0].id" type="hidden" value="${poVal.id}"/>
					<input name="nsc数据表结构参数List[0].wj" type="hidden" value="${poVal.wj}"/>
			</tr>
			<tr>
				  <td class="text-center">
						<b>安装方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].安装方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="卧立式" defaultVal="${poVal.安装方式}" hasLabel="false"  title="安装方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">安装方式</label>
					</td>
				  <td class="text-center">
						<b>旋转方向（从驱动端看）:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].旋转方向" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="顺逆" defaultVal="${poVal.旋转方向}" hasLabel="false"  title="旋转方向（从驱动端看）"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">旋转方向（从驱动端看）</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>支撑方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].支撑方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="支撑方式" defaultVal="${poVal.支撑方式}" hasLabel="false"  title="支撑方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">支撑方式</label>
					</td>
				  <td class="text-center">
						<b>联轴器:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].联轴器形式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="联轴器形式" defaultVal="${poVal.联轴器形式}" hasLabel="false"  title="联轴器"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">联轴器</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>底座:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].底座形式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="底座形式" defaultVal="${poVal.底座形式}" hasLabel="false"  title="底座"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">底座</label>
					</td>
				  <td class="text-center">
						<b>轴承及润滑方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].轴承及润滑方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="轴承及润滑方式" defaultVal="${poVal.轴承及润滑方式}" hasLabel="false"  title="轴承及润滑方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">轴承及润滑方式</label>
					</td>
				</tr>
			<tr>
				  <td class="text-center">
						<b>轴封方式:</b>
					</td>
				  <td>
							<t:dictSelect field="nsc数据表结构参数List[0].轴封方式" type="list" extendJson="{class:'form-control',style:'width:150px'}"
										typeGroupCode="轴封方式" defaultVal="${poVal.轴封方式}" hasLabel="false"  title="轴封方式"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">轴封方式</label>
					</td>
				</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>