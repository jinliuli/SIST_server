<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>
	
	</style>
</head>
<body>
	<!-- addok.jsp -->
	<div id="main">
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<div id="content">
			
			<%-- 
			<c:if test="${result == 1}">
			<div>메모 작성을 성공했습니다.</div>
			<a href="/memo/list.do">목록보기</a>
			</c:if>
			
			<c:if test="${result == 0}">
			<div>메모 작성을 실패했습니다.</div>
			<a href="/memo/add.do">돌아가기</a>
			</c:if> 
			--%>
			
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		
		<c:if test="${result == 1}">
		alert('메모 작성 성공');
		location.href = '/memo/list.do';
		</c:if>
		
		<c:if test="${result == 0}">
		alert('메모 작성 실패');
		//location.href = '/memo/add.do'; //페이지 이동명령이라서 메모저장안됨ㅠㅠ
		history.back();//(컨트롤상태 유지시켜서)타임머신타고 돌아간거임~~
		</c:if>
		
		 
	</script>
</body>
</html>