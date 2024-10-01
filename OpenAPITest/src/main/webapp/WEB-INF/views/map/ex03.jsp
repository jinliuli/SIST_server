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
	<!-- ex03.jsp -->
	<h1>Kakao Map <small>클릭이벤트 + 마커 표시</small></h1>
	
	<div>
		<div id="map"></div>
	</div>
	
	<div class="message"></div>
	
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
		
		
		//kakap.maps.event.addListener(지도, 이벤트, 콜백함수);
		kakao.maps.event.addListener(map, 'click', function(evt) {
			//alert(evt.latLng); //클릭한 좌표값
			
			let msg = `클릭한 위치는 위도(\${evt.latLng.getLat()}), 경도(\${evt.latLng.getLng()})입니다.`;
			$('.message').text(msg);
			
			
			//마커표시하기
			//1. 마커 객체를 생성한다.
			//2. 지도와 연결한다.
			
			//이미지 넣기
			const path = '/api/images/default.png';
			const size = new kakao.maps.Size(64, 64);
			const op = {
					offset: new kakao.maps.Point(32,64)
			};
			const mTag = new kakao.maps.MarkerImage(path, size, op);
			
			//위치표시
			const m1 = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(evt.latLng.getLat(), evt.latLng.getLng())
			});
			
			m1.setImage(mTag);
			m1.setMap(map);
			
		});
		
		
		
		/* 
		//기본값 위치확인
		//일반 마커 표시
		const home = new kakao.maps.Marker({
			position: options.center
		});
		
		home.setMap(map); 
		*/
		
		
		
		//이미지 마커 표시
		const path = '/api/images/marker.png';
		const size = new kakao.maps.Size(64, 64);
		const op = {
				offset: new kakao.maps.Point(0,64)
		};
		const mTag = new kakao.maps.MarkerImage(path, size, op);
		
		const home = new kakao.maps.Marker({
			position: options.center
		});
		
		
		home.setImage(mTag);
		home.setTitle('현재위치');
		home.setMap(map);
		
		
		
	</script>
</body>
</html>