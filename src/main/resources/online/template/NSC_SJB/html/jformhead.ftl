	<input type="hidden" name="tableName" value="${tableName?if_exists?html}" >
	<input type="hidden" name="id" value="${id?if_exists?html}" >
	<#list columnhidden as po>
	  <input type="hidden" id="${po.field_name}" name="${po.field_name}" value="${data['${tableName}']['${po.field_name}']?if_exists?html}" >
	</#list>
<div id="A4表头" class="A4表头">
	<div class="Noprn 白背景">
	<#include "/online/template/00表单公用/工作流.ftl">
	<div style="clear:both;"></div>
	<div style="clear:both;" id="工具栏">
		<button type="button" id="btn_sub"  class="btn btn-primary 隔开">保存</button>
		<button type="button" id="选型"  class="btn btn-primary 隔开">选型</button>
		<button type="button" id="算价"  class="btn btn-primary 隔开 次要按钮">算价(省略选型)</button>
		<button type="button" id="性能图"  class="btn btn-primary 隔开">性能图</button>
		<button type="button" id=""  class="btn btn-primary 靠右 次要按钮" onclick=$.打印()>打印</button>
		<button type="button" id="改只读"  class="btn btn-primary 靠右">改只读(可随意修改)</button>
	</div>
	</div>
	<div class="row form-wrapper">
		<div class="col-xs-3" >
		<img src="userfiles/images/logo.jpg" class="img-responsive" alt="Cinque Terre" 	>
		</div>
		<div class="col-xs-4 text-center" >
			<h2 style="letter-spacing:3px;">NSC泵组数据表</h2>
			<h4>湖南南方长河泵业有限公司</h4>
		</div>
		<div class="col-xs-5" >
			<@字段库.找主表字段 "数据表编号"/>
			<div class="input-group">
            <p class="input-group-addon">${字段库.字段.content}：
             	<a href="javascript:提取NSC价格()"><span class="glyphicon glyphicon-repeat"></span></a>
            </p> <@字段库.ifTextZhuBiao 字段库.字段 />
       		</div>

       		<@字段库.找主表字段 "项目名称"/>
       		<div class="input-group" style="">
            <p class="input-group-addon">${字段库.字段.content}：	             	
            </p> <@字段库.ifTextZhuBiao 字段库.字段 />
       		</div>
       		<@字段库.找主表字段 "客户单位"/>
       		<div class="input-group" style="">
            <p class="input-group-addon">${字段库.字段.content}：	             	
            </p> <@字段库.ifTextZhuBiao 字段库.字段 />
       		</div>       		
		</div>
	</div>
	
	<div class="row form-wrapper">
	<#list columns as po>
		<#if (po_index>=5)&&(po_index<=10) >
			<div class="col-xs-3 input-group" style="float:left">
            <p class="input-group-addon">${po.content}：</p>            
            <#if po.show_type=='text'>
				<@字段库.ifTextZhuBiao po/>
			<#else>
				<@字段库.ifListZhuBiao po/>
			</#if>
       		</div>			
		</#if>	
	</#list>	
	</div>
</div> 

<div id="A4正文" class="" style="">
<#-- 没什么--	
   <div class="row form-wrapper" >
       <#list columns as po>
         <div class="col-xs-3 text-center form-wrapper">
         	<b>${po_index}：${po.content}：${po.field_name}</b>
         </div>
       </#list>
  </div>
#-- 没什么-->	
	<div class="row form-wrapper" style=";">
		<p class="标题">现场工况</p>	
		<#list columns as po>
			<#if (po_index>=11)&&(po_index<=21) >
				<div class="input-group" style="float:left;width:25%">
	            <p class="input-group-addon">${po.content}：</p>            
	            <#if po.show_type=='text'>
					<@字段库.ifTextZhuBiao po/>
				<#else>
					<@字段库.ifListZhuBiao po/>
				</#if>
	       		</div>			
			</#if>	
		</#list>	
	</div>
