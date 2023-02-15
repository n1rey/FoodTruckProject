<!--
    최초작성자 : 강세빈 (qz6789.sk@gmail.com)
    최초작성일 : 2023/02/15

    버전  기록 : 0.1(시작 23/02/15)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.notiDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>공지사항</title>
    <style>
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
    <script>
        var page = <%= Integer.parseInt(request.getParameter("page")) %>;
        var maxPage = <%= notiDAO.paging() %>

        function searchFunction() {

            $.ajax({
                type:'post',
                url:'/notice/noticeSearch.jsp',
                data:{ page : page },
                success:function(data){
                    var notices = JSON.parse(data.trim());

                    var str = "";
                    var pageStr = "";
                    for(var i = 0; i < notices.length; i++){
                        str += "<div class='row mb-3 text-center'>"
                        str += "<div class='col-1 themed-grid-col'>" + notices[i].nno + "</div>"
                        str += "<div class='col-8 themed-grid-col'>" + notices[i].ntitle + "</div>"
                        if (notices[i].nupdatetime == null) {
                            str += "<div class='col-3 themed-grid-col'>" + notices[i].nregtime + "</div>";
                        } else {
                            str += "<div class='col-3 themed-grid-col'>" + notices[i].nupdatetime + "</div>";
                        }
                        str += "</div>"
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
                    $("#notice").html(str);
                    $("#pageNumber").html(pageStr);
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
            <h1 class="display-5 fw-bold">공지사항</h1>
            <p class="col-md-8 fs-4">오늘 오세요? 의 업데이트 정보 등 다양한 소식을 알려드립니다. </p>
        </div>
    </div>
    <div class="container">
        <div class="row mb-3 text-center">
            <div class="col-1 themed-grid-col">번호</div>
            <div class="col-8 themed-grid-col">제목</div>
            <div class="col-3 themed-grid-col">작성일</div>
        </div>
        <hr>
        <div class="container" id="notice">

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
                    <a class="page-link" href="?page=<%= notiDAO.paging() %>">>></a>
                </li>
            </ul>
        </nav>

    </div>
</body>
</html>