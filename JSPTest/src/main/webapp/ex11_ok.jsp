<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String txt = request.getParameter("txt");
	String bgcolor = request.getParameter("bgcolor");
	String fontcolor = request.getParameter("fontcolor");
	String fontsize = request.getParameter("fontsize");
	String leftright = request.getParameter("leftright");
	String topbottom = request.getParameter("topbottom");
	int count = Integer.parseInt(request.getParameter("count"));
	String icon = request.getParameter("icon");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<script src="https://kit.fontawesome.com/1ddf83a78d.js" crossorigin="anonymous"></script>
	<style>
		.btn {
			width: <%= width %>px; 
			height: <%= height %>px; 
			background-color: <%= bgcolor %>; 
			color: <%= fontcolor %>; 
			font-size: <%= fontsize %>px;
			margin: <%= leftright %><%= topbottom %>;
		}
	</style>
</head>
<body>
	<!-- ex11_ok.jsp -->
	<h1>결과</h1>
	<table>
		<tr>
			<th>버튼</th>
		</tr>
		<tr>
			<td>
				<% for (int i=0; i<count; i++) { %>
				<button class="btn">
				<i class="fa-solid fa-<%= icon %>"></i>
				<%= txt %>
				</button>
				<% } %>	
			</td>
		</tr>
	</table>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>