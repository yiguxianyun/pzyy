<style>
  .ui-autocomplete {
    max-height: 200px;
    overflow-y: auto;
    /* 防止水平滚动条 */
    overflow-x: hidden;
  }
  </style>
<script type="text/javascript">
$(function(){
	对象=找对象();
	对象_长轴泵=找对象_长轴泵();
	数据表={};
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
		查询长轴泵();
		长轴泵法兰();
	</#if>	
	
	//重算轴功率
	$("#q,#h,#md,#xiaol,#djjs").change(function(){
		jsZGL();
		});	

	$("#zgl").zhidu();
	$("#bxh").autocomplete({
	    source:function(request,response) {    	  
	  	  $.post("选型报价.do?chaxunCZB",
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
	    	  查询长轴泵();长轴泵法兰();
    	  }
	}).focus(function(){$(this).autocomplete("search");});

});

function jsZGL() {
 	var q=$("#q").val()/3600,	h=$("#h").val(),	xl=$("#xiaol").val(),	md=$("#md").val(); 
 	var zgl=q*h*9.8/xl*100*md;
 	$("#zgl").val(zgl.toFixed(1));
 	jsPTGL();
 }
</script>  

<#include "/online/template/ledefault/html/jformhead.ftl">

















