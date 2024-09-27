<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		table th {width: 140px;}
	</style>
</head>
<body>
	<!-- ex05.jsp -->
	<h1>아이디 중복검사</h1>
	<form method="POST" action="/ajax/ex05ok.do">
	<table>
		<tr>
			<th>이름</th>
			<td></td>
		</tr>
		<tr>
			<th>암호</th>
			<td></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" class="short" readonly>
				<input type="button" value="중복검사" id="btnCheck">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id2" class="short">
				<input type="button" value="중복검사" id="btnCheck2">
				<span id="result2"></span>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td></td>
		</tr>
	</table>
	<div>
		<input type="submit" value="가입하기">
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		$('#btnCheck').click(()=>{
			
			window.open('/ajax/ex05check.do', 'check', 'width=400, height=350');
			
		});//#btnCheck
	
		
		$('#btnCheck2').click(()=>{
			
			if ($('input[name=id2]').val().trim() == '') return;
			
			$.ajax({
				type: 'POST',
				url: '/ajax/ex05data.do',
				data: 'id=' + $('input[name=id2]').val(),
				success: function(result) {
					//alert(result);
					if (result == '1') {
						$('#result2').text('이미 사용중인 아이디입니다.');
						//사용불가는 가입하기 못누르게하기
						$('input[type=submit]').prop('disabled', true);
					} else {
						$('#result2').text('사용 가능한 아이디입니다.');
						//사용가능은 가입하기 누를수있도록하기
						$('input[type=submit]').prop('disabled', false);
					}
				}
			});
		});//#btnCheck2
		
		
		/* 
		$('input[name=id2]').blur(()=>{
			alert();
		}); 
		*/
		
		//사용가능아이디로 중복검사하고 몰래 다시 이미사용중인 아이디로 가입하는것을 방지
		$('input[name=id2]').change(()=>{
			$('input[type=submit]').prop('disabled', true);
		});
		
		
	</script>
</body>
</html>