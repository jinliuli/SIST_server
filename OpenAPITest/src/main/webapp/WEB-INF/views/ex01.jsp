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
		table td:nth-child(1) { width: 120px; text-align: center; }
		table td:nth-child(2) div { margin-bottom: 5px; }
		table img { width: 110px; }
	</style>
</head>
<body>
	<!-- ex01.jsp -->
	<h1 class="main">Naver Book <small>search</small></h1>
	
	<form method="GET" action="/api/ex01.do">
	<div class="message">
		<div class="group">
			<label>검색어</label>
			<input type="text" name="word" class="long" required value="${word}">
			&nbsp;
			<input type="submit" value="검색하기">
			<input type="button" value="초기화" onclick="location.href='/api/ex01.do'">
			&nbsp;
			<select name="count" id="count">
				<option value="5">5개씩 보기</option>
				<option value="10" selected>10개씩 보기</option>
				<option value="20">20개씩 보기</option>
				<option value="100">100개씩 보기</option>
			</select>
			
		</div>
	</div>
	
	
	<div>
		<input type="button" value="이전 ${count}개" id="btnPrev">
		<input type="button" value="다음 ${count}개" id="btnNext">
	</div>
	<input type="hidden" name="start" id="start" value="1">
	</form>
	
	
	<table>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td><img src="${dto.image}"></td>
			<td>
				<div>제목: ${dto.title}</div>
				<div>저자: ${dto.author}</div>
				<div>가격: ${dto.discount}</div>
				<div>출판사: ${dto.publisher}</div>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		//몇개씩 보고있는지 화면에 저장
		$('#count').val(${count});
		
		//몇개씩 보이는지 수량 바꾸면 알아서 검색하기 눌러지도록~~
		$('#count').change(()=>{
			$('input[type=submit]').click();
		});
		
		//이전페이지
		$('#btnPrev').click(()=>{
			let start = parseInt($('#start').val()) - parseInt($('#count').val());
			
			if (start < 1) return;
			
			$('#start').val(start);
			$('input[type=submit]').click();
		});
		
		//다음페이지
		$('#btnNext').click(()=>{
			//console.log(typeof $('#start').val()); //String
			//console.log(typeof $('#count').val()); //String
			let start = parseInt($('#start').val()) + parseInt($('#count').val());
			
			<c:if test="${not empty word}">
			if (start >= ${total}) return;
			</c:if>
			
			$('#start').val(start);
			$('input[type=submit]').click();
		});
		
		//받아온 숫자가 없는 첫페이지는 1부터 시작함 
		<c:if test="${empty start}">
		$('#start').val(1);
		</c:if>
		
		<c:if test="${ not empty start}">
		$('#start').val(${start});
		</c:if>
		
	</script>
</body>
</html>