<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문2 :: 양자택일시 사용 :: c : Choose</title>
</head>
<body>
<h2>c : choose 사용하기</h2>
<c:choose>
	<c:when test="${param.NUM=='100'}">
		<b>고객님 100만원 입금하셨습니다</b>
	</c:when>
	<c:otherwise>
		<b>고객님 입금액을 다시 확인해 주시길 바랍니다.</b>
	</c:otherwise>
</c:choose>
</body>
</html>