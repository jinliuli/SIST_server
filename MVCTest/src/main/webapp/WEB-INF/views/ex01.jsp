<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- ex01 -->
	<h1>Ex01</h1>
	
	<!--  
		request.getParameter(key) > String타입을 리턴
		request.getAttribute(key) > Object타입을 리턴
		
	-->
	
	<div>num: <%= request.getAttribute("num") %></div>
	
	<div>txt: ${txt}</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>