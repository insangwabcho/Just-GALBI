<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="resources/css/contextmenu.css?v1"/>
<!-- <div class="mainbanner">
  <img src="/image/mainbanner.png" alt="메인베너 자리" style="max-width: 100%; height: auto;">
</div> -->
<div class="login">
  <c:if test="${sessionScope.dto == null}">
    <button onclick="location.href='${path}/join.do'">회원가입</button>
    <button onclick="location.href='${path}/login.do'">로그인</button>
  </c:if>
  <c:if test="${sessionScope.dto != null}">
    <span class="memberData"><font color="#f0a050">${sessionScope.dto.name}</font>님 환영합니다.</span>
    <c:if test="${sessionScope.dto.property == 0}">
      <button onclick="location.href='${path}/#cart'">쇼핑카트</button>
      <button onclick="location.href='${path}/memberData.do'">나의정보</button>
    </c:if>
    <c:if test="${sessionScope.dto.property == 1}">
      <button onclick="location.href='${path}/admin/adminpage.do'">관리자페이지</button>
    </c:if>
    <button onclick="location.href='${path}/member/logout.do'">로그아웃</button>
  </c:if>
</div>
<div class="menubar">
  <ul>
    <li>
      <a href="#home">
        <img src="resources/image/justgalbi.png" style="width: 12%;" onclick="contextView('home')">
      </a>
    </li>
    <li>
      <a href="#introduce">
        <img src="resources/image/introduce.png" onmouseover="this.src='resources/image/introduce_over.png'"
          onmouseout="this.src='resources/image/introduce.png'" id="btn_introduce" style="margin-bottom: 4%;">
      </a>
    </li>
    <li>
      <a href="#order">
        <img src="resources/image/order.png" onmouseover="this.src='resources/image/order_over.png'"
          onmouseout="this.src='resources/image/order.png'" id="btn_order" style="margin-bottom: 4%;">
      </a>
    </li>
    <li>
      <a href="#faq">
        <img src="resources/image/faq.png" onmouseover="this.src='resources/image/faq_over.png'"
          onmouseout="this.src='resources/image/faq.png'" id="btn_faq" style="margin-bottom: 4%;">
      </a>
    </li>
    <li>
      <a href="#questions">
        <img src="resources/image/questions.png" onmouseover="this.src='resources/image/questions_over.png'"
          onmouseout="this.src='resources/image/questions.png'" id="btn_questions" style="margin-bottom: 4%;">
      </a>
    </li>
  </ul>
</div>