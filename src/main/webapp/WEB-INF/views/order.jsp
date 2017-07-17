<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp" %>
<style>
td img {
  max-width: 400px;
  max-height: 200px;
  width: 100%;
  height: 100%;
  vertical-align: middle;
}
#productList tr{
  border-spacing: 30%;
}
a:link{
  text-decoration: none;
  color: gray;
}
a:visited{
  text-decoration: none;
  color: gray;
}
a:active{
  text-decoration: none;
  color: gray;
}
a:hover {
  text-decoration: none;
  color: green;
}
</style>
</head>
<body>

<div class="contextTitle">
  <img src="resources/image/orderpage.png" style="width: 20%;"> 
</div>

<div style="width: 100%; margin-top: 5%;"> <!-- 상품리스트 -->
  <!-- <table> -->
  <c:set var="cols" value="0"/>
  <c:set var="aCount" value="${fn:length(items)/4}"/>
  <c:if test="${aCount % 1 != 0 || aCount > 9999999999}">
    <c:set var="aCount" value="${aCount+1}"/>
  </c:if>
  <form name="form1" method="post">
    <table style="width: 100%; text-align: center;">
      <%-- <c:forEach var="item" items="${items}"> --%>
      <c:forEach begin="1" end="${aCount}">
        <tr>
          <c:forEach var="col" begin="${cols}" end="${cols+3}">
            <td>
              <table style="width: 100%; text-align: center; margin:5%; padding: 5%;" id="productList">
                <tr>
                  <c:if test="${items[col].img_url != null}">
                    <td>
                      <a href="#detail/${items[col].num}">
                        <img src="resources/image/uploads/${items[col].img_url}">
                      </a>
                    </td>
                  </c:if>
                </tr>
                <tr>
                  <td style="padding-top: 10%; padding-bottom: 5%;">
                    <a href="#">${items[col].name}</a>
                  </td>
                </tr>
                <tr>
                  <td style="font-size: 15px;">
                    <font color="gray">
                      <fmt:formatNumber value="${items[col].price}" pattern="#,###"/>
                      <c:if test="${items[col] != null}">
                        ₩
                      </c:if>
                    </font>
                  </td>
                </tr>
              </table>
            </td>
          </c:forEach>
          <c:set var="cols" value="${cols+4}"/>
        </tr>
      </c:forEach>
    </table>
  </form>
  <!-- </table> -->
</div>

</body>
</html>