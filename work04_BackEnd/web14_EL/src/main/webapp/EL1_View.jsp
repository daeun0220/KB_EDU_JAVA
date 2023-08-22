<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>1. JSP 기본 Element 로 받아오기(이전방식)</b><br>
ServletRequest 에 바인딩된 값 :: <%= request.getAttribute("RESULT1") %> <br>
HttpSession 에 바인딩된 값 ::<%= session.getAttribute("RESULT2") %> <br>

<hr>
<b>2. JSP EL로 받아오기</b><br>
ServletRequest 에 바인딩된 값 :: ${RESULT1}<br>
HttpSession 에 바인딩된 값 :: ${RESULT2} <br>

연산가능 :: ${RESULT2 + 100} <br>
</body>
</html>