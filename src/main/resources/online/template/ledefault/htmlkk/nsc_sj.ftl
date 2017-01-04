<script type="text/javascript">
$(function(){
// 	 alert("kk");
//kk如果是新建马上查询电机厂家
	<#if id?if_exists?html == ''>
		if ($.getUrlParam('bxh') != null) {	
			$("#bxh").val($.getUrlParam('bxh'));
			$("#q").val($.getUrlParam('q'));
			$("#h").val($.getUrlParam('h'));
			$("#xiaol").val($.getUrlParam('xl'));
		}			
		$("#djjs").val(4);		
		jsZGL();
		cxBJG();
	</#if>	
	
	//重算轴功率
	$("#q,#h,#md,#xiaol,#djjs").change(function(){
		jsZGL();
		});	

	$("#zgl").zhidu();
	
});

function jsZGL() {
 	var q=$("#q").val()/3600,	h=$("#h").val(),	xl=$("#xiaol").val(),	md=$("#md").val(); 
 	var zgl=q*h*9.8/xl*100*md;
 	$("#zgl").val(zgl.toFixed(1));
 	jsPTGL();
 }
</script>  
<#include "/online/template/ledefault/html/jformhead.ftl">

















