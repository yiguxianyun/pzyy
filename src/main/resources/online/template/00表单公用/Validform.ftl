<script type="text/javascript">
$(function(){
	$("#formobj").Validform({
          tiptype:1,
          btnSubmit:"#btn_sub",
          btnReset:"#btn_reset",
          ajaxPost:true,
          usePlugin:{passwordstrength:{
          minLen:6,
          maxLen:18,
          trigger:function(obj,error){
                  if(error){
                      obj.parent().next().find(".Validform_checktip").show();
                      obj.find(".passwordStrength").hide();
                  }else{
	                  $(".passwordStrength").show();
	                  obj.parent().next().find(".Validform_checktip").hide();}}}},
          callback:function(data){
		              if(data.success==true){
							$.Showmsg(data.msg);
							if(!$("input[name='id']").val()){
								if(data.obj!=null && data.obj!='undefined'){
									var url="表单.do?goUpdateFtlForm&tableName=${tableName}&id="+data.obj.id;
									var a=decodeURI(location.href);
									if(a.indexOf("走流程=是")!=-1){
										url+="&走流程=是";
									}
									window.location.href =url;
					  			}				  	
							}else{
								uploadFile(data);
							}
		              }else{
		                  if(data.responseText==''||data.responseText==undefined){
		                  	$.Showmsg(data.msg);
		                      $.messager.alert('错误',data.msg);
		                      $.Hidemsg();}
		                      else{
		                          try{var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'),data.responseText.indexOf('错误信息'));
								      $.messager.alert('错误',emsg);$.Hidemsg();}catch(ex){$.messager.alert('错误',data.responseText+'');}}
								      return false;
				      }
		              if(!neibuClickFlag){
// 		            	  var win = frameElement.api.opener;
// 		     				 win.reloadTable();
					 	}
          }
	});
});		
</script>







