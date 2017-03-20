/**
 * 添加事件打开窗口
 * @param title 编辑框标题
 * @param addurl//目标页面地址
 */
function addkk(title,addurl,gname,width,height) {
	gridname=gname;
	//createwindow(title, addurl,width,height);
	window.open(addurl,'_blank');
}
/**
 * 更新事件打开窗口
 * @param title 编辑框标题
 * @param addurl//目标页面地址
 * @param id//主键字段
 */
function updatekk(title,url, id,width,height,isRestful) {
	gridname=id;
	var rowsData = $('#'+id).datagrid('getSelections');
	if (!rowsData || rowsData.length==0) {
		tip('请选择编辑项目');
		return;
	}
	if (rowsData.length>1) {
		tip('请选择一条记录再编辑');
		return;
	}
	if(isRestful!='undefined'&&isRestful){
		url += '/'+rowsData[0].id;
	}else{
		url += '&id='+rowsData[0].id;
	}
	window.open(url,'_blank');

}
