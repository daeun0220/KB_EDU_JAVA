<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- 
���Ͼ��ε� ��� ���� ������ ��
1.form�±� �ȿ� input type="file"���� �����
2.enctype="multipart/form-data"
3. enctype="multipart/form-data"
4. poem.xml�� fileupload ���Ҵ��� �߰�
5. ���Ͼ��ε��� ������ �����ϴ� vo�� ����� 
 -->
</head>
<body>
<h2 align="center">File Upload Form</h2>
<form action="fileupload.do" method="post" enctype="multipart/form-data">
	����ڸ� <input type="text" name="userName">
	<input type="file" name="uploadFile">
	<input type="submit" name="���Ͼ��ε�">
</form>
</body>
</html>