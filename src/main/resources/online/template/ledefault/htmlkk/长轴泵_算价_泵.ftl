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
			<div style="width:300px;float:left;">
			<p>A部分.泵头</p>
			<#list field['${sub}'].fieldNoAreaList as subTableField>
				<#if subTableField.field_name?matches("泵头材质|泵头")>
					<#if subTableField.show_type=='text'>
					<@kk.ifText subTableField sub subTableData/>
					<#else>
					<@kk.ifList subTableField sub subTableData/>
					</#if>
				</#if>
			</#list>
			</div>	
			
			<div class="col-xs-4" style="float:left;">
			<p id="加横线">长度计算</p>
			<#list field['${sub}'].fieldNoAreaList as subTableField>
				<#if subTableField.field_name?matches("滤网|喇叭口|单导叶长|级数|泵头长")>
					<div style="width:20%;float:left;">
					<p>${subTableField.content!?html}</p>
					<@kk.ifText subTableField sub subTableData/>
					</div>
				</#if>
			</#list>			
			</div>	
			
			<div class="col-xs-5" style="float:left;">
				<p id="加横线">B.部分</p>
				<#list field['${sub}'].fieldNoAreaList as subTableField>
					<#if subTableField.field_name?matches("液下深度|单管长|接管数")>
						<div style="width:17%;float:left;">
						<p>${subTableField.content!?html}</p>
						<@kk.ifText subTableField sub subTableData/>
						</div>					
					</#if>
				</#list>
				<div style="width:34%;float:left;margin:10px 5px">
				<#list field['${sub}'].fieldNoAreaList as subTableField>
					<#if subTableField.field_name?matches("扬水管材质|单管价")>
							<#if subTableField.show_type=='text'>
							<@kk.ifText subTableField sub subTableData/>
							<#else>
							<@kk.ifList subTableField sub subTableData/>
							</#if>
					</#if>		
				</#list>
				</div>
				<#list field['${sub}'].fieldNoAreaList as subTableField>
					<#if subTableField.field_name?matches("小计")>
						<div style="width:12%;float:left;">
						<p>${subTableField.content!?html}</p>
						<@kk.ifText subTableField sub subTableData/>
						</div>
					</#if>		
				</#list>
			</div>	
			
			<div class="col-xs-4" style="">				
				<div style="width:35%;float:left;"><p>C.部分</p>
					<@kk.找字段 sub "出水弯头"/><@kk.ifText kk.字段 sub subTableData/>
					<@kk.找字段 sub "出水弯头材质"/><@kk.ifList kk.字段 sub subTableData/>
				</div>				
				<div style="width:40%;float:left;"><p>D.部分</p>					
					<@kk.找字段 sub "电机支座"/><@kk.ifText kk.字段 sub subTableData/>					
					<@kk.找字段 sub "电机支座材质"/><@kk.ifList kk.字段 sub subTableData/>
				</div>				
				<div style="width:25%;float:left;"><p>E.部分</p>
					<@kk.找字段 sub "轴承"/><@kk.ifText kk.字段 sub subTableData/>
					<@kk.找字段 sub "轴承配置"/><@kk.ifList kk.字段 sub subTableData/>
				</div>
			</div>
			
			<div class="col-xs-2" style=""><p id="加横线">赛龙导轴承差价</p>				
				<div style="width:50%;float:left;">
					<@kk.找字段 sub "单赛导差价"/><p>${kk.字段.content!?html}</p><@kk.ifText kk.字段 sub subTableData/>					
				</div>				
				<div style="width:50%;float:left;">
					<@kk.找字段 sub "赛导个数"/><p>${kk.字段.content!?html}</p><@kk.ifText kk.字段 sub subTableData/>					
				</div>
			</div>
			
			<div class="col-xs-2" style=""><p id="加横线">集装机封</p>				
				<div style="width:40%;float:left;">
					<@kk.找字段 sub "轴径"/><p>${kk.字段.content!?html}</p><@kk.ifText kk.字段 sub subTableData/>					
				</div>				
				<div style="width:55%;float:left;margin:10px 5px">					
					<@kk.找字段 sub "机封"/><@kk.ifText kk.字段 sub subTableData/>
					<@kk.找字段 sub "机封配置"/><@kk.ifList kk.字段 sub subTableData/>						
				</div>
			</div>
			
			<div class="col-xs-4" style="">				
				<div style="width:25%;float:left;">
					<@kk.找字段 sub "加护管系数"/><p>${kk.字段.content!?html}</p><@kk.ifText kk.字段 sub subTableData/>					
				</div>
				<div style="width:25%;float:left;">
					<@kk.找字段 sub "合计"/><p>${kk.字段.content!?html}</p><@kk.ifText kk.字段 sub subTableData/>					
				</div>	
				<div style="width:25%;float:left;">
					<@kk.找字段 sub "价格系数"/><p>${kk.字段.content!?html}</p><@kk.ifText kk.字段 sub subTableData/>					
				</div>	
				<div style="width:25%;float:left;">
					<@kk.找字段 sub "折后价"/><p>${kk.字段.content!?html}</p><@kk.ifText kk.字段 sub subTableData/>					
				</div>
			</div>
			
			<div class="col-xs-4" style="clear:left">
			<#list field['${sub}'].fieldNoAreaList as subTableField>
					<#if subTableField.field_name?matches("出口法兰直径|出口法兰压力|法兰单价|材质系数|法兰小计")>
						<div style="width:20%;float:left;">
						<p>${subTableField.content!?html}</p>
						<#if subTableField.show_type=='text'>
							<@kk.ifText subTableField sub subTableData/>
						<#else>
							<@kk.ifList subTableField sub subTableData/>
						</#if>
						</div>					
					</#if>
			</#list>
			</div>
			<#--			
			<#list field['${sub}'].fieldNoAreaList as subTableField >
				<div class="col-xs-2" >
		          <b>${subTableField.content!?html}：</b>
     				
				<#if subTableField.show_type=='text'>
					<@kk.ifText subTableField sub subTableData/>
				<#else>
					<@kk.ifList subTableField sub subTableData/>
				</#if>
				</div>
			</#list>
			-->			
		</#if>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("#con-wrapper0 input").juzhong();$("#con-wrapper0 p").jiacuP();$("#加横线").jiahx();
	
	配置改变();	
	var arr=$.找对象(['泵头','滤网','喇叭口','单导叶长','泵头长','单管长','接管数','单管价','小计','出水弯头','电机支座','轴承','单赛导差价'
	               ,'轴径','机封','合计','法兰单价'],'${sub}'+'[0]');
	$.zhidu(arr);
	var arr=$.找对象(['折后价','法兰小计'],'${sub}'+'[0]');
	$.变绿(arr);
});

