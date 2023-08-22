<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>El Result Page</h2>
<b>1. JSP 기본 Element(이전방식)</b> <br>
<%= request.getParameter("myId") %> <br>

<b>2. JSP EL</b><br>
<!--  request.getAttribute("myId") -->
ID : ${myId} <br>

<!--  request.getParameter("myId") -->
ID : ${param.myId} <br>

<hr>
<b>3. JSP Menu(Checkbox) 기본 Element(이전방식)</b>
<% 
	String[] menus = request.getParameterValues("menu");
	for(String menu : menus) {
%> 
	<b><%= menu %></b>
<%
	}
%>

<br><b>4. JSP Menu(Checkbox) EL</b>
선택한 메뉴 <br>
${paramValues.menu[0]} 
${paramValues.menu[1]} 
${paramValues.menu[2]} 
${paramValues.menu[3]} 
</body>
</html>









