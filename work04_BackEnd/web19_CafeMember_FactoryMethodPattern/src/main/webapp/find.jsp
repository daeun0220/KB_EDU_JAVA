<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
hidden tag
서비스 요청시 브라우저에 값을 노출시키지 않고 서버로 숨겨서 값을 보낼때 사용하는 태그
 -->
<h2>단순 회원 검색하기</h2>
<form action="front.do" method="post">
	<input type="hidden" name="command" value="find">
	조회할 ID <input type="text" name="id" required="required">
	<input type="submit" name="회원조회">
</form>
</body>
</html>