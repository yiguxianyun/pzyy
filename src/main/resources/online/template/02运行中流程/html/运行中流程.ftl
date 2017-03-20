<#import "/online/template/00/列表库.ftl" as 列表库>
<#import "/online/template/00/formatter库.ftl" as formatter库>
${config_iframe}
<link rel="stylesheet" href="online/template/ledefault/css/kk.css">
<link rel="stylesheet" href="plug-in/jquery-ui-1.12.1.custom/jquery-ui.css" type="text/css"/>
<script type="text/javascript" src="plug-in/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

<script type="text/javascript">
/**
*表单的高度,表单的宽度
**/
var ${config_id}Fw = 700,${config_id}Fh = 400;
$(function(){
	createDataGrid${config_id}();	
	<#include "/online/template/00/搜索栏自动完成.ftl">
});

<#include "创建DataGrid=运行中流程.ftl">

<#include "/online/template/00/列表其他.ftl">
<@列表库.查询/>
<@列表库.增改看/>	
<@列表库.批量删除/>	

</script>

<table width="100%"   id="${config_id}List" toolbar="#${config_id}Listtb"></table>
<#include "搜索栏=02运行中流程.ftl">