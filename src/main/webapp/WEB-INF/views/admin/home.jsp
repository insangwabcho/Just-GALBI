<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Just - GALBI</title>
<%@ include file="../include/header.jsp" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
</head>
<body>
<script type='text/javascript'>
var img_L = 0;
var img_T = 0;
var targetObj;

function getLeft(o){
     return parseInt(o.style.left.replace('px', ''));
}
function getTop(o){
     return parseInt(o.style.top.replace('px', ''));
}

// 이미지 움직이기
function moveDrag(e){
     var e_obj = window.event? window.event : e;
     var dmvx = parseInt(e_obj.clientX + img_L);
     var dmvy = parseInt(e_obj.clientY + img_T);
     targetObj.style.left = dmvx +"px";
     targetObj.style.top = dmvy +"px";
     return false;
}

// 드래그 시작
function startDrag(e, obj){
     targetObj = obj;
     var e_obj = window.event? window.event : e;
     img_L = getLeft(obj) - e_obj.clientX;
     img_T = getTop(obj) - e_obj.clientY;

     document.onmousemove = moveDrag;
     document.onmouseup = stopDrag;
     if(e_obj.preventDefault)e_obj.preventDefault(); 
}

// 드래그 멈추기
function stopDrag(){
     document.onmousemove = null;
     document.onmouseup = null;
}
//이미지 크기 조절
function resize_Image()
{
    resize_X=event.x;
    resize_Y=event.y;
    event.srcElement.width=resize_X;
    event.srcElement.height=resize_Y;
}
</script>
</script>
</body>
<div style='position:absolute; left:0px; top:0px; cursor:pointer; cursor:hand' onmousedown='startDrag(event, this)'>
    <table bgcolor="#0000FF"><tr><td>
        <font color="#FFFFFF">하하하</font>
    </td></tr></table>
</div>
<div id="imgMain">
<img src="${path}/resources/image/home_galbimain2.png" width="150" 
  style="position:absolute; left:0px; top:50px; cursor:pointer; cursor:hand" 
  onmousedown="startDrag(event, this)"  border="0">
</div>

</html>

