<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/16

버전 기록 : 0.1(시작 23/02/16) -데이터만 가져옴 디자인은 이후에 해야함.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<%request.setCharacterEncoding("utf-8"); %>
<!-- 함수 -->
<script>

	function listFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'myOrderAll.jsp',
 			success:function(data){
 				var orders = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < orders.length; i++){
 					
 					str += "<tr><td> 주문가게명:" + orders[i].fname +"주문자"+ orders[i].id + "</td>";
 					str += "<td> 주문확인:" + orders[i].opro + "</td>";
 					str += "<td> 주문한 메뉴:" + orders[i].fmenu + "</td>";
 					str += "<td> 합계:" +orders[i].fprice +"</td></tr>";
 				    
 				    
 				} $("#ajaxTable").html(str);
 			},
 			 error : function(request, status, error) { // 결과 에러 콜백함수
 		        console.log(error)
 		    }
 		});
 	}
	
	window.onload = function() {
		listFunction();
 	}
	
</script>

<title>내 주문 목록</title>
</head>
<body>


<!-- 주문 목록 -->
<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">가게 이름</th>
        <th scope="col">o주문확인</th>
        <th scope="col">f메뉴</th>
        <th scope="col">f가격</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>


</body>
</html>