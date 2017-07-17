<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
  document.location.href=document.location.href.split('#')[0]+'#main';
})
$(window).bind('hashchange',function(){
  var hash= document.location.hash.split("#")[1];
  if (hash.indexOf("detail?")!= -1){
    var param= "num="+hash.split("?")[1];
  	$.ajax({
  	  url: "${path}/admin/order.do",
  	  data: param,
  	  success: function(result){
  	    $("#editPage").html(result);
  	    $("body").scrollTop(0);
  	  }
  	})  
  }
})
function adminView(asdf){
  $.ajax({
    url: "${path}/admin/"+asdf+".do",
    success: function(result){
      $("#editPage").html(result);
      $("body").scrollTop(0);
    }
  })
}
</script>
<style>
ul li {
  padding: 1%;
  margin: 1%;
  display: inline;
}
</style>
</head>
<body>
<c:if test="${sessionScope.dto == null}">
  <script>
  location.href="${path}/main.do";
  </script>
</c:if>
<h2>관리자 페이지</h2>
<input type="button" value="메인페이지로" onclick="location.href='${path}/'">
<ul>
  <li><button onclick="adminView('home')">홈</button></li>
  <li><button onclick="adminView('introduce')">소개</button></li>
  <li><button onclick="adminView('order')">주문</button></li>
  <li><button onclick="adminView('faq')">faq</button></li>
  <li><button onclick="adminView('questions')">문의</button></li>
</ul>
<div id="editPage"></div>
</body>
</html>