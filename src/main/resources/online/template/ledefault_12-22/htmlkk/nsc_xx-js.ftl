<script type="text/javascript">
 $(document).ready(function(){
	//kk查询nsc	
	$("#q,#h,#bl,#js").change(function(){
	cxnsc();
	});	
	//kk如果是新建马上查询nsc
	<#if id?if_exists?html == ''> cxnsc();</#if>		
	
	$("#q_x,#q_s,#h_s,#h_x").attr({"readonly":true,"style":"background-color:#dddddd"});
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
	
		    $("#formobj input[name]").each(function(){
		        jg[$(this).attr('name')]=$(this).val();
		    });
	    	
			 $("#formobj").Validform().config({
											  ajaxpost:{data:jg}
											});
			$('#btn_sub').trigger('click');	
	});
	$("#bcunSJ").click(function(){
		$('#bcun').trigger('click');
		var url='cgFormBuildController.do?goAddFtlForm&tableName=nsc_sj&bxh='+$('#xzxh').val()+'&q='+$('#q').val()+'&h='+$('#h').val()+'&xl='+$('#gjxl').val();
		window.open(url,'_blank');
		window.close();
		});
	
	//kk转速变化计算比转速	
	$("#zsu").change(function(){
		$("#zsu").val()==""?$("#bzs").val(""):jsbzs();			
		});
	//编辑时刷新
	$("#shuax").click(function(){
		cxnsc();
		});
	
	
});


//kk查询nsc泵性能参数
	function cxnsc(){
	$("#con-wrapper0").attr({"src":"NSC选型明细.do?list&id=nsc_bxn","状态":"查询"});
	$("#q_x").val($("#q").val()*(1-$("#bl").val()/100));
	$("#q_s").val($("#q").val()*(1+$("#bl").val()/100));
	$("#h_s").val($("#h").val()*(1+$("#bl").val()/100));
	$("#h_x").val($("#h").val()*(1-$("#bl").val()/100));		
	$("#zsu").val()==""?$("#bzs").val(""):jsbzs();			
	}

//计算比转速	
function jsbzs() {
	var zsu=$("#zsu").val(); 
	var q=$("#q").val()/3600/2; 
	var h=$("#h").val(); 
	var ns=3.65*zsu*Math.pow(q,0.5)/Math.pow(h,0.75);
	zsu=$("#bzs").val(ns.toFixed(1));
}

 </script>  
