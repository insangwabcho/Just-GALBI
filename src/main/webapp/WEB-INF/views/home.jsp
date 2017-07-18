<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp" %>
</head>
<body>
<c:if test="${sessionScope.pause != null}">
  <script>
  	var num= ${sessionScope.pause};
  	<% request.getSession().removeAttribute("pause"); %>
  	orderDetailView(num);
  </script>
</c:if>

<div style="margin-left:15%; margin-right: 15%;">
  <span><h2>테이크아웃으로 매일매일 먹고싶을때마다 만나는 신선한 갈비!</h2></span>
  <img src="resources/image/home_galbimain2.png" style="width: 100%;">
</div>


</body>
</html>