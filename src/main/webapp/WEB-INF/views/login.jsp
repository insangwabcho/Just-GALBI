<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Just GALBI - 로그인</title>

<!-- Bootstrap -->
<link href="resources/joinform/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="resources/joinform/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="resources/joinform/css/style.css" media="screen" title="no title" charset="utf-8">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <%@include file="include/header.jsp" %>
    <script>
      $(function(){
        $("#InputEmail").focus();
        $("#btnLogin").click(function(){
          if ($("#InputEmail").val() == ''){
            alert('아이디를 입력해주세요');
            return;
          }
          if ($("#InputPassword1").val() == ''){
            alert('비밀번호를 입력해주세요');
            return;
          }
          document.form1.submit();
        })
      })
    </script>
</head>
<body>
  <c:if test="${msg== 'error'}">
    <script>
      alert('아이디 또는 비밀번호가 올바르지 않습니다.');
      location.href="${path}/login.do";
    </script>
  </c:if>

  <article class="container" style="width: 70%; margin-top: 5%;">
    <div class="page-header">
      <h1>Just GALBI 로그인</h1>
    </div>
    <div class="col-md-6 col-md-offset-3">
      <form role="form" name="form1" method="post" action="${path}/member/login.do">
        <input type="hidden" name="num" value="<%=request.getParameter("num") %>">
        <div class="form-group">
          <label for="InputEmail">이메일</label> <input type="email" class="form-control" name="id"
            id="InputEmail" placeholder="email 주소">
        </div>
        <div class="form-group">
          <label for="InputPassword1">비밀번호</label> <input type="password" class="form-control" name= "password"
            id="InputPassword1" placeholder="비밀번호">
        </div>
        <div class="form-group text-center" style="margin-top: 15%;">
          <button class="btn btn-warning">아이디 찾기</button>
          <button class="btn btn-warning">비밀번호 찾기</button>
          <button type="button" class="btn btn-info" id="btnLogin">로그인<i class="fa fa-check spaceLeft"></i></button>
        </div>
      </form>
    </div>
  </article>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="resources/joinform/js/bootstrap.min.js"></script>
</body>
</html>
