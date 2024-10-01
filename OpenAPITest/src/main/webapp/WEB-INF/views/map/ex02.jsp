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
		#map {
			width: 770px;
			height: 400px;
		}
	</style>
</head>
<body>
	<!-- ex02.jsp -->
	<h1>Kakao Map <small>좌표 이동 or 레벨 변경</small></h1>
	
	<div>
	<div id="map"></div>
	</div>
	<hr>
	<div>
		<input type="button" value="한독빌딩으로 이동하기" id="btn1">
		<input type="button" value="상암 경기장으로 이동하기" id="btn2">
		<input type="button" value="역삼역으로 이동하기" id="btn3">
	</div>
	<hr>
	<div>
		<input type="button" value="확대" id="btn4">
		<input type="button" value="축소" id="btn5">
	</div>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef00a9579c4de664a8dcf691494c9b70"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		//지도를 담을 영역의 DOM 레퍼런스
		var container = document.getElementById('map'); 
		
		//지도를 생성할 때 필요한 기본 옵션
		var options = { 
			center: new kakao.maps.LatLng(37.499311, 127.033228), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		
		//지도 생성 및 객체 리턴
		var map = new kakao.maps.Map(container, options);
		
		
		//상암 경기장으로 이동하기
		$('#btn2').click(()=>{
			const pos = new kakao.maps.LatLng(37.568316, 126.897271);
			//map.setCenter(pos);
			map.panTo(pos);
		});
		
		
		
		//한독빌딩으로 이동하기
		$('#btn1').click(()=>{
			const pos = new kakao.maps.LatLng(37.499311, 127.033228);
			//map.setCenter(pos);
			map.panTo(pos);
		});
		
		
		
		//역삼역으로 이동하기
		$('#btn3').click(()=>{
			const pos = new kakao.maps.LatLng(37.500363, 127.034867);
			//map.setCenter(pos);
			map.panTo(pos);
		});
		
		
		//확대
		$('#btn4').click(()=>{
			//map.setLevel(1);
			map.setLevel(map.getLevel() - 1);
		});
		
		//축소
		$('#btn5').click(()=>{
			//map.setLevel(14);
			map.setLevel(map.getLevel() + 1);
		});
		
		
		map.detDraggable(false);
		map.setZoomable(false);
		
		
	</script>
</body>
</html>