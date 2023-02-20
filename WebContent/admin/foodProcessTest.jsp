<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/17

버전  기록 : 0.1(시작 23/02/17) 
          0.5(기본작업 23/02/17) 
          0.7(추가 디자인 23/02/20)
          1.0(1차 완성 23/02/20)
 -->
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Talk</title>
</head>
<body>
<%@ include file = "/header.jsp" %>
	<div class="container shadow mx-auto p-5 w-75">
	<!-- container 화면 전체를 차지하지 않는 고정 크기 컨테이너, 
				      브라우저의 크기에 반응하여  자동으로 크기가 변동됨
		 bg-warning bg는 배경 warning은 노란색		      
		 shadow		입체감 있게 그림자 효과 추가
		 mx-auto	m 바깥여백 x 가로로 auto 화면 가운데 정렬
		 p			padding 안쪽 여백
		 w			전체 너비
    -->
    
    <script>
	 	function addFood(fno) {
	 		$.ajax({
	 			type:"post",
	 			url: "foodAdd.jsp",
	 			data : {fno:fno
	 				   
	 			},
	 			dataType:"text",
	 			
	 			success:function(data) {
					searchFunction();
	 			}
	 		});
	 	}
 		
	 	function delFood(fno) {
	 		$.ajax({
	 			type:"post",
	 			url: "foodDel.jsp",
	 			data : {fno:fno
	 				
	 			},
	 			dataType:"text",
	 			
	 			success:function(data) {
	 				searchFunction();
	 			}
	 		});
	 	}
	 	
	 	function searchFunction(){
	 		$.ajax({
				type : 'post',
				url  : 'foodAll.jsp',
				success : function(data){
					var foods = JSON.parse(data.trim());
					
					var str = "";
					for(var i = 0; i < foods.length; i++) {
						str += "<tr><td>" + foods[i].fno + "&nbsp;</td>";
	 					str += "<td><a href='foodDetail.jsp?fno="+ foods[i].id +"'><small>(" + foods[i].fname + ")</small></a></td>";		
	 					str += "<td><small>&nbsp;(" + foods[i].flocation + ")</small></td>";		
	 					
 						str += "<td><div onclick='delFood(\"" + foods[i].fno + "\")'><span class='btn btn-danger'>Reject</span></div></td>";
 						str += "<td><div onclick='addFood(\"" + foods[i].fno + "\")'><span class='btn btn-primary'>Accept</span></div></td>";
	 					
	 					str += "</tr>";
	 					str += "<tr><td colspan=4 height=40><hr></td></tr>";
					} $("#ajaxTable").html(str);
					
				}
			});	
	 	}
	 	
	 	window.onload = function(){
			searchFunction();
		}
 	</script>
		<center><h2>푸드 트럭 승인 신청 목록</h2></center>
		<div>
			<div class="input-group justify-content-center" >
			
			</div>
			<hr>
			<table align="center" width="400">
				<thead>
				</thead>
				<tbody id="ajaxTable">
				
				</tbody>	
			</table>
		</div>
	</div>

</body>
</html>