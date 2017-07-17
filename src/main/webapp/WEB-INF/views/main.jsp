<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Just GALBI</title>
<%@ include file="include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="resources/css/main.css" />
<style>
#my-spinner {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	display: none;
	opacity: .6;
	background: silver;
	position: fixed;
}

#my-spinner div {
	width: 100%;
	height: 100%;
	display: table;
}

#my-spinner span {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

#my-spinner img {
	background: white;
	padding: 1em;
	border-radius: .7em;
}
</style>
<script>
var backPageHash;
$(window).bind('hashchange',function(){
  var hash= document.location.hash.split('#')[1];
    if (hash.indexOf('detail/')!= -1){
      var prodnum= hash.split('/')[1];
      orderDetailView(prodnum);
    } else if(hash.indexOf('del?')!= -1){
      if (confirm("상품을 삭제하시겠습니까?")){
        var prodnum= hash.split('?')[1];
        orderCartView(prodnum, 'del');
      }
    } else if (hash.indexOf('mod?')!= -1) {
      if (confirm("상품수량을 수정하시겠습니까?")){
        var prodnum= hash.split('?')[1];
        orderCartView(prodnum, 'mod');
      }
    } else {
      contextView(hash);
      backPageHash= document.location.hash.split('#')[1];
    }
})

$(document)
.ajaxStart(function () {
	$('#my-spinner').show();
})
.ajaxStop(function () {
	$('#my-spinner').hide();
});

$(function(){

  var hash= document.location.hash.split('#')[1];
  if (hash == 'cart'){
    contextView('cart');
  }
  
  var pause= "${sessionScope.pause}";
  var addCart= "${sessionScope.addCart}";
  <% request.getSession().removeAttribute("pause"); %>
  <% request.getSession().removeAttribute("addCart"); %>
  console.log("pause:"+pause);
  if (pause==""){
    $.ajax({
      url: "${path}/home.do",
      success: function(result){
        $("#context").html(result);
        document.location.href=document.location.href.split('#')[0]+'#main';
      }
    })
  } else {
    contextView('order');
  }
});

function contextView(select){
  $.ajax({
    url: "${path}/"+select+".do",
    success: function(result){
      $("#context").html(result);
    }
  });
}
function orderDetailView(select){
  $.ajax({
    url: "${path}/order/"+select,
    success: function(result){
      $("#context").html(result);
    }
  });
}
function orderCartView(select, action){
  var param;
  var url= "${path}/order/";
  if (action=='del'){
    url= url+"delCart.do";
    param= "cart_id="+select;
  } else if (action=='mod'){
    url= url+"modCart.do";
    param= "cart_id="+select.split("&")[0]+"&amount="+select.split("&")[1];
  }
  $.ajax({
    url: url,
   	data: param,
   	success: function(result){
   	  $("#context").html(result);
   	}
  })
}
</script>
</head>
<body>
  <div class="container" style="margin-left: 10%; margin-right: 10%;">
    <%@ include file="include/contextmenu.jsp"%>
    <div class="context" id="context" style="margin-left: 5%; margin-right: 5%;">
      <div id='my-spinner'>
        <div>
          <span> <img src='resources/image/loader.gif'>
          </span>
        </div>
      </div>
    </div>
  </div>
</body>
</html>