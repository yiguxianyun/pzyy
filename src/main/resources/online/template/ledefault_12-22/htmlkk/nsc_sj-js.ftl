<script type="text/javascript">
$(document).ready(function(){
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
	
	$("b:contains('电机价格：')").after('<input type="button" value="新电机"  id="xindj" class="nav-tabs  ui_state_highlight"\
			style="line-height:25px;height: 23px;margin-left: 10px;" onclick="tanchuang()"/>');
	
	$(document.getElementById('nsc_sj_dj[0].glyl')).change(function(){
		jsZGL();
// 		$(document.getElementById('nsc_sj_dj[0].djxh')).get(0).selectedIndex=1;
	// 	alert($(document.getElementById('nsc_sj_dj[0].xl')).val());
	});	
	
	设置只读();
	
	//电机型号联动
	$(document.getElementById('nsc_sj_dj[0].djxh')).change(function(){
		var 对象=找对象();
		var index=对象['djxh'].get(0).selectedIndex;
		对象['ptgl'].get(0).selectedIndex=index;
		$("#yc_pl").get(0).selectedIndex=index;
		$("#yc_ly").get(0).selectedIndex=index;
		$("#yc_dj").get(0).selectedIndex=index;
		填写价格();
	});	
	$(document.getElementById('nsc_sj_dj[0].ptgl')).change(function(){
		var 对象=找对象();
		var index=对象['ptgl'].get(0).selectedIndex;
		对象['djxh'].get(0).selectedIndex=index;
		$("#yc_pl").get(0).selectedIndex=index;
		$("#yc_ly").get(0).selectedIndex=index;
		$("#yc_dj").get(0).selectedIndex=index;
		填写价格();
	});	
	//重算轴功率
	$("#q,#h,#md,#xiaol,#djjs").change(function(){
		jsZGL();
		});	
	$(document.getElementById('nsc_sj_dj[0].djcj')).change(function(){
		cxXL();
		});	
	$(document.getElementById('nsc_sj_dj[0].xl')).change(function(){
		cxIP();
		});	
	$(document.getElementById('nsc_sj_dj[0].ip')).change(function(){
		cxDY();
		});	
	$(document.getElementById('nsc_sj_dj[0].dy')).change(function(){
		cxXH();
		});	
	//IP等系数变化后重算价格
	csJiaG();
	
	//编辑时刷新
	$("#shuax").click(function(){
		cxBJG();
		});
	
	
});

function 找对象(){
	var 对象=new Array();	
	对象['djcj']=$(document.getElementById('nsc_sj_dj[0].djcj'));
	对象['xl']=$(document.getElementById('nsc_sj_dj[0].xl'));
	对象['ip']=$(document.getElementById('nsc_sj_dj[0].ip'));
	对象['dy']=$(document.getElementById('nsc_sj_dj[0].dy'));
	
	对象['djxh']=$(document.getElementById('nsc_sj_dj[0].djxh'));
	对象['ptgl']=$(document.getElementById('nsc_sj_dj[0].ptgl'));
	对象['pl']=$(document.getElementById('nsc_sj_dj[0].pl'));
	对象['ly']=$(document.getElementById('nsc_sj_dj[0].ly'));
	对象['bzjg']=$(document.getElementById('nsc_sj_dj[0].bzjg'));
	
	对象['yc_pl']=$("#yc_pl");
	对象['yc_ly']=$("#yc_ly");
	对象['yc_dj']=$("#yc_dj");
	
	对象['ipxs']=$(document.getElementById('nsc_sj_dj[0].ipxs'));
	对象['gyxs']=$(document.getElementById('nsc_sj_dj[0].gyxs'));
	对象['snwxs']=$(document.getElementById('nsc_sj_dj[0].snwxs'));
	对象['lwsxs']=$(document.getElementById('nsc_sj_dj[0].lwsxs'));
	对象['ydyxs']=$(document.getElementById('nsc_sj_dj[0].ydyxs'));
	对象['djjg']=$(document.getElementById('nsc_sj_dj[0].djjg'));
	
	对象['gdy']=$(document.getElementById('nsc_sj_dj[0].gdy'));
	对象['sw']=$(document.getElementById('nsc_sj_dj[0].sw'));
	对象['swsxgdyxs']=$(document.getElementById('nsc_sj_dj[0].swsxgdyxs'));
	return 对象;
}
 
