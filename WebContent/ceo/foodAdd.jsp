<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 
          0.5(기본작업 23/02/16) 
          0.7(추가 디자인 23/02/16)
          1.0(1차 완성 23/02/)
 -->
<!-- 메뉴, 가격 데이터 보내기 처리해야 함 -->
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
    <title>푸드 트럭 등록</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">

<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- Favicons -->
<meta name="theme-color" content="#712cf9">


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

    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
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
	
	$(function() {
		
		// 리스트 생성
		var testList = new Array() ;

		for(var i=1; i<=2; i++){
			// 객체 생성
			var data = new Object() ;
			
			data.number = i ;
			data.name = "Tester #" + i ;
			
			// 리스트에 생성된 객체 삽입
			testList.push(data) ;
		}
		
		// String 형태로 변환
		var jsonData = JSON.stringify(testList) ;
		
		alert(jsonData) ;
	});
</script>  
<%@ include file = "/header.jsp" %>   
<div class="container"> 
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="" alt="" width="72" height="57">
      <h2>푸드 트럭 등록</h2>
    </div>

    <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3 text-center">푸드 트럭 정보 입력</h4><br>
        <form class="needs-validation" action="foodAddCheck.jsp" method="post" enctype="multipart/form-data">
          <div class="row g-3">
            <div class="col-12">
              <label class="form-label">가게명</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="fname" required>
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">사진</label>
              <div class="input-group has-validation">
                <input type="file" class="form-control" name="fphoto" required>
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">위치</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="flocation" required>
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-12">
              <label class="form-label">영업 시간</label>
              <div class="row">
	              <div class="col-md-2">
		              <select class="form-select" name="time1">
		              	<option value="오전">오전</option>
		              	<option value="오후">오후</option>
		              </select>
		          </div>    
		          <div class="col-md-2">    
		              <select class="form-select" name="time2">
		              	<option value="1시">1시</option>
		              	<option value="2시">2시</option>
		              	<option value="3시">3시</option>
		              	<option value="4시">4시</option>
		              	<option value="5시">5시</option>
		              	<option value="6시">6시</option>
		              	<option value="7시">7시</option>
		              	<option value="8시">8시</option>
		              	<option value="9시">9시</option>
		              	<option value="10시">10시</option>
		              	<option value="11시">11시</option>
		              	<option value="12시">12시</option>
		              </select>
		          </div>    
	              <div class="col-md-1">
		              <span class="input-group-text">&nbsp~</span>
		          </div>    
	              <div class="col-md-2">
		              <select class="form-select" name="time3">
		              	<option value="오전">오전</option>
		              	<option value="오후" selected>오후</option>
		              </select>
		          </div>    
		          <div class="col-md-2">    
		              <select class="form-select" name="time4">
		              	<option value="1시">1시</option>
		              	<option value="2시">2시</option>
		              	<option value="3시">3시</option>
		              	<option value="4시">4시</option>
		              	<option value="5시">5시</option>
		              	<option value="6시">6시</option>
		              	<option value="7시">7시</option>
		              	<option value="8시">8시</option>
		              	<option value="9시">9시</option>
		              	<option value="10시">10시</option>
		              	<option value="11시">11시</option>
		              	<option value="12시">12시</option>
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
                <input type="text" class="form-control" name="fmenu" id="menu" placeholder="메뉴" required>
                <input type="text" class="form-control" name="fprice" id="price" placeholder="가격" required>
                <button type="button" class="btn btn-info btnAdd" onclick="add();">추가</button>
              </div>
              <div class="input-group has-validation ">
              
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

          <hr class="my-4"> 
		  <input type="hidden" name="id" value="<%=sid%>">
          <button class="w-100 btn btn-primary btn-lg" type="submit">등록</button>
        </form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1"></p>
    <ul class="list-inline">
    </ul>
  </footer>
</div>


    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  </body>
</html>