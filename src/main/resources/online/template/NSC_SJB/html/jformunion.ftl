<#include "/online/template/00表单公用/head.ftl">

<#if (req.getParameter("走流程")!?html =="是") ||((id!?html != "")&&(data['${tableName}'].流程id!?html != ""))>
	<#include "/online/template/00表单公用/工作流js.ftl">
</#if>
<!-- kkkk1+${data['${tableName}'].流程id!?html}kkkk -->
<#include "/online/template/NSC_SJB/html/js.ftl">
<#include "/online/template/00表单公用/性能曲线js.ftl">

<body class="A4" >
<form id="formobj" action="表单.do?saveOrUpdateMore" name="formobj" method="post">
	<#include "/online/template/NSC_SJB/html/jformhead.ftl">
	<#include "/online/template/00表单公用/其他.ftl">	
	<#include "/online/template/00表单公用/Validform.ftl">
</form>
	<script type="text/javascript">${js_plug_in?if_exists}</script>	
</body>
</html>