<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- 
파일업로드 기술 사용시 주의할 점
1.form태그 안에 input type="file"폼을 만든다
2.enctype="multipart/form-data"
3. enctype="multipart/form-data"
4. poem.xml에 fileupload 디팬더시 추가
5. 파일업로드한 정보를 저장하는 vo를 만들고 
 -->
</head>
<body>
<h2 align="center">File Upload Form</h2>
<form action="fileupload.do" method="post" enctype="multipart/form-data">
	사용자명 <input type="text" name="userName">
	<input type="file" name="uploadFile">
	<input type="submit" name="파일업로드">
</form>
</body>
</html>