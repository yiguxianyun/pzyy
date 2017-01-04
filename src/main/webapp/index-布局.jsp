<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title>可换行的select</title>
  <style type="text/css">
 div.zselect{
  background:#ffffff;
  display:none;
  position:absolute;
  z-index:1000;
 }
 div.zselect iframe{
  width:100%;
  height:100%;
  position:absolute;
  top:0px;
  z-index:-1;
 }
 div.zselect ul{
  margin:0;
  padding:0;
  border:1px solid #000;
 }
 div.zselect li{
  list-style:none;
  margin:0;
  padding:3px 2px 2px 2px;
  border-bottom:1px dotted gray;
  cursor:default;
 }
 div.zselect li.over{
  list-style:none;
  margin:0;
  padding:3px 2px 2px 2px;
  background-color:#335ea8;
  color:white;
  border-bottom:1px dotted gray;
  cursor:default;
 }
  </style>
  <script type="text/javascript">
 function sc(o){
  alert(o.value);
 }
  </script>
 </head>
 <body bgcolor="blue">
  zselect Demo<br/><br/><br/><br/><br/>
  <select id="hello" rel="zselect" onchange="sc(this); " style="width:120px;">
  <option value="光影魔术手">光影魔术手光影魔术手光影魔术手光影魔术手</option>
  <option value="极品时刻表">极品时刻表极品时刻表</option>
  <option value="电子收藏夹">电子收藏夹电子收藏夹电子收藏夹电子收藏夹电子收藏夹</option>
  </select><br><br>
  <select id="hello1" rel="zselect" style="width:200px;" >
 <option>光影魔术手光影魔术手光影魔术手光影魔术手</option>
  <option>极品时刻表极品时刻表</option>
  <option>电子收藏夹电子收藏夹电子收藏夹电子收藏夹电子收藏夹</option>
</select>
<script type="text/javascript">
if(!window.zselect){
 window.zselect = {
  cs : null,oc : null,ol : null,ob : null,IsShown : false,
  init: function(){
   if (arguments.callee.done) return;
   arguments.callee.done = true;
   zselect.bindClienEvent();
   zselect.createElement();
  },
  bindClienEvent : function(){
   var selects = zselect.gets("select");
   var select = null;
   for(var i=0;i<selects.length;i++){
    select = selects[i];
    var selectrel = select.getAttribute("rel");
    if(selectrel != null && selectrel.toLowerCase() == "zselect"){
     zselect.addEvent(select,"onclick","click",zselect.shown);
    }
   }
   zselect.addEvent(document,"onclick","click",zselect.clearOptions);
   zselect.addEvent(document,"onkeydown","keydown",zselect.keyEvent);
  },
  createElement : function(){
   zselect.oc = document.createElement("div");
   zselect.ol = document.createElement("ul");
   zselect.ob = document.createElement("iframe");
   
   zselect.oc.className = "zselect";
   zselect.ob.frameBorder = "0";
   zselect.oc.appendChild(zselect.ol);
   zselect.oc.appendChild(zselect.ob);
  },
  gets : function(tn,pe){
   if(pe){
    return pe.getElementsByTagName(tn);
   }else{
    return document.getElementsByTagName(tn);
   }
  },
  addEvent : function(obj,eIE,eMoz,fn){
   if (document.addEventListener) {
    obj.addEventListener(eMoz,fn,false);
   }else{
    obj.attachEvent(eIE,fn);
   }
  },
  shown : function(e){
   if(zselect.IsShown) return;
   zselect.IsShown = true;
   if (window.event){e.cancelBubble=true;}else{e.stopPropagation();} 
   var select = e.target || window.event.srcElement;
   zselect.cs = select;
   var selectWidth = zselect.getStyle(select,"width");
   if(selectWidth == "auto")selectWidth = select.clientWidth;
   zselect.fillOption(select);
   zselect.oc.style.display = "block";
   zselect.oc.style.width = selectWidth;
   var point = zselect.getAbsPoint(select);
   zselect.oc.style.top = (point.y+select.clientHeight)+"px";
   zselect.oc.style.left = (point.x)+"px";
   zselect.insertElement(select,"afterEnd",zselect.oc);
   zselect.ob.style.height = zselect.oc.clientHeight+"px";
   zselect.oc.focus();
  },
  fillOption : function(select){
   var opts = zselect.gets("option",select);
   var opt = null;
   var li = null;
   zselect.ol.innerHTML = "";
   for(var i=0;i<opts.length;i++){
    opt = opts[i];
    li = document.createElement("li");
    li.innerHTML = opt.text;
    li.setAttribute("idx",i);
    if(!!opt.selected) li.className = "over";
    zselect.addEvent(li,"onclick","click",zselect.itemClick);
    zselect.addEvent(li,"onmouseover","mouseover",zselect.itemMouseOver);
    zselect.ol.appendChild(li);
   }
  },
  getStyle : function(obj,pn){
   var pv = "";
   if(obj.currentStyle){
    pv = obj.currentStyle[pn];
   }else if(window.getComputedStyle){
    pv = window.getComputedStyle(obj, null).getPropertyValue(pn);
   }
   return pv;
  },
  getAbsPoint : function(obj){
   var x = obj.offsetLeft;
   var y = obj.offsetTop;   
   while(obj=obj.offsetParent){
    x+=obj.offsetLeft;
    y+=obj.offsetTop;
   }
   return{"x":x,"y":y};
  },
  itemClick : function(e){
   var item = e.target || window.event.srcElement;
   var selectIdx = parseInt(item.getAttribute("idx"));
   if(selectIdx != zselect.cs.selectedIndex){
    zselect.cs.selectedIndex = selectIdx;
    if(zselect.cs.onchange)zselect.cs.onchange();
   }
   zselect.clearOptions();
  },
  itemMouseOver : function(e){
   var lis = zselect.ol.getElementsByTagName("li");
   for(var i=0;i<lis.length;i++){
    lis[i].className = "";
   }
   var li = e.target || window.event.srcElement;
   li.className = "over";
  },
  insertElement : function(b,w,n){ 
   switch(w){ 
    case "beforeBegin": 
     b.parentNode.insertBefore(n,b); 
     break; 
    case "afterBegin": 
     b.insertBefore(n,b.firstChild); 
     break; 
    case "beforeEnd": 
     b.appendChild(n); 
     break; 
    case "afterEnd": 
     if(b.nextSibling){
      b.parentNode.insertBefore(n,b.nextSibling); 
     }else{
      b.parentNode.appendChild(n); 
     }
    break; 
   }
  },
  keyEvent : function(e){
   var evt = e||event;
   if(evt.keyCode == 27) zselect.clearOptions();
  },
  clearOptions : function(){
   if(!zselect.IsShown) return;
   zselect.IsShown = false;
   zselect.cs.focus();
   zselect.cs = null;
   if(zselect.oc && zselect.oc.parentNode)
    zselect.oc.parentNode.removeChild(zselect.oc);
  }
 };
}
if (document.addEventListener) {
 document.addEventListener("DOMContentLoaded", zselect.init, false);
}else{
 document.attachEvent("onreadystatechange",function(){if (document.readyState=="complete"){zselect.init();}});
}
</script>
 </body>
</html>