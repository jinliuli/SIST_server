<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<script src="https://kit.fontawesome.com/1ddf83a78d.js" crossorigin="anonymous"></script>
	<style>
	
	</style>
</head>
<body>
	<!-- ex11_form.jsp -->
	<h1>버튼 만들기</h1>
	
	<form method="POST" action="ex11_ok.jsp">
		<table class="">
			<tr>
				<th>너비(px)</th>
				<td><input type="number" name="width" min="20" max="300" step="10" value="120"></td>
			</tr>
			<tr>
				<th>높이(px)</th>
				<td><input type="number" name="height" min="20" max="300" step="10" value="30"></td>
			</tr>
			<tr>
				<th>텍스트</th>
				<td><input type="text" name="txt" value="Button"></td>
			</tr>
			<tr>
				<th>배경색</th>
				<td><input type="color" name="bgcolor" value="#ffffff"></td>
			</tr>
			<tr>
				<th>글자색</th>
				<td><input type="color" name="fontcolor"></td>
			</tr>
			<tr>
				<th>글자 크기(px)</th>
				<td><input type="number" name="fontsize" min="10" max="100" value="16"></td>
			</tr>
			<tr>
				<th>버튼 개수(ea)</th>
				<td><input type="number" name="count" min="1" max="30" value="1"></td>
			</tr>
			<tr>
				<th>버튼 간격</th>
				<td>
				<div>좌우 간격: <input type="range" min="0" max="50" value="0" name="leftright"></div>
				<div>상하 간격: <input type="range" min="0" max="50" value="0" name="topbottom"></div>
				</td>
			</tr>
			<tr>
				<th>아이콘</th>
				<td>
					<lable>
						<input type="radio" name="icon" value="없음">
						없음
					</lable>
					<lable>
						<input type="radio" name="icon" value="house">
						<i class="fa-solid fa-house"></i>
					</lable>
					<lable>
						<input type="radio" name="icon" value="image">
						<i class="fa-solid fa-image"></i>
					</lable>
					<lable>
						<input type="radio" name="icon" value="location-dot">
						<i class="fa-solid fa-location-dot"></i>
					</lable>
					<lable>
						<input type="radio" name="icon" value="github">
						<i class="fa-brands fa-github"></i>
					</lable>
					<lable>
						<input type="radio" name="icon" value="paperclip">
						<i class="fa-solid fa-paperclip"></i>
					</lable>
				</td>
			</tr>
			<tr>
				<th>테두리</th>
				<td>
					<select name="sel">
						<option>감추기</option>
						<option>보이기</option>
						<div id="borderbox">
							<div>두께(px): <input type="number" name=""></div>
							<div>색상: <input type="color" name=""></div>
							<select>스타일: 
								<option>실선</option>
								<option>쇄선</option>
								<option>점선</option>
							</select>
							<div>모서리(px): <input type="number" name=""></div>
						</div>
					</select>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="만들기">
		</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>