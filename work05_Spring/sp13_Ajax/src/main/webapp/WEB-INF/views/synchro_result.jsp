<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	$(function(){
		//��ư Ŭ���ϸ� �Լ�ȣ��
		$('#asynchro').click(function(){
			//�񵿱� ����...
			$.ajax({
				//��û
				type:'get',
				url:'asynch',
				
				//����
				success:function(data){  //��ü ������ �����͸� �޾ƿ�(JSON)
					//alert(data);
					var jsonData = JSON.parse(data);
					$('#jsonView').html("<h3><font color=tomato>" + jsonData.person.name+
		                    "���� ��� ���� "+jsonData.person.address+"�Դϴ�.</font></h3>")
				}//callback
				
				
			});
			
		});
	});
</script>
</head>
<body>
<h2>${info}</h2>
<p></p>
<hr>
<p></p>
<input type="button" value="�񵿱���� �����ϱ�" id="asynchro">
<span id="jsonView"></span>
</body>
</html>