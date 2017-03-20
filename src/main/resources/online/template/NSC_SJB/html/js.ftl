<script type="text/javascript">
$(function(){
	对象=找对象();
	查角色();
	NSC价格={};
	$.页面居中();
	$("#A4表头").A4表头();

	$("#固体颗粒").parent().attr({"style":"float:left;width:30%"});
	$("#出口压力").parent().attr({"style":"float:left;width:20%"});
	
	对象['安装方式'].parent().attr({"style":"float:left;width:17%"});
	对象['旋转方向'].parent().attr({"style":"float:left;width:33%"});
	对象['轴承及润滑方式'].parent().attr({"style":"float:left;width:30%"});	
	对象['其它条件'].parent().attr({"style":"float:left;width:75%"});
	对象['反法兰价'].parent().css({"width":"23%",});对象['联轴器价'].parent().css({"width":"17%",});
// 	对象['总价'].parent().css({"float":"right",});
	对象['单价'].parent().css({"margin-left":"20%",});
	$("#销售人员,#销售人员日期,#技术支持,#技术支持日期").css({"width":"50%",});	
	只读();
	
	对象['原动机型号'].parent().hide();
	对象['原动机型号'].insertAfter(对象['原动机厂家']);	
	对象['电机极数'].parent().insertBefore(对象['电压或油箱'].parent());
	
	$("p:contains('材质要求')").after('<button type="button" class="btn btn-primary" onclick="常用材质()">常用材质</button>');
	
	$("#泵组类型").change(function(){
		电或柴();
	});
	$("#流量,#扬程,#密度").change(function(){
		轴功率();
	});
	对象['额定点效率'].change(function(){
		轴功率();
	});
	$("#需要台数").change(function(){
		算价格();
	});
	价格change();
	
	<#if id?if_exists?html == ''>
	数据表编号();
	转速计算(对象['电机极数'],对象['原动机转速']);
	轴功率();
	<#include "/online/template/00表单公用/填写销售和技术支持js.ftl">
	</#if>
	电或柴();

	document.getElementById("NSC数据表_材质[0].材质特殊要求").oninput=function(){$.增高(event);};
	材质列表();
	
	供货范围();
	document.getElementById("NSC数据表_供货[0].附配件").oninput=function(){$.增高(event);};
	$("#选型").click(function(){
		var url='cgFormBuildController.do?goAddFtlForm&tableName=nsc_xx&数据表编号='+$('#数据表编号').val();
		window.open(url,'_blank');
		});
	
	$("#算价").click(function(){
		var url1,url;
		$.ajax({  
	        type : "post",  
	        url : "选型报价.do?查nsc_sjID",  
	        data : {编号:$("#数据表编号").val()},  
	        async : false,  
	        success : function(data){ 
	        	data = $.parseJSON(data);
	        	if (data['id']==null){
	        		url1='cgFormBuildController.do?goAddFtlForm&tableName=nsc_sj';
	        	}else{
	        		url1='cgFormBuildController.do?goUpdateFtlForm&tableName=nsc_sj&id='+data['id'];
	        	}
	        }  
		});
		url=url1+'&数据表编号='+$('#数据表编号').val();
		window.open(url,'_blank');
	});
	$("#改只读").click(function(){
		$("#btn_sub").css("visibility","hidden");
		$(":input").each(function(){
	        $(this).attr("readonly")=="readonly"?
        		$(this).removeAttr("readonly").css({"background-color":"#eee"}):{};
	    });
	});

	
});
function 找对象(){
	var kk=new Array(),对象={};
	<#assign subTableStr>${head.subTableStr?if_exists?html}</#assign>
	<#assign subtablelist=subTableStr?split(",")>
	  <#list subtablelist as sub >
		var zd${sub}=new Array();
		<#list field['${sub}'].fieldNoAreaList as subTableField >
			zd${sub}.push('${subTableField.field_name}');					
		</#list>
		kk.push($.找对象(zd${sub},'${sub}'+'[0]'));
	  </#list>
		$.each(kk, function(k,o){
				$.each(o, function(k1,o1){
					对象[k1]=o1;
				});
			});		
	return 对象;
}
function 查角色(){
	$.ajax({  
        type : "post",  
        url : "选型报价.do?查角色",  
        data : {},  
        async : false,  
        success : function(data){  
        	data = $.parseJSON(data);
//         	$("#数据表编号").val(data);
			var arr=["管理员", "技术支持"];
        	$.inArray(data,arr)==-1?隐藏按钮():{};
        }  
	});
}
function 隐藏按钮(){
	$("#选型,#算价").hide();
}
function 电或柴(){
	var dian=对象['电压或油箱'].prev(),ip=对象['ip或材质'].prev(),qi=对象['启动或冷却方式'].prev(),jie=对象['接线盒'].prev()
		,dhc=对象['电或柴价'].siblings("p");
	对象['原动机厂家'].prev().text('原动机厂家/型号：');
	对象['原动机厂家'].parent().css({"width":"45%"});对象['原动机厂家'].css({"width":"50%"});对象['原动机型号'].css({"width":"50%"});	
	if ($("#泵组类型").val().indexOf("柴")<0) {
		对象['电压或油箱'].parent().css({"width":"12%"});对象['电机极数'].parent().css({"width":"15%"});对象['电机极数'].parent().show();		
		
		dian.text('电压：');ip.text('防爆等级/防护等级：');qi.text('启动方式：');jie.text('接线盒进线方式/个数：');
		jie.parent().show();
// 		k=dhc.prop('tagName');
// 		alert(k);
		对象['电机极数'].change(function(){
			转速计算(对象['电机极数'],对象['原动机转速']);
		});
		dhc.text('电机：');
		电机列表();
		对象['原动机转速'].zhidu();
	}else{
		电机列表清除();
		对象['电机极数'].parent().hide();
		对象['电压或油箱'].parent().css({"width":"25%"});
		对象['原动机转速'].removeAttr("readonly").css({"background-color":"#eee"});
		dian.text('油箱容量（L）：');ip.text('材质：');qi.text('冷却方式：');jie.parent().hide();dhc.text('柴油机：');
	}
}
function 转速计算(极数,转速){
	$.转速计算(对象['电机极数'],对象['原动机转速']);
	对象['转速'].val(对象['原动机转速'].val());
}
function 轴功率(){
	对象['额定点流量'].val($("#流量").val());
	对象['额定点扬程'].val($("#扬程").val());
	var q=对象['额定点流量'].val(),	h=对象['额定点扬程'].val(),	xl=对象['额定点效率'].val(),md=$("#密度").val();
	对象['额定点轴功率'].val($.轴功率(q,h,xl,md));
}
function 电机列表(){
	var dict={厂家:对象['原动机厂家'],电压:对象['电压或油箱'],ip:对象['ip或材质']};
	$.each(dict, function(k,o){
		  var id=k;
		  o.autocomplete({
		      source: function( request, response ) {
				  var 厂家=对象['原动机厂家'].val(),功率=对象['配套功率'].val(),ip=对象['ip或材质'].val(),电压=对象['电压或油箱'].val() 
						,频率='',型号=对象['原动机型号'].val(),系列='';
		    	  $.post("选型报价.do?chaxunDJ",
		  				{term: request.term,动作:"查"+id,厂家:厂家,功率:功率,ip:ip,电压:电压,频率:频率,型号:型号,系列:系列},
		  			function(data){
		  					data = $.parseJSON(data);
		  					response( $.map( data, function( item ) {
		  		            	return {label: item[id],value: item[id] }
		  		            }));
		  			});          
		        },
		        minLength: 0
		    }).focus(function(){$(this).autocomplete("search");});		  
	  }); 
}
function 电机列表清除(){
	var dict={厂家:对象['原动机厂家'],电压:对象['电压或油箱'],ip:对象['ip或材质']};
	$.each(dict, function(k,o){
		  var id=k;
		  o.autocomplete("destroy");		  
	  }); 
}
function 材质列表(){
	var dict={泵体泵盖:对象['泵体泵盖'],叶轮:对象['叶轮'],主轴:对象['主轴'],轴套:对象['轴套'],密封环:对象['密封环'],轴承:对象['轴承'],轴封:对象['轴封']};
	$.each(dict, function(k,o){
		  var id=k;
		  o.autocomplete({
		      source: function( request, response ) {
// 				  var 厂家=对象['原动机厂家'].val(),功率=对象['配套功率'].val(),ip=对象['ip或材质'].val(),电压=对象['电压或油箱'].val() 
// 						,频率='',型号=对象['原动机型号'].val(),系列='';
		    	  $.post("选型报价.do?chaxunCZ",
		  				{term: request.term,id:id},
		  			function(data){
		  					data = $.parseJSON(data);
		  					response( $.map( data, function( item ) {
		  		            	return {label: item["材质"],value: item["材质"] }
		  		            }));
		  			});          
		        },
		        minLength: 0
		    }).focus(function(){$(this).autocomplete("search");});		  
	  }); 
}
function 供货范围(){
	var array=[对象['有无_泵价'],对象['有无_机封价'],对象['有无_底座价'],对象['有无_反法兰价'],对象['有无_联轴器价'],对象['有无_电或柴价'],对象['有无_控制柜价']];
	$.each(array, function(){
		var b=this.parent().next();
		b.zhidu();
		this.click(function(){
			var a=this.checked;			
		    a?b.val("需要"):b.val("不需要");
		    if(location.href.indexOf("&id=")>=0){
		    	填价格();
			}
		});		
	}); 
}
function 只读(){
	var arr=[对象['额定点流量'],对象['额定点扬程'],对象['额定点轴功率'],对象['原动机转速'],对象['转速'],对象['原动机型号'],对象['配套功率']
		,对象['单价'],对象['总价']];
	$.zhidu(arr);
	$("#数据表编号,#泵型号").zhidu();
}
function 数据表编号(){
	$.ajax({  
        type : "post",  
        url : "选型报价.do?查用户",  
        data : {},  
        async : false,  
        success : function(data){  
        	data = $.parseJSON(data);
        	$("#数据表编号").val(data);        	
        }  
	});
}
function 提取NSC价格(){
// 	alert("k");
	$.ajax({  
	        type : "post",  
	        url : "选型报价.do?提取NSC价格",  
	        data : {编号:$("#数据表编号").val()},  
	        async : false,  
	        success : function(data){ 
	        	data = $.parseJSON(data);
	        	if (data['id']==null){
	        		alert("还没有算价记录！");
	        	}else{
	        		NSC价格=data;
	        		填型号();
	        		填价格();
	        	}
	        }  
		});
}
function 填型号(){
	$("#泵型号").val(NSC价格['bxh']);
	var array={"djcj":对象['原动机厂家'],"djxh":对象['原动机型号'],"djjs":对象['电机极数'],"dy":对象['电压或油箱']
		,"ptgl":对象['配套功率'],"ip":对象['ip或材质'],"xiaol":对象['额定点效率']};
	$.each(array, function(k,v){
		var a=NSC价格[k];
		v.val(a);
		v.zhidu();
	});
	对象['额定点效率'].trigger('change');
}
function 填价格(){
	var array={"btdj":对象['有无_泵价'],"jf":对象['有无_机封价'],"dzzj":对象['有无_底座价'],"f_xj":对象['有无_反法兰价']
	,"lzq":对象['有无_联轴器价'],"djjg":对象['有无_电或柴价'],"kzg":对象['有无_控制柜价']};
	$.each(array, function(k,v){
		var b=v.parent().next();
		var a=v.get(0).checked;
		var jg=NSC价格[k];
		jg==undefined?jg=0:{};
// 		alert(jg);
	    a?b.val(jg):b.val("不需要！");
	});
	算价格();
}
function 算价格(){
	var dj=0,zj=0,sl=$("#需要台数").val();
	var array={"btdj":对象['有无_泵价'],"jf":对象['有无_机封价'],"dzzj":对象['有无_底座价'],"f_xj":对象['有无_反法兰价']
	,"lzq":对象['有无_联轴器价'],"djjg":对象['有无_电或柴价'],"kzg":对象['有无_控制柜价']};
	$.each(array, function(k,v){		
		var a=v.get(0).checked;
		var b=v.parent().next().val();
		var jg=0;
		a?jg=b:{};
		dj+=jg*1;	    
	});
	对象['单价'].val(dj);
	zj=(dj*sl).toFixed();
	对象['总价'].val(zj);
}
function 价格change(){
	var array=[对象['泵价'],对象['机封价'],对象['底座价'],对象['反法兰价'],对象['联轴器价'],对象['电或柴价'],对象['控制柜价']];
	$.each(array, function(){
		this.change(function(){
		    	算价格();
		});		
	}); 
}
function 常用材质(){
	$.dialog({
		content: 'url:cgFormBuildController.do?goAddFtlForm&tableName=电机价格表&olstylecode=',
		lock : true,
		width:700,
		height:400,
		title:'电机价格表录入',
		opacity : 0.3,
		cache:false,
	    ok: function(){
	    	iW = this.iframe.contentWindow;
	    	$('#btn_sub', iW.document).click();
	    	var dianjiID=$("input[name='id']", iW.document).val();
	    	$('#kk').val(dianjiID);
	    	cxDJYID(dianjiID);
	    },
	    cancelVal: '关闭',
	    cancel: true /*为true等价于function(){}*/
	});

}
</script>












