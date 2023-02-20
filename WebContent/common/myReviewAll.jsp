<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.reviewDAO" %>

<%
out.print(reviewDAO.getMyReviewList("t1"));
%>
