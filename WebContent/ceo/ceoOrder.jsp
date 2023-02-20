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
        .oheader {
            margin-bottom: 30px;
        }
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
        .id{
            float: right;
        }
        .cancelOrder {
            margin-right: 10px;
        }

    </style>

    <script>
        <% int fno = Integer.parseInt(request.getParameter("fno")); %>

        var fno = <%= fno %>

        var page = <%= Integer.parseInt(request.getParameter("page")) %>;
        var maxPage = <%= orderDAO.ceoOrderPaging(fno) %>;


        function cancelOrder(ono) {
            $(function() {
                $("#cancelModal").modal("show");
            });

            $(".cancelOk").on("click", function() {
                $.ajax({
                    type: 'post',
                    url: '/ceo/ceoOrderCancel.jsp',
                    data: {ono: ono},
                    success: function (data) {
                        searchFunction();
                    }, error:function(request, status, error){
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            });
        }

        function successOrder(ono) {
            $(function() {
                $("#successModal").modal("show");
            });

            $(".successOk").on("click", function() {
                $.ajax({
                    type: 'post',
                    url: '/ceo/ceoOrderSuccess.jsp',
                    data: {ono: ono},
                    success: function (data) {
                        searchFunction();
                    }, error:function(request, status, error){
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            });
        }

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
                        var menu = JSON.parse(orders[i].menu);
                        var keys = Object.keys(menu);

                        menu[keys]

                        str += "<div class='row mb-3 text-center'>"
                        str += "<div class='col-4 themed-grid-col' onclick='detailOrder(" + orders[i].ono +")'>" + keys[0] + "</div>"
                        if (orders[i].opro == 0) {
                            str += "<div class='col-3 themed-grid-col text-danger'>진행중</div>";
                        } else {
                            str += "<div class='col-3 themed-grid-col text-success'>완료</div>";
                        }
                        str += "<div class='col-2 themed-grid-col btn btn-danger cancelOrder' onclick='cancelOrder(" + orders[i].ono + ")'>주문 취소</div>"
                        str += "<div class='col-2 themed-grid-col btn btn-success successOrder' onclick='successOrder(" + orders[i].ono + ")'>완료</div>"

                        str += "<div class='col-12 themed-grid-col text-center' id='odetail" + orders[i].ono + "' style='display: none'>";
                        str += "<div class='box shadow'>";
                        str += "<div class='oheader'><div class='id fs-6 fw-bold'>" + orders[i].id + "</div></div>";
                        for (var j = 0; j < keys.length; j++) {
                            str += "<div>" +  keys[j] + " : "; //메뉴 이름
                            str += menu[keys[j]] + "원</div>"; //가격
                            totalPrice += menu[keys[j]];
                        }
                        str += "<hr><div class='total price'>총합 : " + totalPrice + "원</div></div></div></div></div>"; //총 가격 class이름도 바꿀것
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
        <div class="col-8 themed-grid-col">처리 여부</div>
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
                <a class="page-link" href="?page=<%= orderDAO.ceoOrderPaging(fno) %>">>></a>
            </li>
        </ul>
    </nav>
</div>

<!-- Modal -->
<div class="modal fade" id="cancelModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="cancelModalLabel">주문 취소</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                정말 주문을 취소하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary cancelOk" data-bs-dismiss="modal">네</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="successModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="successModalLabel">음식 완료</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                정말 완료 처리 하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary successOk" data-bs-dismiss="modal">네</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>