<#-- 没什么-->	
	<div class="row form-wrapper" style=";">
		<p class="标题">结构参数</p>	
		<#assign sub="NSC数据表_结构参数">
		<#if data['${sub}']??> <#assign subTableData=data['${sub}'][0]> 
			 <#else> <#assign subTableData={}> 
		 </#if>		 
		 <input type="hidden" name="${sub}[0].id" id="${sub}[0].id" value="${subTableData['id']!?html}"/>
		<#list field['${sub}'].hiddenFieldList as subTableField >
			<input type="hidden" name="${sub}[0].${subTableField.field_name}" id="${sub}[0].${subTableField.field_name}" 
			value="${subTableData['${subTableField.field_name}']!?html}"/>
		</#list>		
		<#list field['${sub}'].fieldNoAreaList as subTableField >
			<div class="input-group" style="float:left;width:25%">
	            <p class="input-group-addon">${subTableField.content!?html}：</p>            
	            <#if subTableField.show_type=='text'>
					<@字段库.ifText subTableField sub subTableData/>
				<#else>
					<@字段库.ifList subTableField sub subTableData/>
				</#if>
	   		</div>		
		</#list>	
	</div>
<#-- 没什么-->	
	<div class="row form-wrapper" style=";">
		<p class="标题">原动机参数</p>	
		<#assign sub="NSC数据表_原动机">
		<#if data['${sub}']??> <#assign subTableData=data['${sub}'][0]> 
			 <#else> <#assign subTableData={}> 
		 </#if>		 
		 <input type="hidden" name="${sub}[0].id" id="${sub}[0].id" value="${subTableData['id']!?html}"/>
		<#list field['${sub}'].hiddenFieldList as subTableField >
			<input type="hidden" name="${sub}[0].${subTableField.field_name}" id="${sub}[0].${subTableField.field_name}" 
			value="${subTableData['${subTableField.field_name}']!?html}"/>
		</#list>		
		<#list field['${sub}'].fieldNoAreaList as subTableField >
			<div class="input-group" style="float:left;width:25%">
	            <p class="input-group-addon">${subTableField.content!?html}：</p>            
	            <#if subTableField.show_type=='text'>
					<@字段库.ifText subTableField sub subTableData/>
				<#else>
					<@字段库.ifList subTableField sub subTableData/>
				</#if>
	   		</div>		
		</#list>	
	</div>

	<div class="row form-wrapper" style=";">
		<p class="标题">泵性能</p>	
		<#assign sub="NSC数据表_性能">
		<#if data['${sub}']??> <#assign subTableData=data['${sub}'][0]> 
			 <#else> <#assign subTableData={}> 
		 </#if>		 
		 <input type="hidden" name="${sub}[0].id" id="${sub}[0].id" value="${subTableData['id']!?html}"/>
		<#list field['${sub}'].hiddenFieldList as subTableField >
			<input type="hidden" name="${sub}[0].${subTableField.field_name}" id="${sub}[0].${subTableField.field_name}" 
			value="${subTableData['${subTableField.field_name}']!?html}"/>
		</#list>		
		<#list field['${sub}'].fieldNoAreaList as subTableField >
			<div class="input-group" style="float:left;width:25%">
	            <p class="input-group-addon">${subTableField.content!?html}：</p>            
	            <#if subTableField.show_type=='text'>
					<@字段库.ifText subTableField sub subTableData/>
				<#else>
					<@字段库.ifList subTableField sub subTableData/>
				</#if>
	   		</div>		
		</#list>	
	</div>

	<div class="row form-wrapper" style=";">
		<div style="text-align:center;"><p class="标题" style="display:inline;">材质要求</p></div>	
		<#assign sub="NSC数据表_材质">
		<#if data['${sub}']??> <#assign subTableData=data['${sub}'][0]> 
			 <#else> <#assign subTableData={}> 
		 </#if>		 
		 <input type="hidden" name="${sub}[0].id" id="${sub}[0].id" value="${subTableData['id']!?html}"/>
		<#list field['${sub}'].hiddenFieldList as subTableField >
			<input type="hidden" name="${sub}[0].${subTableField.field_name}" id="${sub}[0].${subTableField.field_name}" 
			value="${subTableData['${subTableField.field_name}']!?html}"/>
		</#list>		
		<#list field['${sub}'].fieldNoAreaList as subTableField >
			<div class="input-group" style="float:left;width:25%">
	            <p class="input-group-addon">${subTableField.content!?html}：</p>            
	            <#if subTableField.show_type=='text'>
					<@字段库.ifText subTableField sub subTableData/>
				<#elseif subTableField.show_type=='list'>
					<@字段库.ifList subTableField sub subTableData/>
				<#else>
					——————其他字段——————
				</#if>
	   		</div>		
		</#list>
		<#list field['${sub}'].fieldAreaList as subTableField>
			<div class="input-group" style="float:left;width:100%;overflow:visible">
	            <p class="input-group-addon">${subTableField.content!?html}：</p>            
	            <@字段库.textarea subTableField sub subTableData/>
	   		</div>	
	  	</#list>	
	</div>

	<div id="A4分页" class="row form-wrapper" style=";">
		<p class="标题1">供货范围及报价（单位：人民币元）</p>	
		<#assign sub="NSC数据表_供货">
		<#if data['${sub}']??> <#assign subTableData=data['${sub}'][0]> 
			 <#else> <#assign subTableData={}> 
		 </#if>		 
		 <input type="hidden" name="${sub}[0].id" id="${sub}[0].id" value="${subTableData['id']!?html}"/>
		<#list field['${sub}'].hiddenFieldList as subTableField >
			<input type="hidden" name="${sub}[0].${subTableField.field_name}" id="${sub}[0].${subTableField.field_name}" 
			value="${subTableData['${subTableField.field_name}']!?html}"/>
		</#list>		
		<#list field['${sub}'].fieldNoAreaList as subTableField >		
			<#if (subTableField_index>=0)&&(subTableField_index<=6) >		
				<div class="input-group" style="float:left;width:20%">
		            <p class="input-group-addon">${subTableField.content!?html}：</p>
		            <#assign 有无字段名称="有无_"+subTableField.field_name><@字段库.找字段 sub 有无字段名称/>
		            <span class="input-group-addon">
		            <@字段库.ifcheckbox 字段库.字段 sub subTableData "有"/> 
		            </span>	            		            
		            <@字段库.ifText subTableField sub subTableData/>					
		   		</div>
	   		<#elseif subTableField.field_name?matches("单价|总价")>
	   			<div class="input-group" style="float:left;width:20%">
	            <p class="input-group-addon">${subTableField.content!?html}：</p>            
					<@字段库.ifText subTableField sub subTableData/>
	   			</div>			   			
	   		<#elseif subTableField.show_type=='radio'>
	   			<div class="input-group" style="float:left;width:50%">
	            <p class="input-group-addon">${subTableField.content!?html}：</p>            
					<div type="text" class="form-control" >
					<@字段库.ifradio subTableField sub subTableData/>
					</div>
	   			</div>
	   		</#if>		
		</#list>			
		<#list field['${sub}'].fieldAreaList as subTableField>
			<div class="input-group" style="float:left;width:100%;overflow:visible">
	            <p class="input-group-addon">${subTableField.content!?html}：</p>            
	            <@字段库.textarea subTableField sub subTableData/>
	   		</div>	
	  	</#list>	
	</div>
	
	<div class="row form-wrapper" style="margin-top:10px;">		
		<#list columns as po>	   		
			<#if po.field_name?matches("销售人员|技术支持")>		
				<div class="input-group" style="float:left;width:35%">
		            <p class="input-group-addon">${po.content!?html}：</p>
		            <@字段库.ifTextZhuBiao po/> 
		            <#assign 字段名称=po.field_name+"日期"><@字段库.找主表字段 字段名称/>		                        		            
		            <@字段库.ifdateZhuBiao 字段库.字段/>					
		   		</div>
	   		</#if>		
		</#list>	
	</div>
<h4 style="margin-bottom:0px;">说明：</h4>
<ol class="ul_one">
	<li style=";">报价含税、含运费</li>
	<li style=";">付款方式3:3:3:1  预付30%发货前付30%现场安装调试合格付30%质保10%</li>
	<li>油漆:RAL5015。如有特殊要求，请注明</li>
	<li>转向、法兰:依公司标准配置，如有特殊要求请注明</li>
	<li>安装、调试、试验、商检、服务、特殊检测等所需费用并未包含于此报价中，部装发货之产品，如需指导安装，需支付额外费用</li>
	<li>泵头报价含地脚螺栓</li>
	<li>供货范围：见以上报价供货范围，如需专用工具、配件等需单独说明</li>
	<li>报价有效期：30天</li>
</ol>
			   
</div>







