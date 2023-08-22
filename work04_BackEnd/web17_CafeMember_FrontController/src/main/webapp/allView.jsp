

<%@page import="servlet.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 전체 명단 보기</h2>
<table>
	<thead>
	<tr>
		<th>ID</th>
		<th>NAME</th>
		<th>ADDRESS</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list}">
		<tr>
		<td>${vo.id}</td>
		<td>${vo.name}</td>
		<td>${vo.address}</td>
		</tr>
		
		</c:forEach>
	</tbody>
</table>
</body>
</html>