<script type="text/javascript">
$(function(){
        var clip = new ZeroClipboard.Client();
        clip.setHandCursor( true );
        clip.glue('性能图');
        clip.addEventListener('mouseDown', function(client){
    		var 内容=$("#数据表编号").val()+"	"+$("#技术支持").val()+"	"+$("#客户单位").val()+"	"+$("#项目名称").val()+"	"+
			$("#泵型号").val()+"	"+$("#流量").val()+"	"+$("#扬程").val()+"	"+对象['额定点效率'].val()+"	"+对象['配套功率'].val()+"	"+对象['原动机转速'].val();
      		clip.setText(内容);
        });
        clip.addEventListener('complete', function(client, text){
            alert("复制成功===="+text);
	     	location.href='myexplorer:'+'D:\\南方长河\\00模板文件\\绘制性能曲线.xls';
            frameElement.api.close();

        });	
});

</script>

















