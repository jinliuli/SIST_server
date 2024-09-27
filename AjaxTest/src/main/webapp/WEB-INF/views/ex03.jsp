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
	<!-- ex03.jsp -->
	<h1>Ajax</h1>
	<!--  
		1. 버튼을 클릭
		2. 서버에게 데이터를 주세요~ 요청
		3. 응답된 데이터를 화면에 출력
	-->
	<form action="/ajax/ex03data.do">
		<div><a href="/ajax/ex03data.do">가져오기</a></div>
		<div><input type="submit" value="가져오기"></a></div>
		<div><input type="button" value="가져오기" id="btn1"></a></div>
		<hr>
		<div class="message">${data}</div>
		
	</form>
	
	<hr>
	<div>
		다른 업무: <input type="text">
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		$('#btn1').click(() => {
			
			//서버와 통신할 수 있는 자바스크립트 객체
			const ajax = new XMLHttpRequest();
			//alert(ajax.readyState); //0
			
			//on + readystate change
			//readyState: ajax 객체의 상태를 표현하는 말
			
			//이벤트형식 > 비동기방식
					//메서드 반환값형식 > 동기방식 result = ajax.send()로 메서드형식으로 보낼수도있지만 서버의 사용자 서핑 상황을 편하게 하기위해  비동기방식을 권장함
			ajax.onreadystatechange = function() {
				//console.log(111);
				//$('.message').append(`<div>\${ajax.readyState}</div>`);
				//$('.message').append(`<div>\${ajax.status}</div>`);
				//return;
				
				if(ajax.readyState == 4 && ajax.status == 200) { 
					//ajax.readyState == 4: 데이터를 전부 받은 상태, 완료되었다
					//ajax.status == 200: 서버가 요청을 Success(성공)적으로 처리하였다.
					//서버에 요청한 응답이 돌아오는 시점!!
					
					//서버가 ajax 객체에 돌려준 데이터
					$('.message').text(ajax.responseText);
				}
				
			};
			
			//<form method="GET" action="/ajax/data.txt>"
			//ajax.open('GET', '/ajax/data.txt') //연결(X), 설정(O)
			ajax.open('GET', '/ajax/ex03data.do')
			
			//<input type="submit"> > 클릭
			ajax.send(); //실제로 ajax객체가 서버에 연결
			
		});
	
	</script>
</body>
</html>