function 设置只读(){
	var 对象=找对象();
	var arr1 = [对象['bzjg'],对象['ly'],对象['pl'],对象['sw'],对象['gdy'],对象['swsxgdyxs']];
	$.zhidu(arr1);
	$("#zgl").zhidu();
}
function jsZGL() {
 	var q=$("#q").val()/3600; 
 	var h=$("#h").val(); 
 	var xl=$("#xiaol").val(); 
 	var md=$("#md").val();
 	var zgl=q*h*9.8/xl*100*md;
 	$("#zgl").val(zgl.toFixed(1));
 	var glyl=$(document.getElementById('nsc_sj_dj[0].glyl')).val();
 	var jsptgl=zgl*glyl;
 	$(document.getElementById('nsc_sj_dj[0].jsptgl')).val(jsptgl.toFixed(1));
 	cxDJCJ();
 }

 //kk查询电机厂家
function cxDJCJ(){	
		var 对象=找对象();
		var arr1 = [对象['djcj'],对象['xl'],对象['ip'],对象['dy'],对象['djxh'],对象['ptgl'],对象['yc_pl'],对象['yc_ly'],对象['yc_dj'],];
		$.each(arr1, function(){
			this.empty();
			});
		对象['bzjg'].val("");
		
		var jsptgl= $(document.getElementById('nsc_sj_dj[0].jsptgl')).val();
		var djjs=$("#djjs").val();
		$.post("选型报价.do?cxDJCJ",
				{动作:"查厂家",jsptgl:jsptgl,djjs:djjs},
			function(data){		
				data = $.parseJSON(data);
// 				dataCJ=data.cj
				var objCJ= document.getElementById('nsc_sj_dj[0].djcj');
				for(var k = 0;k<data.length;k++){		            
					var cj=data[k]["厂家"];
					$(objCJ).append("<option value='"+cj+"'>"+cj+"</option>"); 
		        }
				$(objCJ).val('南阳防爆');				
// 				dataXL=data.xl
// 				var objXL= document.getElementById('nsc_sj_dj[0].xl');
// 				for(var k = 0;k<dataXL.length;k++){		            
// 					var xl=dataXL[k]["系列"];
// 					$(objXL).append("<option value='"+xl+"'>"+xl+"</option>"); 
// 		        }
			cxXL();
			});
}

function cxXL(){
	var 对象=找对象();
	var arr1 = [对象['xl'],对象['ip'],对象['dy'],对象['djxh'],对象['ptgl'],对象['yc_pl'],对象['yc_ly'],对象['yc_dj'],];
	$.each(arr1, function(){
		this.empty();
		});
	对象['bzjg'].val("");
	
	var jsptgl= $(document.getElementById('nsc_sj_dj[0].jsptgl')).val();
	var djjs=$("#djjs").val();
	var djcj= $(document.getElementById('nsc_sj_dj[0].djcj')).val();
	$.post("选型报价.do?cxDJCJ",
			{动作:"查系列",jsptgl:jsptgl,djcj:djcj,djjs:djjs},
		function(data){		
			data = $.parseJSON(data);
//				dataCJ=data.cj
			var objCJ= document.getElementById('nsc_sj_dj[0].xl');
			for(var k = 0;k<data.length;k++){		            
				var cj=data[k]["系列"];
				$(objCJ).append("<option value='"+cj+"'>"+cj+"</option>"); 
	        }
			$(objCJ).val('YE3');
		cxIP();
		});	
}

