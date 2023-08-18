<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%= request.getParameter("id") %>님이 로그인 되었습니다!!</h2>
<p></p>
<a href="book">도서 등록</a><br><br>
<a href="logout">로그아웃</a>
</body>
</html>