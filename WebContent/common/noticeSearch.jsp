<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.notiDAO" %>
<%
    int pg = Integer.parseInt(request.getParameter("page"));

    out.print(notiDAO.notiList(pg));
%>