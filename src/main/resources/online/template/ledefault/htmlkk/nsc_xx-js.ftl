<script type="text/javascript">
 $(document).ready(function(){
	//kk查询nsc	
	$("#q,#h,#bl,#js").change(function(){
	cxnsc();
	});
	$("#js").change(function(){
		$.转速计算($("#js"),$("#zsu"));
		$("#zsu").trigger("change");
		});
	$("#zsu").change(function(){
		jsbzs();			
		});
	//kk如果是新建马上查询nsc
	<#if id?if_exists?html == ''>
		提取数据表();
		cxnsc();
	</#if>		
	
	$("#q_x,#q_s,#h_s,#h_x,#数据表编号,#zsu").zhidu();
	$('a[href="#con-wrapper2"]').hide();
	$("#btn_sub").hide();
	
	//kk保存
	$("#bcun").click(function(){
			$(document.getElementById('nsc_bxn[0].泵型号')).val($("#xzxh").val());
			$(document.getElementById('nsc_bxn[0].流量h')).val($("#q").val());
			$(document.getElementById('nsc_bxn[0].扬程')).val($("#h").val());
			$(document.getElementById('nsc_bxn[0].转速')).val($("#zsu").val());	
			$(document.getElementById('nsc_bxn[0].效率')).val($("#gjxl").val());		
			$(document.getElementById('nsc_bxn[0].气蚀余量')).val($("#gjnp").val());		
			$(document.getElementById('nsc_bxn[0].电机极数')).val($("#js").val());		
			$(document.getElementById('nsc_bxn[0].叶轮直径')).val($("#gjylzj").val());		
			$(document.getElementById('nsc_bxn[0].路径')).val($("#cslj").val());		
				
	    	var jg=window.frames[0].sjsj();
	
		    $("#formobj :input[name]").each(function(){
		        jg[$(this).attr('name')]=$(this).val();
		    });
// 	    	alert($("#formobj select[name]").val());
		    
			 $("#formobj").Validform().config({
											  ajaxpost:{data:jg}
											});
			$('#btn_sub').trigger('click');	
	});
	$("#bcunSJ").click(function(){
		$('#bcun').trigger('click');		
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
		url=url1+'&bxh='+$('#xzxh').val()+'&q='+$('#q').val()
				+'&h='+$('#h').val()+'&xl='+$('#gjxl').val()+'&数据表编号='+$('#数据表编号').val()
				+'&极数='+$('#js').val();
		window.open(url,'_blank');
		window.close();
		});
	
	//编辑时刷新
	$("#shuax").click(function(){
		cxnsc();
		});
	
	
});


//kk查询nsc泵性能参数
	function cxnsc(){
		$("#con-wrapper0").attr({"src":"NSC选型明细.do?list&id=nsc_bxn","状态":"查询"});
		var q_x=$("#q").val()*(1-$("#bl").val()/100);$("#q_x").val(q_x.toFixed(1));
		var q_s=$("#q").val()*(1+$("#bl").val()/100);$("#q_s").val(q_s.toFixed(1));
		var h_s=$("#h").val()*(1+$("#bl").val()/100);$("#h_s").val(h_s.toFixed(1));
		var h_x=$("#h").val()*(1-$("#bl").val()/100);$("#h_x").val(h_x.toFixed(1));
	}

//计算比转速	
function jsbzs() {
		var zsu=$("#zsu").val();
		var q=$("#q").val()/3600/2; 
		var h=$("#h").val(); 
		var ns=3.65*zsu*Math.pow(q,0.5)/Math.pow(h,0.75);
		$("#bzs").val(ns.toFixed(1));
}
function 提取数据表(){
	if ($.getUrlParam('数据表编号') != null) {
		var a=$.getUrlParam('数据表编号');
		$("#数据表编号").val(a);
		$.ajax({  
	        type : "post",  
	        url : "选型报价.do?提取数据表",  
	        data : {编号:a},  
	        async : false,  
	        success : function(data){  
	        	data = $.parseJSON(data);
	        	$("#q").val(data['流量']);$("#h").val(data['扬程']);$("#js").val(data['电机极数']);      	
	        }  
		});
		$.转速计算($("#js"),$("#zsu"));
		$("#zsu").trigger("change");
	}
}
 </script>  
 
 
 
 
 
 
 
 
