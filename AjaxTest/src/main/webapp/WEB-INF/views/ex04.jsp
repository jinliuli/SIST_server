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
	<!-- ex04.jsp -->
	<h1>Ajax</h1>
	<!-- 
	<div>
		<h3></h3>
		<div><input type="button" value="" id="btn"></div>
		<div id="div"></div>
	</div> 
	-->
	
	<div>
		<h3>1. GET + 데이터 가져오기</h3>
		<div><input type="button" value="확인" id="btn1"></div>
		<div id="div1"></div>
	</div> 
	
	<div>
		<h3>2. GET + 데이터 보내기</h3>
		<div><input type="button" value="보내기" id="btn2"></div>
		<div><input type="text" id="txt2"></div>
	</div> 
	
	<div>
		<h3>3. GET + 데이터 주고 받기</h3>
		<div><input type="button" value="확인" id="btn3"></div>
		<div><input type="text" id="txt3"></div>
		<div id="div3"></div>
	</div> 
	
	<div>
		<h3>4. POST + 데이터 주고 받기</h3>
		<div><input type="button" value="확인" id="btn4"></div>
		<div><input type="text" id="txt4"></div>
		<div id="div4"></div>
	</div> 
	
	<div>
		<h3>5. jQuery</h3>
		<div><input type="button" value="확인" id="btn5"></div>
		<div><input type="text" id="txt5"></div>
		<div id="div5"></div>
	</div> 
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		/*
			
			동기 vs 비동기
			동기(synchronous) > 처음부터 끝까지 순차적으로 일을 처리하는 프로그램
			요청이 들어오면 순차적으로 작업을 수행하고 해당 작업이 수행중이면 다음 작업은 대기하게 된다.
			비동기(Asynchronous) > 순차적으로 일을 하다가 시간이 걸리는 일은 완료될 때까지 남겨두고 다음 일을 처리하는 프로그램
			요청이 들어오면 해당 요청에 의한 작업이 끝나지 않았더라도 계속 요청을 받는다. 그리고 후에 작업이 끝났다는 요청이 오면 그 때 해당 요청을 처리한다.
			
		
		
		*/
	
		$('#btn1').click(() => {
			
			const ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = ()=>{
				if (ajax.readyState == 4 && ajax.status == 200) {
					$('#div1').text(ajax.responseText);
				}
			};
			
			//true(비동기)응답끝나기전에 다른요청가능 > 멈춤기능을 없애기위해 Ajax는 비동기기능을 사용
			//false(동기)응답끝나기전에 다른요청불가 멈춤 > 응답끝나는 순서를 미리 알 수 있음
			ajax.open('GET', '/ajax/ex04data.do', true);
			ajax.send();
			
		});
		
		
		$('#btn2').click(() => {
			
			const ajax = new XMLHttpRequest();
			
			//서버로부터 가져올 데이터 없으면 
			//- ajax.onreadystatechange 구현안함		
			
			
			ajax.open('GET', '/ajax/ex04data.do?txt2=' + $('#txt2').val());
			ajax.send();
			
			
		});
		
		
		$('#btn3').click(()=>{
			
			const ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = ()=>{
				if (ajax.readyState == 4 && ajax.status == 200) {
					$('#div3').text(ajax.responseText);
				}
			};
			
			ajax.open('GET', '/ajax/ex04data.do?txt3=' + $('#txt3').val());
			ajax.send();
			
		});
		
		
		$('#btn4').click(()=>{
			
			const ajax = new XMLHttpRequest();
			

			ajax.onreadystatechange = ()=>{
				if (ajax.readyState == 4 && ajax.status == 200) {
					$('#div4').text(ajax.responseText);
				}
			};
			
			
			ajax.open('POST', '/ajax/ex04data.do');
			ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			
			
			//POST 데이터 전송
			ajax.send('txt4=' + $('#txt4').val());
			
		});
		
		
		
		/*
		function aaa() {
			function bbb() {
				
			}
		}
		aaa.bbb();
		*/
		
		$('#btn5').click(()=>{
			
			/*
			//1.
			//$('h1').css();원래 이런방식..			
			//특정 태그에 종속되지않은 함수 (함수안에 함수느낌)
			
			//데이터전송하는 ajax.send();와 같은 역할
			$.ajax({
				
				//페이지 요청 정보
				type: 'GET',
				url: '/ajax/ex04data.do',
				
				//결과 수신 이벤트
				succes: function(result) {
					$('#div5').text(result);
				}	
			});
			*/
			
			/*
			//2.
			$.ajax({
				type: 'GET',
				url: '/ajax/ex04data.do',
				data: 'txt2=' + $('#txt5').val()
			});
			*/
			
			/* 
			//3.
			$.ajax({
				type: 'GET',
				url: '/ajax/ex04data.do',
				data: 'txt3=' + $('#txt5').val(),
				success: function(result) {
					$('#div5').text(result);
				}
			}); 
			*/
			
			
			
			//4.
			$.ajax({
				type: 'POST',
				url: '/ajax/ex04data.do',
				data: 'txt4=' + $('#txt5').val(),
				success: function(result) {
					$('#div5').text(result);
				}
			});
			
			
			
			
		});
		
	
	</script>
</body>
</html>