<!--
최초작성자 : 강세빈 (qz6789.sk@gmail.com)
최초작성일 : 2023/02/17

버전  기록 : 0.1(시작 23/02/17)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.orderDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>주문 사항</title>
    <style>
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .box {
            margin-top: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px 50px 5px;
            width: 100%;
        }
        .email{
            float: right;
        }
        .qcontent {
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-top: 50px;
            padding-top: 20px;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="p-5 mb-4 bg-light rounded-3">
    <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">주문 사항</h1>
        <p class="col-md-8 fs-4">가게의 주문 사항을 알려드립니다. </p>
    </div>
</div>
<div class="container">
    <div class="row mb-3 text-center">
        <div class="col-4 themed-grid-col">메뉴</div>
        <div class="col-3 themed-grid-col">예약시간</div>
        <div class="col-5 themed-grid-col">처리 여부</div>
    </div>
    <hr>
    <div class="container" id="order">

    </div>
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item prev" style="display: none;">
                <a class="page-link" href="?page=1"><<</a>
            </li>
            <li class="page-item prev" style="display: none;">
                <a class="page-link prev"><</a>
            </li>
            <li id="pageNumber"></li>
            <li class="page-item next" style="display: inline-block;">
                <a class="page-link next" href="?page=">></a>
            </li>
            <li class="page-item next" style="display: inline-block;">
                <a class="page-link" href="?page=<%= orderDAO.paging(fno) %>">>></a>
            </li>
        </ul>
    </nav>
</div>

<script>
    <% int fno = Integer.parseInt(request.getParameter("fno")); %>

    var fno = <%= fno %>

    var page = <%= Integer.parseInt(request.getParameter("page")) %>;
    var maxPage = <%= orderDAO.paging(fno) %>;

    function detailOrder(ono) {
        if( $("#odetail"+ono).css('display') == 'none') {

            $("#odetail"+ono).css('display', 'flex');
        } else {
            $("#odetail"+ono).css('display', 'none');
        }
    }

    function searchFunction() {

        $.ajax({
            type:'post',
            url:'/ceo/ceoOrderSearch.jsp',
            data:{ fno : fno,
                page : page },
            success:function(data){
                var orders = JSON.parse(data.trim());

                var str = "";
                var pageStr = "";
                var totalPrice = 0;

                for(var i = 0; i < orders.length; i++){
                    var menu = Object.keys(orders[i].menu);

                    str += "<div class='row mb-3 text-center'>"
                    str += "<div class='col-4 themed-grid-col' onclick='detailOrder(" + orders[i].ono +")'>" + menu[0] + "</div>"
                    if (orders[i].opro == 0) {
                        str += "<div class='col-5 themed-grid-col text-danger'>진행중</div>";
                    } else {
                        str += "<div class='col-5 themed-grid-col text-success'>완료</div>";
                    }
                    str += "<div class='col-12 themed-grid-col text-center' id='qdetail" + orders[i].ono + "' style='display: none'>";
                    str += "<div class='box shadow'>";
                    for (var j = 0; j < menu.length; j++) {
                        str += "<div>" +  menu[j] + " : "; //메뉴 이름
                        str += orders[i].menu[menu[j]] + "</div><br>"; //가격
                        totalPrice += orders[i].menu[menu[j]];
                    }
                    str += "<hr><div class='total price'>" + totalPrice + "원</div></div></div></div>"; //총 가격 class이름도 바꿀것
                }
                $("a.next").attr("href",'?page=' + (Math.floor((page-1)/5) * 5 + 6));
                if (page > 5) {
                    $(".prev").css('display','inline-block');
                    $("a.prev").attr("href",'?page=' + (Math.floor((page-1)/5) * 5));
                }
                if (page > (Math.floor((maxPage-1)/5) * 5)){
                    $(".next").css('display','none');
                }

                for (var j = 1; j < 6; j++) {
                    if ((Math.floor((page-1)/5) * 5 + j) == page) {
                        pageStr += '<li class="page-item active" aria-current="page" style="display: inline-block"><a class="page-link" href="?page='+ (Math.floor((page-1)/5) * 5 + j) + '">' + (Math.floor((page-1)/5) * 5 + j) + '</a></li>'
                    } else if ((Math.floor((page-1)/5) * 5 + j) > maxPage) {
                        $(".next").css('display','none');
                        break;
                    } else {
                        pageStr += '<li class="page-item" aria-current="page" style="display: inline-block"><a class="page-link" href="?page='+ (Math.floor((page-1)/5) * 5 + j) + '">' + (Math.floor((page-1)/5) * 5 + j) + '</a></li>'
                    }
                }
                $("#order").html(str);
                $("#pageNumber").html(pageStr);
            },
            error:function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }

    window.onload = function() {
        searchFunction();
    }
</script>
</body>
</html>