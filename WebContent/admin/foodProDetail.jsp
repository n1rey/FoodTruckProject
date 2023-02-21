<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드 트럭 상세히 보기</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<% 
	String fno = request.getParameter("fno");
%>


<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="row">상호명</th>
        <th scope="row">위치</th>
        <th scope="row">영업시간</th>
      </tr>
    </thead>
		<tbody id="ajaxTable1">
	    </tbody>
    <thead>
      <tr>
        <th scope="row">메뉴</th>
        <th scope="row">가격</th>
      </tr>
    </thead>
	<tbody id="ajaxTable2">
    </tbody>
</table>
</div>

<input id="fno" type="hidden" value="<%=fno %>">
<div class="container">
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-danger" onclick="location.href='foodOneDel.jsp?fno='+<%=fno %>">승인 거절</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-warning" onclick="location.href='foodOneAdd.jsp?fno='+<%=fno %>">승인 허락</button>
			</div>
		</div>
	</div>
</div>

<script>
	function foodDetail() {
 		
 		$.ajax({
 			type:'post',
 			url:'foodOne.jsp?fno=' + '<%=fno%>',
 			success:function(data){
 				var foods = JSON.parse(data.trim());
 				var str = "";
 				
 				for(var i = 0; i < foods.length; i++){
 					var time = foods[i].ftime.split("&");
 					
 					str += "<tr><td>" + foods[i].fname + "</td>";
 					str += "<td>" + foods[i].flocation + "</td>";
					str += "<td>" + time[0] + " ~ " + time[1] + "</td></tr>";
 				} 
 				$("#ajaxTable1").html(str);
 				
 				var infos = JSON.parse(data.trim());
 				var str = "";
 				
 				for(var i = 0; i < foods.length; i++){
 					var fmenu = foods[i].fmenu.replace("[","").replace("]","");
 					var fprice = foods[i].fprice.replace("[","").replace("]","");
 					var menu = fmenu.split(",");
 					var price = fprice.split(",");
 					var keys1 = Object.keys(menu);
 					for (var i=0; i<keys1.length; i++) {
 				    	var key = keys1[i];
 						str += "<tr><td>" + menu[key] + "</td>";
 						str += "<td>" + price[key] + "</td></tr>";
 				    }
 				}
 				$("#ajaxTable2").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		foodDetail();
 	}
	
</script>
</body>
</html>