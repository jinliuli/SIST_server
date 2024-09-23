<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL을 사용하려면 태그라이브러리 지시자 설정 해줘야됨 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<!-- ex24_jstl.jsp -->
	<h1>JSTL</h1>
	
	<h2>변수 선언</h2>
	
	<%
		int a = 10; //지역 변수
		pageContext.setAttribute("b", 20); //pageContext 변수
	%>
	<%
	/*
	taglib prefix="c" c는 예약어로 볼 수도 있음
	단독태그 하려면 <c:set />이런식으로
	
		set 변수 pageContext 변수를 만드는 태그 
		JSTL 변수 == pageContext 변수
	*/
	%>
	<c:set var="c" value="30" />
	
	
	<div>a: <%= a %></div>
	<div>b: ${b}</div>
	<!-- 이거는 HTML 주석이라서 톰캣이 못읽음  -->
	<%-- <div>c: <%= c %></div> JSP주석 --%>
	<div>c: ${c}</div>
	<div>c: <%= pageContext.getAttribute("c") %></div>
	
	<h2>변수 수정</h2>
	<c:set var="c" value="30" />
	<div>c: ${c}</div>
	
	<h2>변수 삭제</h2>
	<c:remove var="c" />
	<div>c: ${c}</div>
	<div>c: ${empty c}</div>	
	
	<h2>조건문</h2>
	
	<c:set var="num" value="-10" />
	
	<!-- ********** 내장 객체의 값을 꺼낼 때는 반드시 EL을 사용한다. -->
	<c:if test="${num > 0}">
		<div>${num}은 양수입니다.</div>
	</c:if>
	<!-- else문은 없음 -->
	<c:if test="${num <= 0}">
		<div>${num}은 양수가 아닙니다.</div>
	</c:if>
	
	<h2>다중 조건문</h2>
	<c:choose>
		<c:when test="${num > 0}">양수</c:when>
		<c:when test="${num < 0}">음수</c:when>
		<c:otherwise>영</c:otherwise>
	</c:choose>
	
	<h2>반복문(일반 for + 향상된 for)</h2>
	
	<% for (int i=0; i<10; i++) { %>
		<div>숫자: <%= i %></div>
	<% } %>
	
	<c:forEach var="i" begin="0" end="9" step="1">
		<div>숫자: ${i}</div>
	</c:forEach>
	
	
	<%
		String[] names = {"홍길동", "아무개", "하하하", "호호호", "후후후"};
		pageContext.setAttribute("names", names);
	%>
	
	<c:set var="no" value="1"/>
	<table>
		<tr>
			<th>이름</th>
			<th>인덱스</th>
			<th>카운트</th>
			<th></th>
			<th>첫번째배열</th>
			<th>마지막배열</th>
			<th>c:set var="no"</th>
		</tr>
		<!-- for (String name : names) -->
		<c:forEach var="name" items="${names}" varStatus="status">
		<tr>
			<td>${name}</td>
			<td>${status.index}</td>
			<td>${status.count}</td>
			<td>${status.current}</td>
			<td>${status.first}</td>
			<td>${status.last}</td>
			<td>${no}</td>
		</tr>
		
		<c:set var="no" value="${no + 1}" />
		</c:forEach>
	</table>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>