function cxIP(){
	var 对象=找对象();
	var arr1 = [对象['ip'],对象['dy'],对象['djxh'],对象['ptgl'],对象['yc_pl'],对象['yc_ly'],对象['yc_dj'],];
	$.each(arr1, function(){
		this.empty();
		});
	对象['bzjg'].val("");
	
	var jsptgl= $(document.getElementById('nsc_sj_dj[0].jsptgl')).val();
	var djjs=$("#djjs").val();
	var djcj= $(document.getElementById('nsc_sj_dj[0].djcj')).val();
	var xl= $(document.getElementById('nsc_sj_dj[0].xl')).val();
// 	alert($(document.getElementById('nsc_sj_dj[0].xl')).val());
	$.post("选型报价.do?cxDJCJ",
			{动作:"查IP",jsptgl:jsptgl,djcj:djcj,xl:xl,djjs:djjs},
		function(data){		
			data = $.parseJSON(data);
			var objCJ= document.getElementById('nsc_sj_dj[0].ip');
			for(var k = 0;k<data.length;k++){		            
				var cj=data[k]["IP"];
				$(objCJ).append("<option value='"+cj+"'>"+cj+"</option>"); 
	        }
		cxDY();
		});
}
function cxDY(){
	var 对象=找对象();
	var arr1 = [对象['dy'],对象['djxh'],对象['ptgl'],对象['yc_pl'],对象['yc_ly'],对象['yc_dj'],];
	$.each(arr1, function(){
		this.empty();
		});
	对象['bzjg'].val("");
	
	var jsptgl= $(document.getElementById('nsc_sj_dj[0].jsptgl')).val();
	var djjs=$("#djjs").val();
	var djcj= $(document.getElementById('nsc_sj_dj[0].djcj')).val();
	var xl= $(document.getElementById('nsc_sj_dj[0].xl')).val();
	var ip= $(document.getElementById('nsc_sj_dj[0].ip')).val();	
	$.post("选型报价.do?cxDJCJ",
			{动作:"查电压",jsptgl:jsptgl,djcj:djcj,xl:xl,ip:ip,djjs:djjs},
		function(data){		
			data = $.parseJSON(data);
			var objCJ= document.getElementById('nsc_sj_dj[0].dy');
			for(var k = 0;k<data.length;k++){		            
				var cj=data[k]["电压"];
				$(objCJ).append("<option value='"+cj+"'>"+cj+"</option>"); 
	        }
		cxXH();
		});

}
function cxXH(){
	var 对象=找对象();
	var arr1 = [对象['djxh'],对象['ptgl'],对象['yc_pl'],对象['yc_ly'],对象['yc_dj'],];
	$.each(arr1, function(){
		this.empty();
		});
	对象['bzjg'].val("");
	
	var jsptgl= $(document.getElementById('nsc_sj_dj[0].jsptgl')).val();
	var djjs=$("#djjs").val();	
	var djcj= $(document.getElementById('nsc_sj_dj[0].djcj')).val();
	var xl= $(document.getElementById('nsc_sj_dj[0].xl')).val();
	var ip= $(document.getElementById('nsc_sj_dj[0].ip')).val();
	var dy= $(document.getElementById('nsc_sj_dj[0].dy')).val();
// 	alert(djjs);	
	$.post("选型报价.do?cxDJCJ",
			{动作:"查型号",jsptgl:jsptgl,djcj:djcj,xl:xl,ip:ip,dy:dy,djjs:djjs},
		function(data){		
			data = $.parseJSON(data);
			var objXH= document.getElementById('nsc_sj_dj[0].djxh');
			var objPTGL= document.getElementById('nsc_sj_dj[0].ptgl');
			var objPL= document.getElementById('nsc_sj_dj[0].pl');
			var objLY= document.getElementById('nsc_sj_dj[0].ly');
			var objBZJG= document.getElementById('nsc_sj_dj[0].bzjg');
			for(var k = 0;k<data.length;k++){		            
				var xh=data[k]["型号"];
				var gl=data[k]["功率"];
				var pl=data[k]["频率"];
				var ly=data[k]["update_name"];
				var dj=data[k]["单价"];				
				$(objXH).append("<option value='"+xh+"'>"+xh+"</option>"); 
				$(objPTGL).append("<option value='"+gl+"'>"+gl+"</option>"); 
				$("#yc_pl").append("<option value='"+pl+"'>"+pl+"</option>"); 
				$("#yc_ly").append("<option value='"+ly+"'>"+ly+"</option>"); 
				$("#yc_dj").append("<option value='"+dj+"'>"+dj+"</option>"); 
	        }
			填写价格();
		});
}
function 填写价格(){	
	var 对象=找对象();
	对象['pl'].val($("#yc_pl").val());
	对象['ly'].val($("#yc_ly").val());
	对象['bzjg'].val($("#yc_dj").val());
	jsJiaG();
}

