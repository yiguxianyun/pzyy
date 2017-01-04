<!DOCTYPE html>
<html>
  <head>
  <script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.js"></script>


  <script type="text/javascript" src="plug-in/lhgDialog/lhgdialog.min.js?skin=metrole"></script>
  <script type="text/javascript" src="plug-in/tools/easyuiextend.js"></script>


</head>
<script type="text/javascript">
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

function cxDJYID(dianjiID){			
		$.post("选型报价.do?cxDJYID",
				{dianjiID:dianjiID,},
			function(data){		
				data = $.parseJSON(data);
				var objCJ= document.getElementById('nsc_sj_dj[0].djcj');						            
				var cj=data["厂家"];
					$(objCJ).append("<option value='"+cj+"'>"+cj+"</option>"); 
				$(objCJ).val(cj);				

// 				cxXH();
			});
}
</script>
	

  <body>
<input type="button" value="保存*"  id="bcun" class="ui_state_highlight" style="margin-left: 10px;"/>

<a id="add" href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-plain" plain="true" icon="icon-add" onclick="tanchuang()">
<span class="l-btn-left"><span class="l-btn-text icon-add l-btn-icon-left">录入</span>
</span>
</a>
<div class="col-xs-2">
		          <b>电机厂家：</b>
     				
		<select id="nsc_sj_dj[0].djcj" class="form-control" name="nsc_sj_dj[0].djcj"><option value="山西电机">山西电机</option><option value="南阳防爆">南阳防爆</option><option value="江苏德能">江苏德能</option><option value="佳木斯">佳木斯</option><option value="杭州恒力">杭州恒力</option><option value="西门子">西门子</option><option value="西门子贝得">西门子贝得</option><option value="西安西玛">西安西玛</option><option value="西门子贝德">西门子贝德</option><option value="南阳电机">南阳电机</option><option value="兰州电机">兰州电机</option><option value="湘潭电机">湘潭电机</option><option value="上海电机">上海电机</option><option value="重庆赛力盟">重庆赛力盟</option><option value="江特电机">江特电机</option><option value="江特">江特</option></select>
					
				
				<label class="Validform_label" style="display: none;">电机厂家</label>
				</div>

<div class="col-xs-2"><b>室内外系数：</b>
		<input id="kk" name="nsc_sj_dj[0].snwxs" type="text" class="form-control" value="1" nullmsg="“室内外系数”请输入合适的数据！" datatype="/.*/">    
				</div>
</body>

</html>

