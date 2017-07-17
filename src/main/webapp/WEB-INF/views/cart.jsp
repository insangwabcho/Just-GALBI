<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp" %>
</head>
<style>
.cartTitle{
  color: gray;
  margin-top: 5%;
  margin-left: 5%;
}
hr {
  margin: 4%;
  border: 0.5px solid #DDDDDD;
}
.cartListView {
  margin-top: 7%;
  margin-left: 5%;
}
.bigImage {
  max-width: 100px;
  max-height: 100px;
  width: 100%;
  height: 100%;
}
.cartTable tr td{
  padding: 3%;
}
.cartTR td{
  border-bottom: 1px solid #DDDDDD;
}
.cartTitleTR td {
  
}
</style>
<script>
function showmodInput(select){
  var aa= "modInput"+select;
  var bb= "amountNum"+select;
  var cc= "defaultAmount"+select;
  var btn= document.getElementById(aa);
  var amountVal= document.getElementById(bb).value;
  var defAmount= document.getElementById(cc).value;
  if (amountVal == defAmount){
    btn.style.visibility="hidden";
  } else {
    btn.style.visibility="visible";
  }
}
function modAmount(select){
  location.href="#mod?"+select+"&"+document.getElementById("amountNum"+select).value;
}
</script>
<body>
<div class="cartTitle">
  <h2>내 쇼핑카트 (${listCart.size()})</h2>
</div>
<div class="cartListView">
  <c:if test="${listCart.size() == 0}">
    <h2>장바구니가 비어있습니다.</h2>
  </c:if>
  <c:if test="${listCart.size() != 0}">
    <table style="width:100%;" class="cartTable">
    <tr>
      <td>제품</td>
      <td>선택 상품</td>
      <td>수량</td>
      <td>금액</td>
      <td>&nbsp;</td>
    </tr>
      <c:forEach var="rows" items="${listCart}">
        <tr class="cartTR">
          <td style="width: 25%;"><img src="resources/image/uploads/${rows.img_url}" class="bigImage"></td>
          <td style="width: 30%;">${rows.list_name}<br>${rows.price} ₩</td>
          <td style="width: 10%;">
            <input type="number"min="1" value="${rows.amount}" style="width: 40px;" onchange="showmodInput('${rows.cart_id}')"
              id="amountNum${rows.cart_id}">
            <%-- <a href="#mod?${rows.cart_id}"> --%>
              <input type="button" id="modInput${rows.cart_id}" style="visibility: hidden;" value="수정" 
                onclick="modAmount('${rows.cart_id}')">
            <!-- </a> -->
            <input type="hidden" id="defaultAmount${rows.cart_id}" value="${rows.amount}">
          </td>
          <td style="width: 20%;">
            ₩ <fmt:formatNumber value="${rows.money}" pattern="#,###,###,###"/>
          </td>
          <td style="width: 15%;">
            <a href="#del?${rows.cart_id}">
              <button id="btnDelete">상품삭제</button>
            </a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </c:if>
</div>
<div class="cartTitle" style="padding-bottom: 10%;">
  <span style="float: right">
    총 결제금액 : <font color="#E6749D">₩ <fmt:formatNumber value="${sumMoney}" pattern="#,###,###,###"/></font>
  </span>
</div>
</body>
</html>