//价格相关
function jsJiaG(){
	var 对象=找对象();
	对象['djjg'].val("");
	(对象['dy'].val().toUpperCase().indexOf("380V"||"400V"||"660V")>=0)?
		对象['gdy'].val("低压"):对象['gdy'].val("高压");
	var jg=对象['bzjg'].val()*对象['ipxs'].val()*对象['gyxs'].val()*对象['snwxs'].val()*
			对象['lwsxs'].val()*对象['ydyxs'].val();
	(jg>100000)?对象['sw'].val("＞10W"):对象['sw'].val("≤10W");
	
	switch(true){    
		    case (对象['sw'].val()=="≤10W")&&(对象['gdy'].val()=="低压") :                    
		    	对象['swsxgdyxs'].val(1.25);
		       break;                
		    case (对象['sw'].val()=="≤10W")&&(对象['gdy'].val()=="高压") : 
		    	对象['swsxgdyxs'].val(1.2);     
		        break;
		    case (对象['sw'].val()=="＞10W")&&(对象['gdy'].val()=="低压") : 
		    	对象['swsxgdyxs'].val(1.2);     
		    case (对象['sw'].val()=="＞10W")&&(对象['gdy'].val()=="高压") : 
		    	对象['swsxgdyxs'].val(1.15);       
		        break;
		    default :对象['djjg'].val("");  		       
	}	
	对象['djjg'].val((jg*对象['swsxgdyxs'].val()).toFixed()); 
}
//重新算价格
function csJiaG(){
	var 对象=找对象();
	var arr1 = [对象['ipxs'],对象['gyxs'],对象['snwxs'],对象['lwsxs'],对象['ydyxs']];
	$.each(arr1, function(){
		this.change(function(){jsJiaG();});
		});
	
}

//新电机录入
function tanchuang() {
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
//kk查询电机用id
function cxDJYID(dianjiID){	
	var 对象=找对象();
	$.post("选型报价.do?cxDJYID",
			{dianjiID:dianjiID,},
			function(data){		
				data = $.parseJSON(data);
				var cj=data["厂家"],xl=data["系列"],ip=data["ip"],dy=data["电压"];
				对象['djcj'].append("<option value='"+cj+"'>"+cj+"</option>"); 
				对象['djcj'].val(cj);
				对象['xl'].append("<option value='"+xl+"'>"+xl+"</option>"); 
				对象['xl'].val(xl);
				对象['ip'].append("<option value='"+ip+"'>"+ip+"</option>"); 
				对象['ip'].val(ip);
				对象['dy'].append("<option value='"+dy+"'>"+dy+"</option>"); 
				对象['dy'].val(dy);
 				cxXH();
			});
}

</script>   
<div class="col-xs-2" style="display: none;background-color:#999999"> 
<b>频率：</b><select id="yc_pl" class="form-control" ></select>
 <b>来源：</b><select id="yc_ly" class="form-control" ></select>
 <b>单价：</b><select id="yc_dj" class="form-control" ></select> 
 </div>
 

















