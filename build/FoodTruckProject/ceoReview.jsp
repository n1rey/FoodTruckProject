<!--
    최초작성자 : 강세빈 (qz6789.sk@gmail.com)
    최초작성일 : 2023/02/16

    버전  기록 : 0.1(시작 23/02/16)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.foodDAO" %>
<%@ page import="jdbc.reviewDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>내 가게 리뷰</title>
    <!-- ICON을 위한 FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .box {
            margin-top: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            width: 100%;
        }

        .date{
            float: right;
        }
    </style>
    <script>
        <% int fno = Integer.parseInt(request.getParameter("fno")); %>

        var fno = <%= fno %>
        var page = 0;
        var maxPage = <%= reviewDAO.ceoPaging(fno) %>;

        function searchFunction() {

            $.ajax({
                type:'post',
                url:'/ceoReviewSearch.jsp',
                data: { fno: fno,
                        page: page },
                success:function(data) {
                    var reviews = JSON.parse(data.trim());

                    var str = "";

                    for (var i = 0; i < reviews.length; i++) {
                        str += "<ul><div class='box shadow'>";
                        str += "<div class='review_header'>";
                        str += "<div class='id fw-bold'>" + reviews[i].id + "</div>";
                        for (var j = 0; j < 5 - reviews[i].point; j++) {
                            str += "<i class='far fa-star'></i>";
                        }
                        for (var k = 0; k < reviews[i].point; k++) {
                            str += "<i style='color:gold' class='far fas fa-star'></i>";
                        }
                        str += reviews[i].point + "점"
                        str += "<span class='date'>" + reviews[i].rregtime + "</span></div>";
                        str += "<div>" + reviews[i].rcontent + "</div></ul>";
                    }
                    str += "<ul><div id='moreList' style='display: flex;'>";
                    str += "<div class='box shadow text-center' id='moreView' onclick='moreView()'>더보기 ∨</div></div></ul>"

                    $("#review").html(str);

                    if (maxPage == page) {
                        $("#moreList").css('display', 'none');
                    } else {
                        $("#moreList").css('display', 'flex');
                    }
                }
            });
        }

        function moreView() {
            page = page + 1
            searchFunction()
        }

        window.onload = function() {
            moreView();
        }
    </script>
</head>
<body>
    <%@ include file="/header.jsp" %>
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid">
            <h1 class="display-5 fw-bold">내 가게 리뷰</h1>
            <p class="col-md-8 fs-4">내 가게의 리뷰를 볼 수 있습니다. </p>
        </div>
    </div>
    <div class="container">
        <h2 class="shadow py-3 text-center"><%= foodDAO.getName(Integer.parseInt(request.getParameter("fno"))) %></h2>
        <hr>
        <div class="fw-bold bs-3">전체 리뷰 <%= reviewDAO.totalReview(fno) %>건</div>
    </div>
    <div class="container" id="review">

    </div>
</body>
</html>