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
	<!-- ex05.jsp -->
	<h1>Kakao Map <small>새로운 마커 추가하기</small></h1>
	
	<div>
		<div id="map"></div>
	</div>
	
	<form method="POST" action="/api/add.do">
	<div>
		<input type="submit"  value="마커 추가하기">
	</div>
	<input type="hidden" name="lat">
	<input type="hidden" name="lng">
	</form>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef00a9579c4de664a8dcf691494c9b70"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		var container = document.getElementById('map');
		
		var options = { 
			center: new kakao.maps.LatLng(37.499347, 127.033207), 
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
		
		let m1 = null;
		
		//마커를 지도에 표시하기
		kakao.maps.event.addListener(map, 'click', function(evt) {
			
			//지도에 마커가 있다면? 삭제하기 > 마커는 한개만 표시하도록!
			if (m1 != null) {
				m1.setMap(null);
			}
			
			const path = '/api/images/default.png';
			const size = new kakao.maps.Size(64, 64);
			const op = {
				offset: new kakao.maps.Point(32, 64)
			};
			const mImg = new kakao.maps.MarkerImage(path, size, op);
			
			m1 = new kakao.maps.Marker({
				//position: new kakao.maps.LatLng(37.499347, 127.033207)
				position: evt.latLng
			});
						
			m1.setImage(mImg);
			m1.setMap(map);
			
			//전송을 위해 폼에 좌표값 복사하기
			$('input[name=lat]').val(evt.latLng.getLat());
			$('input[name=lng]').val(evt.latLng.getLng());
						
		});
	
	</script>
</body>
</html>