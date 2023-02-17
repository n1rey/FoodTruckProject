<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.questionDAO" %>
<%
    String sid = "aaaa";
    int pg = Integer.parseInt(request.getParameter("page"));

    out.print(questionDAO.getMyQuestList(sid, pg));
%>