<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
function product_write(){
  var name = document.form1.name.value;
  var price = document.form1.price.value;
  var details = document.form1.details.value;
  var notice= document.form1.notice.value;
  console.log("name:"+name+",price:"+price+",details:"+details+",notice:"+notice);
  if (name == "") {
    alert("상품명을 입력하세요.");
    document.form1.name.focus();
    return;
  }
  if (price == "") {
    alert("가격을 입력하세요.");
    document.form1.price.focus();
    return;
  }
  if (details == "") {
    alert("상품설명을 입력하세요.");
    document.form1.details.focus();
    return;
  }
  if (notice == ""){
    alert("제품 공지사항을 입력하세요.");
    docuent.form1.notice.focus();
    return;
  }
  document.form1.action="${path}/admin/addList.do";
  document.form1.submit();
}
function product_modify(){
  var name= document.form1.name.value;
  var price= document.form1.price.value;
  var details= document.form1.details.value;
  var notice= document.form1.notice.value;
  if (name== ""){
    alert("상품명을 입력하세요.");
    document.form1.name.focus();
    return;
  }
  if (price== "") {
    alert("가격을 입력하세요.");
    document.form1.price.focus();
    return;
  }
  if (details== "") {
    alert("상품명을 입력하세요.");
    document.form1.details.focus();
    return;
  }
  if (notice== ""){
    alert("제품 공지사항을 입력하세요.");
    document.form1.notice.focus();
    return;
  }
  document.form1.action="${path}/admin/modifyList.do";
  document.form1.submit();
}
function del(num){
  if (confirm("삭제하시겠습니까?")){
    location.href='${path}/admin/deleteList.do?num='+num;
  }
}
</script>
</head>
<body>
<h2>상품 등록</h2>
  <!-- 첨부파일을 보낼 때 : method="post" enctype="multipart/form-data" -->
  <form id="form1" name="form1" method="post" enctype="multipart/form-data" action="${path}/admin/addList.do">
    <table>
      <tr>
        <td>상품명</td>
        <c:if test="${detail==null}">
          <td><input id="name" name="name"></td>
        </c:if>
        <c:if test="${detail!= null}">
          <td><input id="name" name="name" value="${detail.name}"></td>
        </c:if>
      </tr>
      <tr>
        <td>가격</td>
        <c:if test="${detail==null}">
          <td><input id="price" name="price"></td>
        </c:if>
        <c:if test="${detail!=null}">
          <td><input id="price" name="price" value="${detail.price}"></td>
        </c:if>
      </tr>
      <tr>
        <td>상품 공지사항</td>
        <c:if test="${detail==null}">
          <td><textarea rows="5" cols="60" name="notice" id="notice"></textarea></td>
        </c:if>
        <c:if test="${detail!=null}">
          <td><textarea rows="5" cols="60" name="notice" id="notice">${detail.notice}</textarea></td>
        </c:if>
      </tr>
      <tr>
        <td>상품설명</td>
        <c:if test="${detail==null}">
          <td><textarea rows="5" cols="60" name="details" id="details"></textarea></td>
        </c:if>
        <c:if test="${detail!=null}">
          <td><textarea rows="5" cols="60" name="details" id="details">${detail.details}</textarea></td>
        </c:if>
      </tr>
      <c:if test="${detail!=null}">
        <td>등록된 이미지</td>
        <td><img src="${path}/resources/image/uploads/${detail.img_url}" width="200px" height="150px"></td>
      </c:if>
      <tr>
        <c:if test="${detail== null}">
          <td>상품이미지</td>
        </c:if>
        <c:if test="${detail!= null}">
          <td>새로등록할 이미지</td>
        </c:if>
        <td><input type="file" name="file1" multiple="multiple"></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <c:if test="${detail==null}">
            <input type="button" id="btnSubmit" value="신규물품 등록" onclick="product_write()">
          </c:if>
          <c:if test="${detail!=null}">
            <input type="hidden" name="num" value="${detail.num}">
            <input type="button" id="btnSubmit" value="물품정보 수정" onclick="product_modify()">
            <input type="button" id="btnReset" value="초기화(신규물품등록)" onclick="adminView('order')">
          </c:if>
        </td>
      </tr>
    </table>
  </form>
  <hr>
  <!-- 상품목록 -->
  <h2>상품목록</h2>
  <table border="1">
    <tr>
      <th>상품번호</th>
      <th>상품사진</th>
      <th>상품이름</th>
      <th>상품삭제</th>
    </tr>
    <c:forEach var="row" items="${items}">
      <tr>
        <td>
          ${row.num}
        </td>
        <td>
          <img src="${path}/resources/image/uploads/${row.img_url}" style="width: 200px; height: 200px;">
        </td>
        <td>
          <a href="#detail?${row.num}">${row.name}</a>
        </td>
        <td>
          <input type="button" value="상품삭제" onclick="del('${row.num}')">
        </td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>