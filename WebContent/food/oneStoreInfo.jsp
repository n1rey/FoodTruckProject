<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>검색</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<% 
	String fno = request.getParameter("fno");
	//sid = (String) session.getAttribute("id");
	sid = "min";//임시
%>
<div class="container-xxl py-5 bg-dark hero-header mb-5">
             <div class="container text-center my-5 pt-5 pb-4">
                 <h1 class="display-3 text-white mb-3 animated slideInDown">가게</h1>
                 <nav aria-label="breadcrumb">
                     <ol class="breadcrumb justify-content-center text-uppercase">
                         <li class="breadcrumb-item"><a href="#">Home</a></li>
                         <li class="breadcrumb-item"><a href="#">Pages</a></li>
                         <li class="breadcrumb-item text-white active" aria-current="page">Menu</li>
                     </ol>
                 </nav>
             </div>
         </div>
     </div>
     <!-- Navbar & Hero End -->


<!-- Menu Start -->
<div class="container-xxl py-5">
    <div class="container">
    	<!-- 가게명 -->
        <div id="fname" class="text-center wow fadeInUp" data-wow-delay="0.1s">
        </div>
        
        <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
            <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill">
                        <i class="fa fa-hamburger fa-2x text-primary"></i>
                        <div class="ps-3">
                            <small class="text-body">Special</small>
                            <h6 class="mt-n1 mb-0">Menu</h6>
                        </div>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
            	<!-- 메뉴, 가격 -->
                <div id="menu" class="tab-pane fade show p-0 active">
                    
                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="col-12">
            <div class="row g-4">
                <div class="col-md-2">
                </div>
                <!-- 위치 -->
                <div class="col-md-5" id="flocation">
                </div>
                <!-- 영업시간 -->
                <div class="col-md-5" id="ftime">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Menu End -->
        
        


<input id="fno" type="hidden" value="<%=fno %>">
<div class="container">
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button class="btn btn-primary w-100 py-3" type="button" onclick="location.href='order.jsp?fno='+<%=fno %>">포장하기</button>
			</div>
			<div class="col">
				<button class="btn btn-primary w-100 py-3" type="button" onclick="location.href='review.jsp?fno='+<%=fno %>">리뷰쓰기</button>
			</div>
		</div>
	</div>
</div>

<!-- 함수 -->
<script>
	function storeInfoListFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'oneStoreInfoAll.jsp?fno='+document.getElementById('fno').value,
 			success:function(data){
 				var infos = JSON.parse(data.trim());
 				var str = "";
				str += "<h5 class='section-title ff-secondary text-center text-primary fw-normal'>Food Menu</h5>";
				str += "<h1 class='mb-5'>"+infos[0].fname+"</h1>";
 				$("#fname").html(str);
 				
 				var str = "";
				str += "<h5 class='section-title ff-secondary text-start text-primary fw-normal'>Location</h5>";
				str += "<p>"+infos[0].flocation+"</p>";
 				$("#flocation").html(str);
 				
 				var str = "";
 				str += "<h5 class='section-title ff-secondary text-start text-primary fw-normal'>Open Hours</h5>";
				str += "<p>"+infos[0].ftime+"</p>";
 				$("#ftime").html(str);
 				
 				var str = "";
 				for(var i = 0; i < infos.length; i++){
 					var fmenu = infos[i].fmenu.replace("[","").replace("]","");
 					var fprice = infos[i].fprice.replace("[","").replace("]","");
 					var menu = fmenu.split(",");
 					var price = fprice.split(",");
 					var keys1 = Object.keys(menu);
 					for (var i=0; i<keys1.length; i++) {
 				    	var key = keys1[i];
 						str += "<div class='row g-4'>";
 						str +=     "<div class='col-lg'>";
 						str +=         "<div class='d-flex align-items-center'>";
 						str +=             "<div class='w-100 d-flex flex-column text-start ps-4'>";
 						str +=                 "<h5 class='d-flex justify-content-between border-bottom pb-2'>";
 						str +=                     "<span>"+menu[key]+"</span>";
 						str +=                     "<span class='text-primary'>"+price[key]+"</span>";
 						str +=                 "</h5>";
 						str +=             "</div>";
 						str +=         "</div>";
 						str +=     "</div>";
 						str += "</div>";
                    
 				    }
 				}
 				$("#menu").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		storeInfoListFunction();
 	}
	
</script>
<%@ include file="../footer.jsp"%>        
</body>

</html>