<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*  
		
		서버측 페이지 이동하기
		- response.sendRedirect("URL")
		- pageContext.forward("URL")
		
	*/
	
	//A페이지 > (이동 + 데이터 전달) > B페이지
	
	//웹은 상태관리가 불가능하다. > Stateless
	//- 하나의 페이지에서 사용하던 자원들을 지속적으로 유지해서 다른 페이지에서도 활용할 수 없다.

	//DB > select
	String name = "홍길동";
	String nick = "강아지";
	

	//System.out.println("시작");
	//pageContext.forward("ex14_pagecontext_2.jsp");
	//System.out.println("끝");

	//response.sendRedirect("ex14_pagecontext_2.jsp");	
	
	
	
	//pageContext.setAttribute("num", 100);
	//System.out.println(pageContext.getAttribute("num"));
	
	//request.setAttribute("num", 200);
	//System.out.println(request.getAttribute("num"));
	
	
	//서버쪽 > 페이지간의 데이터 전달
	//1. request 안에 데이터를 넣는다.
	//2. pageContext.forward()로 이동한다.
	//3. 이동한 페이지의 request 안의 데이터를 꺼낸다.
	
	//request 는 재사용할 수 있다.
	//pageContext > 생명주기가 한 페이지에 제한됨 > 다른 페이지로 데이터 전달 불가능 (페이지가 소멸될때 데이터도 같이 소멸됨)
	
	
	request.setAttribute("nick", nick);

	pageContext.forward("ex14_pagecontext_2.jsp"); //request > 강아지
	//response.sendRedirect("ex14_pagecontext_2.jsp"); //request > null
	
	
	
	
	//pageContext.setAttribute("nick", nick);
	
	//pageContext.forward("ex14_pagecontext_2.jsp"); //pageContext > null
	

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
	<!-- ex14_pagecontext_1.jsp -->
	<h1>첫번째 페이지</h1>
	
	<div class="message"><%= name %></div>
	
	<div>
		<a href="ex14_pagecontext_2.jsp?name=<%= name %>">이동하기</a>
	</div>
	
	<form method="POST" action="ex14_pagecontext_2.jsp" id="form1">
		<input type="hidden" name="name" value="<%= name %>">
		<div><a href="#!" id="link1">이동하기</a></div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		document.getElementById('link1').onclick = function () {
			document.getElementById('form1').submit();
		};
	</script>
</body>
</html>