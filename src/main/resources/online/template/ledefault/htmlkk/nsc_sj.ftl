<script type="text/javascript">
$(function(){
	对象=找对象();
	泵对象=bbf找对象();
	数据表={};
	//重算轴功率
	$("#q,#h,#md,#xiaol,#djjs").change(function(){
		jsZGL();
		});
	//==
	if ($.getUrlParam('数据表编号') != null) {	
		提取数据表();
		if ($.getUrlParam('bxh') != null) {	
			$("#bxh").val($.getUrlParam('bxh'));$("#q").val($.getUrlParam('q'));
			$("#h").val($.getUrlParam('h'));$("#xiaol").val($.getUrlParam('xl'));
			$("#djjs").val($.getUrlParam('极数'));
		}else{	
			$("#q").val(数据表['流量']);$("#h").val(数据表['扬程']);$("#djjs").val(数据表['电机极数']);
		}
		$("#xmmc").val(数据表['项目名称']);
		$("#djjs").trigger("change");
		cxBJG();
	}	
//kk如果是新建马上查询电机厂家
	<#if id?if_exists?html == ''>
		$("#djjs").trigger("change");
		cxBJG();
	</#if>	

	$("#zgl,#数据表编号").zhidu();
	
	$("#bxh").autocomplete({
	    source:function(request,response) {    	  
	  	  $.post("选型报价.do?chaxunNSC",
					{term:request.term,},
				function(data){
						data=$.parseJSON(data);
						response($.map(data,function(item){
			            	return {label:item.泵型号,value:item.泵型号}
			            }));
				});          
	      },
	      minLength: 0,
	      change:function(){
	    	  $("#bxh").trigger("change");
	  }
	}).focus(function(){$(this).autocomplete("search");});
	
});

function jsZGL() {
 	var q=$("#q").val()/3600,	h=$("#h").val(),	xl=$("#xiaol").val(),	md=$("#md").val(); 
 	var zgl=q*h*9.8/xl*100*md;
 	$("#zgl").val(zgl.toFixed(1));
 	jsPTGL();
}
function 提取数据表(){
		var a=$.getUrlParam('数据表编号');
		$("#数据表编号").val(a);
		$.ajax({  
	        type : "post",  
	        url : "选型报价.do?提取数据表",  
	        data : {编号:a},  
	        async : false,  
	        success : function(data){  
	        	数据表 = $.parseJSON(data);
	        }  
		});
} 
 
</script>  
<#include "/online/template/ledefault/html/jformhead.ftl">

