function 找对象_长轴泵(){
	var ziduanMC=new Array();
		<#list field['${sub}'].fieldNoAreaList as subTableField >
			ziduanMC.push('${subTableField.field_name}');					
		</#list>	
	var 对象=$.找对象(ziduanMC,'${sub}'+'[0]');
	return 对象;
}
var jisu,L1,L2,L3,接管数,泵头长,单管长,小计,泵头,出水弯头,电机支座,轴承,机封,单赛导差价,赛导个数,合计,折后价,长轴泵data;

function 查询长轴泵(){
	var 清空对象=$.找对象(['泵头','单管长','接管数','单管价','出水弯头','电机支座','轴承','机封','单赛导差价','赛导个数','轴径','合计'],'${sub}'+'[0]');
	$.each(清空对象, function(){this.val("");});
	var re=/([^\(X]+)\(?([^\)X]+)?\)?X?(\w+)?/;
	var reJG=re.exec($("#bxh").val());
	if (reJG!=null){var bxhDJ=reJG[1];	
					jisu=reJG[3];
					jisu==undefined?jisu=1:{};
					对象_长轴泵['级数'].val(jisu);
					};	
	$.ajax({  
        type : "post",  
        url : "选型报价.do?查询长轴泵",  
        data : {动作:"查价格",bxh:$("#bxh").val(),},  
        async : false,  
        success : function(data){  
        	长轴泵data = $.parseJSON(data);
        	长轴泵data!=null?填长轴泵价格():{};        	
        }  
	});
	对象_长轴泵['滤网'].val("");对象_长轴泵['喇叭口'].val("");对象_长轴泵['单导叶长'].val("");对象_长轴泵['泵头长'].val("");
	$.ajax({  
	       type : "post",  
	       url : "选型报价.do?查询长轴泵",  
	       data : {动作:"查结构",bxh:bxhDJ,},  
	       async : false,  
	       success : function(data){  
		        data = $.parseJSON(data);
		        if (data!=null){
			        L1=data['L1'];L2=data['L2'];L3=data['L3'];
			        对象_长轴泵['滤网'].val(L1);对象_长轴泵['喇叭口'].val(L2);对象_长轴泵['单导叶长'].val(L3);
			        长轴泵计算();
				};			               
	       }
	}); 
	
}
function 填长轴泵价格(){
    泵头=长轴泵data[对象_长轴泵['泵头材质'].val()];单管价=长轴泵data[对象_长轴泵['扬水管材质'].val()];出水弯头=长轴泵data[对象_长轴泵['出水弯头材质'].val()];
    电机支座=长轴泵data[对象_长轴泵['电机支座材质'].val()];轴承=长轴泵data[对象_长轴泵['轴承配置'].val()];机封=长轴泵data[对象_长轴泵['机封配置'].val()];
    机封==null?机封=0:{};电机支座==null?电机支座=0:{};轴承==null?轴承=0:{};
    
    对象_长轴泵['泵头'].val(泵头);对象_长轴泵['单管价'].val(单管价);对象_长轴泵['出水弯头'].val(出水弯头);对象_长轴泵['电机支座'].val(电机支座);
    对象_长轴泵['轴承'].val(轴承);对象_长轴泵['机封'].val(机封);
    
    单管长=长轴泵data['单管长'];单赛导差价=长轴泵data['单赛导差价'];赛导个数=长轴泵data['赛导个数'];轴径=长轴泵data['轴径'];
    赛导个数==null?赛导个数=0:{};
    对象_长轴泵['单管长'].val(单管长);对象_长轴泵['单赛导差价'].val(单赛导差价);对象_长轴泵['赛导个数'].val(赛导个数);对象_长轴泵['轴径'].val(轴径);
    长轴泵计算();
}
function 长轴泵计算(){
	jisu=对象_长轴泵['级数'].val();
	泵头长=L1+L2+L3*jisu;
    对象_长轴泵['泵头长'].val(泵头长);
    接管数=(对象_长轴泵['液下深度'].val()-泵头长)/单管长;
	对象_长轴泵['接管数'].val(接管数.toFixed(1));
	小计=接管数*单管价;
	对象_长轴泵['小计'].val(小计.toFixed());
	
	赛导个数=对象_长轴泵['赛导个数'].val();
	合计=(泵头+小计+出水弯头+电机支座+轴承+单赛导差价*赛导个数+机封)*对象_长轴泵['加护管系数'].val();
	对象_长轴泵['合计'].val(合计.toFixed());
	折后价=合计*对象_长轴泵['价格系数'].val();对象_长轴泵['折后价'].val(折后价.toFixed());
}

