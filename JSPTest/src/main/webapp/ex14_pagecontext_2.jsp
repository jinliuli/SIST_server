<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	
	</style>
</head>
<body>
	<!-- ex14_pagecontext_2.jsp -->
	<h1>두번째 페이지</h1>
	
	<div class="message"><%= name %></div>
	<div class="message"><%= request.getAttribute("nick") %></div>
	<!-- request.getAttribute("nick") > nick=강아지 를 담은 상자역할 -->
	<div class="message"><%= pageContext.getAttribute("nick") %></div>
	<!-- pageContext > 페이지가 소멸될때 데이터도 같이 소멸됨 -->
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>