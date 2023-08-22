<%@page import="servlet.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<MemberVO> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	button{
		position: relative;
		left: 1200px;
	}
</style>
<script>
	$(function(){ 
		
	});	
</script>
</head>
<body>
<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-primary text-white">
	<h2>회원 전체 명단 보기</h2>
</div>
<table class="table table-striped text-primary table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>ADDRESS</th>
		</tr>
	</thead>
	<tbody>
<%
	for(MemberVO vo : list){
%>	

	<tr>
		<td><%=  vo.getId() %></td>
		<td><%=  vo.getName() %></td>
		<td><%=  vo.getAddress() %></td>
	</tr>

<%	
	}
%>
</tbody>
</table>
</div>
<button type="button" class="btn btn-primary" onClick="location.href='http://localhost:8888/web09_CafeMember/index.html'">INDEX</button>
</body>
</html>





