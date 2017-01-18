<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
	/* li 不换行，宽度根据内容自适应，通过 float 实现 */
	.ul_one {list-style: none;margin: 0px;padding: 0px;}
	.ul_one li {float: left;background-color: #ccd;margin: 0px 20px 10px 0px;}
	
	/* li 不换行，宽度固定 */
	.ul_two {list-style: none;margin: 0px;padding: 0px;}
	.ul_two li {float: left;width: 100px;margin: 0px 20px 10px 0px;background-color: #ccd;overflow: hidden; line-height:1.6em;}
	
	/* li 不换行，宽度根据内容自适应，通过 display:inline 实现 */
	.ul_three {list-style: none;margin: 0px;padding: 0px;}
	.ul_three li {display:inline;background-color: #ccd;margin: 0px 20px 10px 0px;}
	
	.clear {clear: both;}
</style>
</head>
<body>
	<ul class="ul_one">
		<li>1ssssssssssssssssssssssss</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
	</ul>
	<div class="clear"></div>
	<hr />
	<ul class="ul_two">
		<li>1ssssssssssssssssssssssss</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
	</ul>
	<div class="clear"></div>
	<hr />
	<ul class="ul_three">
		<li>1ssssssssssssssssssssssss</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
		<li>1</li>
	</ul>
</body>
</html>