<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 이 코드는 원래 서블릿이라고 생각해주세요 -->
<%
	int sum = 0;
	for(int cnt = 0; cnt < 50; cnt++) {
		sum += cnt;
	}
	request.setAttribute("RESULT1", sum);
	session.setAttribute("RESULT2", sum);
	application.setAttribute("Name", "KBSTAR");
	
	request.getRequestDispatcher("EL1_View.jsp").forward(request, response);
%>
</body>
</html>