function 长轴泵法兰() {
	var arr1 = [对象_长轴泵['出口法兰直径'],对象_长轴泵['法兰单价'],对象_长轴泵['法兰小计'],];
	$.each(arr1, function(){this.val("");});
	var re=/\d+/,reJG,直径,法兰小计;
	reJG=re.exec($("#bxh").val());	
	reJG==null?直径=null:直径=reJG[0];
	对象_长轴泵['出口法兰直径'].val(直径);
	查询长轴泵法兰();
}
function 查询长轴泵法兰() {
	var 直径=对象_长轴泵['出口法兰直径'].val();
	$.ajax({  
        type : "post",  
         url : "选型报价.do?cxFL",  
         data : {动作:"查价格",zj:直径,yl:对象_长轴泵['出口法兰压力'].val()},  
         async : false,  
         success : function(data){  
	           data = $.parseJSON(data); 
	           if (data!=null){
	        	   对象_长轴泵['法兰单价'].val(data['价格']); 
		           法兰小计=data['价格']*对象_长轴泵['材质系数'].val();
		           对象_长轴泵['法兰小计'].val(法兰小计); 
				};
         }  
    }); 	
}
function 配置改变(){
	var arr=$.找对象(['泵头材质','扬水管材质','出水弯头材质','电机支座材质','轴承配置','机封配置'],'${sub}'+'[0]');
	$.each(arr, function(){
		this.change(function(){填长轴泵价格();
		});
	});
	var arr=$.找对象(['级数','赛导个数','液下深度','加护管系数','价格系数'],'${sub}'+'[0]');
	$.each(arr, function(){
		this.change(function(){长轴泵计算();
		});
	});
	var arr=$.找对象(['出口法兰直径','材质系数','出口法兰压力'],'${sub}'+'[0]');
	$.each(arr, function(){
		this.change(function(){查询长轴泵法兰();
		});
	});

}
</script>

















