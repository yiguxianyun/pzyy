<script type="text/javascript">
$(function(){
	$("#工作流").show();
	查流程();	
	$("#提交").click(function(){
		 $("#formobj").Validform().config({
										  ajaxpost:{url:"工作流表单.do?提交",async : false,}
										});
		$('#btn_sub').trigger('click');	
		查流程();
	});	
	$("#驳回").click(function(){
		var 流程id=$("#流程id").val();
		$.ajax({  
	        type : "post",  
	        url : "工作流表单.do?驳回",  
	        data : {流程id:流程id,},  
	        async : false,  
	        success : function(data){
	        	data = $.parseJSON(data);
	        	$.Showmsg(data.msg);
	        }  
		});
		查流程();
	});	
	
});
function 查流程(){
	var 流程id=$("#流程id").val();
	var currentStep;
	if(流程id!=''){
		$.ajax({  
	        type : "post",  
	        url : "通用.do?查流程",  
	        data : {流程id:流程id,},  
	        async : false,  
	        success : function(data){  
	        	data = $.parseJSON(data);
	        	当前任务=data.当前任务;
	        	步骤=data.步骤;
	        	username=data.username;
	        	办理人=data.办理人;
//	         	alert(username+办理人);
	        }  
		});
		if(当前任务==undefined){
			画图(3);
			$(".step_context").css({"opacity":0.5,});
		}else{
			switch(true){    
		    case (步骤=="tianxie") :                    
		    	currentStep=1;
		       break;                
		    case (步骤=="xuanxing") : 
		    	currentStep=2;     
		        break;
		    case (步骤=="xiaoshouqueren") : 
		    	currentStep=3; 
		    	break;
		    default :currentStep=步骤; 		       
			};
			var a=decodeURI(location.href);
			if( a.indexOf("走流程=是")!=-1 &&步骤=="tianxie"){
				自动完成第一步();
			}
			画图(currentStep);
		}
		if(username!=办理人&&流程id!=''){
			$("#提交,#驳回,#工具栏").hide();
		}
	}else{
		画图(1);
	}
}
function 画图(currentStep){
	//所有步骤的数据
	var stepListJson=[{StepNum:1,StepText:"填询价数据表"},
    {StepNum:2,StepText:"选型算价"},
    {StepNum:3,StepText:"销售确认"},];
	//new一个工具类
	var StepTool = new Step_Tool_dc("test","mycall");
	StepTool.drawStep(currentStep,stepListJson);
}
function 自动完成第一步(){
	var url='工作流表单.do?自动完成第一步&流程id='+$("#流程id").val()+'&技术支持='+$("#技术支持").val();
	$.ajax({  
        type : "post",  url : url, data : {},async : false,success : function(data){ }  
	});
	查流程();
}
function mycall(restult){
//	alert("mycall"+result.value+":"+result.text);
	StepTool.drawStep(result.value,stepListJson);
	//TODO...这里可以填充点击步骤的后加载相对应数据的代码
}

</script>












