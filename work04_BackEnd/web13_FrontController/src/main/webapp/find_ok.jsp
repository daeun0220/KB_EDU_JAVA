
<%@page import="servlet.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberVO vo = (MemberVO)request.getAttribute("vo");
%>
<h2>회원 검색 결과</h2>
ID <br>  <%= vo.getId() %> <br>
NAME <br> <%= vo.getName() %> <br>
ADDRESS <%= vo.getAddress() %>
</body>
</html>