
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
<title>내 리뷰 목록</title>
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

<!-- 함수 -->
<script>
function getOrderInfo(order) {
	  var modalBody = document.querySelector(".modal-body");
	  modalBody.innerHTML = "주문가게명: " + order.fname + "<br>주문자: " + order.id + "<br>주문확인: " + order.fpro + "<br>주문한 메뉴: " + order.fmenu + "<br>합계: " + order.fprice;
	}


	function listFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'myReviewAll.jsp',
 			success:function(data){
 				var myReviews = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < myReviews.length; i++){
 					
 					str += "<tr><td> 주문가게명:" + myReviews[i].fname +"주문자"+ myReviews[i].id + "</td>";
 					str += "<td> 주문확인:" + myReviews[i].fpro + "</td>";
 					str += "<td> 주문한 메뉴:" + myReviews[i].fmenu + "</td>";
 					str += "<td><button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='getOrderInfo(" + JSON.stringify(myReviews[i]) + ")'>리뷰 상세보기</button></td></tr>";

 				    
 				    
 				} $("#ajaxTable").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		listFunction();
 	}

</script>

	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 상세보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  "내용표시"
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" href="myorder.jsp">리뷰 수정</button>
        <button type="button" class="btn btn-danger" href="#">삭제</button>
      </div>
    </div>
  </div>
</div>

</body>