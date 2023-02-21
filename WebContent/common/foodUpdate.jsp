<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/16

버전  기록 : 0.1(시작 23/02/16) 
          0.5(기본작업 23/02/16) 
          0.7(추가 디자인 23/02/17)
          1.0(1차 완성 23/02/20)
 -->
<!-- 로그인 되면 sid로 변경 / 처음에 삭제 버튼 안 눌리는 것 해결-->
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>푸드 트럭 정보 수정</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      .body {
      	display : flex;
      }
    </style>

  </head>
  <body class="bg-light">
<%@ include file = "/header.jsp" %>   
<%
	String fno = request.getParameter("fno");

	ArrayList<foodDTO> foods = foodDAO.getDetail(fno);
	
	for (foodDTO food : foods) {
		
		String fmenu = food.getFmenu().replace("[", "").replace("]", "");
		String menu[] = fmenu.split(",");
		
		String fprice = food.getFprice().replace("[", "").replace("]", "");
		String price[] = fprice.split(",");
		String menus = "";
		
		for(int i=0; i < menu.length ; i++) {
			menus += "<div class='input-group has-validation'>";
			menus += "<input type='text' class='form-control' value='" + menu[i].trim() + "' name='fmenu' id='menu' placeholder='메뉴'>";
			menus += "<input type='text' class='form-control' value='" + price[i].trim() + "' name='fprice' id='price' placeholder='가격'>";
			if(i == 0) {
				menus += "<button type='button' class='btn btn-primary' onclick='add();'>추가</button></div>";
			} else {
				menus += "<button type='button' class='btn btn-danger btnRemove'>삭제</button></div>";
			}
		}
		
		String time[] = food.getFtime().split("&");
		
		
		
%>
<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="../etc/car3.png" alt="" width="72" height="57">
      <h2>푸드 트럭 수정</h2>
    </div>

    <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3 text-center">푸드 트럭 정보 수정</h4><br>
        <form class="needs-validation" action="foodUpdateCheck.jsp" method="post" enctype="multipart/form-data">
          <div class="row g-3">
            <div class="col-12">
              <label class="form-label">가게명</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="fname" value="<%=food.getFname() %>" required>
              </div>
            </div>
            
            <div class="col-8">
              <label class="form-label">사진</label>
              <div class="input-group has-validation">
                <input type="file" class="form-control" name="fphoto" required>
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">위치</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="flocation" value="<%=food.getFlocation()%>" required>
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">위도</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="flat" value="<%=food.getFlat()%>" required>
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">경도</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="flon" value="<%=food.getFlon()%>" required>
              </div>
            </div>

            <div class="col-12">
              <label class="form-label">영업 시간</label>
              <div class="row">
	              <div class="col-md-2">
		              <select class="form-select" name="time1">
		              	<option value="오전" <%=time[0].contains("오전") ? "selected" : ""%>>오전</option>
		              	<option value="오후" <%=time[0].contains("오후") ? "selected" : ""%>>오후</option>
		              </select>
		          </div>    
		          <div class="col-md-2">    
		              <select class="form-select" name="time2">
		              	<option value="1시" <%=time[0].contains("1") ? "selected" : ""%>>1시</option>
		              	<option value="2시" <%=time[0].contains("2") ? "selected" : ""%>>2시</option>
		              	<option value="3시" <%=time[0].contains("3") ? "selected" : ""%>>3시</option>
		              	<option value="4시" <%=time[0].contains("4") ? "selected" : ""%>>4시</option>
		              	<option value="5시" <%=time[0].contains("5") ? "selected" : ""%>>5시</option>
		              	<option value="6시" <%=time[0].contains("6") ? "selected" : ""%>>6시</option>
		              	<option value="7시" <%=time[0].contains("7") ? "selected" : ""%>>7시</option>
		              	<option value="8시" <%=time[0].contains("8") ? "selected" : ""%>>8시</option>
		              	<option value="9시" <%=time[0].contains("9") ? "selected" : ""%>>9시</option>
		              	<option value="10시" <%=time[0].contains("10") ? "selected" : ""%>>10시</option>
		              	<option value="11시" <%=time[0].contains("11") ? "selected" : ""%>>11시</option>
		              	<option value="12시" <%=time[0].contains("12") ? "selected" : ""%>>12시</option>
		              </select>
		          </div>    
	              <div class="col-md-1">
		              <span class="input-group-text">&nbsp~</span>
		          </div>    
	              <div class="col-md-2">
		              <select class="form-select" name="time3">
		              	<option value="오전" <%=time[1].contains("오전") ? "selected" : ""%>>오전</option>
		              	<option value="오후" <%=time[1].contains("오후") ? "selected" : ""%>>오후</option>
		              </select>
		          </div>    
		          <div class="col-md-2">    
		              <select class="form-select" name="time4">
		              	<option value="1시" <%=time[1].contains("1") ? "selected" : ""%>>1시</option>
		              	<option value="2시" <%=time[1].contains("2") ? "selected" : ""%>>2시</option>
		              	<option value="3시" <%=time[1].contains("3") ? "selected" : ""%>>3시</option>
		              	<option value="4시" <%=time[1].contains("4") ? "selected" : ""%>>4시</option>
		              	<option value="5시" <%=time[1].contains("5") ? "selected" : ""%>>5시</option>
		              	<option value="6시" <%=time[1].contains("6") ? "selected" : ""%>>6시</option>
		              	<option value="7시" <%=time[1].contains("7") ? "selected" : ""%>>7시</option>
		              	<option value="8시" <%=time[1].contains("8") ? "selected" : ""%>>8시</option>
		              	<option value="9시" <%=time[1].contains("9") ? "selected" : ""%>>9시</option>
		              	<option value="10시" <%=time[1].contains("10") ? "selected" : ""%>>10시</option>
		              	<option value="11시" <%=time[1].contains("11") ? "selected" : ""%>>11시</option>
		              	<option value="12시" <%=time[1].contains("12") ? "selected" : ""%>>12시</option>
		              </select>
		          </div>    
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-8 addInput" >
              <label class="form-label">메뉴 & 가격</label> 
              <div class="input-group has-validation">
<!--                 <input type="text" class="form-control" name="fmenu" id="menu" placeholder="메뉴" required> -->
<!--                 <input type="text" class="form-control" name="fprice" id="price" placeholder="가격" required> -->
<!--                 <button type="button" class="btn btn-info btnAdd" onclick="add();">추가</button> -->
              </div>
              <%=menus %>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

          <hr class="my-4"> 
		  <input type="hidden" name="fno" value="<%=food.getFno()%>">
		  <div class="row justify-content-center">
			  <div class="col-3">
	          	<button class="w-100 btn btn-warning btn-lg" type="submit">수정</button>
	          </div>	
	          <div class="col-3">
	          	<input type="button" class="w-100 btn btn-danger btn-lg" onclick="del('<%=food.getFno() %>');" value="삭제">
	          </div>	
          </div>	
        </form>
      </div>
    </div>
  </main>

<% 
	}
%>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1"></p>
    <ul class="list-inline">
    </ul>
  </footer>
</div>


    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
      
      
<script>
	function add(){
		let tmp = '';
		tmp += '<div class="input-group has-validation">';
		tmp += '<input type="text" class="form-control" name="fmenu" id="menu" placeholder="메뉴">';
		tmp += '<input type="text" class="form-control" name="fprice" id="price" placeholder="가격">';
		tmp += '<button type="button" class="btn btn-danger btnRemove">삭제</button></div>';
		$('.addInput').append(
				tmp
				
			);
			$('.btnRemove').on('click', function(){
				$(this).prev().remove();
				$(this).prev().remove();
				$(this).next().remove();
				$(this).remove();
			});
	}

	
	function del(fno){
		$.ajax({
 			type:"post",
 			url: "foodDelete.jsp",
 			data : {fno:fno
 				
 			},
 			dataType:"text",
 			
 			success:function(data) {
 				location.replace("foodDelSuccess.jsp");
 			},
 			
 			error : function(request, status, error){
 				location.replace("foodDelFail.jsp");
 			}
 		});
	}
	
	
	
</script>       
  </body>
</html>