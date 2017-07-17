<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp"%>
<link rel="stylesheet" href="resources/css/order_detail.css?v2"/>
</head>
<style>
.prodDetail{
  margin-left: 5%;
  margin-top: 10%;
  margin-right: 5%;
  margin-bottom: 10%;
}
</style>
<body>

  <c:if test="${sessionScope.dto == null}">
    <script>
    $(function(){
      $("#btnAddCart").click(function(){
        alert("로그인 후 이용 가능합니다");
        document.form1.action= "${path}/login.do";
        document.form1.submit();
      })
    });
    </script>
  </c:if>
  <c:if test="${sessionScope.dto != null}">
    <script>
    $(function(){
      $("#btnAddCart").click(function(){
        if (confirm("쇼핑카트를 확인하시겠습니까?")){
          document.form1.action= "${path}/order/addCart.do?goCart=1";
        } else {
          document.form1.action= "${path}/order/addCart.do?goCart=0";
        }
          document.form1.method= "post";
          document.form1.submit();
      })
    });
    </script>
  </c:if>

  <div style="width: 100%; margin-top: 5%; margin-left: 10%; margin-bottom: 5%;">
    <table style="width: 100%;">
      <tr>
        <td style="width: 55%;"><img src="resources/image/uploads/${dto.img_url}" id="bigImage"></td>
        <td style="width: 45%;">
          <form name="form1">
            <table class="prodInfo" style="width: 100%;">
              <tr>
                <td colspan="2" class="prodTxt">
                  ${dto.name}
                  <input type="hidden" name="num" value="${dto.num}">
                </td>
              </tr>
              <tr>
                <td style="color: gray;" colspan="2" class="prodTxt">
                    <fmt:formatNumber value="${dto.price}" pattern="#,###" />
                    ₩
                </td>
              </tr>
              <tr>
                <td class="prodTxt">수량<br>
                  <input type="number" id= "amount" name="amount" value="1" min="1">
                  <input type="hidden" name="list_id" value="${dto.num}">
                  <input type="hidden" name="user_id" value="${sessionScope.dto.id}">
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <button class="btn-primary prodTxt" style="width: 50%; height: 200%;" id="btnAddCart">카트에 추가</button>
                </td>
              </tr>
              <tr>
                <td>
                  <h3>주문시 유의사항</h3>
                  ${dto.notice}
                </td>
              </tr>
          </table>
          </form>
        </td>
      </tr>
    </table>
  </div>
  <hr style="border: 0.5px solid #DDDDDD">
  <div class="prodDetail">
    <span style="text-align: center; color: #4bA7F6"><h3>세부정보</h3></span><br>
    <div class="prodDetailContent">
      ${dto.details}
    </div>
  </div>

</body>
</html>