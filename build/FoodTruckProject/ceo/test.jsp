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
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
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
		$('.addInput').append(
				'<div class="form-inline"><input type="text" class="form-control" name="fmenu" required><input type="text" class="form-control" name="fprice" required>\<button type="button" class="btn btn-primary btnRemove">삭제</button></div>' 
				
			);
			$('.btnRemove').on('click', function(){
				$(this).prev().remove();
				$(this).prev().remove();
				$(this).next().remove();
				$(this).remove();
			});
	}
</script>  
<%@ include file = "/header.jsp" %>   
<div class="container"> 
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="/etc/car3.png" alt="" width="72" height="57">
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
		              	<option>오전</option>
		              	<option>오후</option>
		              </select>
		          </div>    
		          <div class="col-md-2">    
		              <select class="form-select" name="time2">
		              	<option>1시</option>
		              	<option>2시</option>
		              	<option>3시</option>
		              	<option>4시</option>
		              	<option>5시</option>
		              	<option>6시</option>
		              	<option>7시</option>
		              	<option>8시</option>
		              	<option>9시</option>
		              	<option>10시</option>
		              	<option>11시</option>
		              	<option>12시</option>
		              </select>
		          </div>    
	              <div class="col-md-1">
		              <span class="input-group-text">&nbsp~</span>
		          </div>    
	              <div class="col-md-2">
		              <select class="form-select" name="time3">
		              	<option>오전</option>
		              	<option>오후</option>
		              </select>
		          </div>    
		          <div class="col-md-2">    
		              <select class="form-select" name="time4">
		              	<option>1시</option>
		              	<option>2시</option>
		              	<option>3시</option>
		              	<option>4시</option>
		              	<option>5시</option>
		              	<option>6시</option>
		              	<option>7시</option>
		              	<option>8시</option>
		              	<option>9시</option>
		              	<option>10시</option>
		              	<option>11시</option>
		              	<option>12시</option>
		              </select>
		          </div>    
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-6">
              <label class="form-label">메뉴 & 가격</label> 
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="fmenu" required>
                <input type="text" class="form-control" name="fprice" required>
                <button type="button" class="btn btn-primary btnAdd" onclick="add()">추가</button>
              </div>
              <div class="input-group has-validation addInput">
              
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-12">
              <label class="form-label">가격</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="fprice" required>
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-md-5">
              <label for="country" class="form-label">Country</label>
              <select class="form-select" id="country" required>
                <option value="">Choose...</option>
                <option>United States</option>
              </select>
              <div class="invalid-feedback">
                Please select a valid country.
              </div>
            </div>

            <div class="col-md-4">
              <label for="state" class="form-label">State</label>
              <select class="form-select" id="state" required>
                <option value="">Choose...</option>
                <option>California</option>
              </select>
              <div class="invalid-feedback">
                Please provide a valid state.
              </div>
            </div>

            <div class="col-md-3">
              <label for="zip" class="form-label">Zip</label>
              <input type="text" class="form-control" id="zip" placeholder="" required>
              <div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          </div>

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">Save this information for next time</label>
          </div>

          <hr class="my-4">

          <h4 class="mb-3">Payment</h4>

          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">Credit card</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">Debit card</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">PayPal</label>
            </div>
          </div>

          <div class="row gy-3">
            <div class="col-md-6">
              <label for="cc-name" class="form-label">Name on card</label>
              <input type="text" class="form-control" id="cc-name" placeholder="" required>
              <small class="text-muted">Full name as displayed on card</small>
              <div class="invalid-feedback">
                Name on card is required
              </div>
            </div>

            <div class="col-md-6">
              <label for="cc-number" class="form-label">Credit card number</label>
              <input type="text" class="form-control" id="cc-number" placeholder="" required>
              <div class="invalid-feedback">
                Credit card number is required
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-expiration" class="form-label">Expiration</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                Expiration date required
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-cvv" class="form-label">CVV</label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
              <div class="invalid-feedback">
                Security code required
              </div>
            </div>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
        </form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2022 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>


    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  </body>
</html>
