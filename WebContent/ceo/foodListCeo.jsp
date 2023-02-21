<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/20

버전  기록 : 0.1(시작 23/02/20) 
          0.5(기본작업 23/02/20) 
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
				url  : '/admin/foodListAll.jsp',
				success : function(data){
					var foods = JSON.parse(data.trim());
					
					var str = "";
					for(var i = 0; i < foods.length; i++) {
						if ("<%=sid %>" == foods[i].id) {
						str += "<tr><td>" + foods[i].fno + "&nbsp;</td>";
	 					str += "<td><a href='/common/foodUpdate.jsp?fno="+ foods[i].fno +"'><small>(" + foods[i].fname + ")</small></a></td>";		
	 					str += "<td><small>&nbsp;(" + foods[i].flocation + ")</small></td></tr>";		
	 					str += "<tr><td colspan=3 height=40><hr></td></tr>";
						}
					} $("#ajaxTable").html(str);
					
				}
			});	
	 	}
	 	
	 	window.onload = function(){
			searchFunction();
		}
 	</script>
		<center><h2>푸드 트럭 목록</h2></center>
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