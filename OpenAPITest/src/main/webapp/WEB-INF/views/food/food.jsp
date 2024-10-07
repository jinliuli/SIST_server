<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<link href="/api/star/star-rating.css" rel="stylesheet">
	<style>
		#map {
			width: 1170px;
			height: 400px;
			border: 1px solid #CCC;
		}
		.main > button {
			float: right;
			border: 0;
			background-color: #FFF;
			margin-top: 10px;
		}
		.main > button:hover {
			color: tomato;
		}
		
		#map2 {
			width: 490px;
			height: 300px;
			border: 1px solid #CCC;
		}
		#form1 table {
			width: 490px;
		}
		
		#list {
			display: grid;
			grid-template-columns: repeat(3, 382px);
			gap: 10px;
		}
		
		#list .item {
			border: 1px solid #CCC;
			border-radius: 3px;
			display: grid;
			grid-template-columns: 84px auto;
			grid-template-rows: 84px auto;
		}
		
		#list .item:hover {
			border-color: #555;
		}
		
		#list .item > img {
			margin: 10px;
		}
		
		#list .item > div > div {
			margin-top: 5px;
		}
		
		#list .item > div > div:first-child {
			margin-top: 15px;
			color: cornflowerblue;
			font-weight: bold;
		}
		#list .item > div:last-child {
			grid-column: 1/3;
			padding: 15px;
		}
		
	</style>
</head>
<body class="wide">
	<!-- food.jsp -->
	<<h1 class="main">
		Food <small>맛집 리스트</small>
		<button class="add" data-modal-button="add">추가하기</button>
	</h1>
	
	<div>
		<div id="map"></div>
	</div>
	
	<hr>
	
	<div id="list">
		<!-- 
		<div class="item">
			<img src="/api/marker/bakery.png">
			<div>
				<div>장소명</div>
				<div>주소</div>
				<div>별점</div>
			</div>
			<div>
				메뉴
			</div>
		</div>
		 -->
	</div>
	
	<!-- 팝업창 -->
	<div data-modal-window="add" data-modal-title="맛집추가하기">
		<div id="map2"></div>
		<form id="form1">
		<table>
			<tr>
				<th>장소명</th>
				<td><input type="text" name="name" id="name" class="full"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category" id="category">
					<c:forEach items="${clist}" var="cdto">
						<option value="${cdto.seq}"
							data-img="${cdto.img}">
							${cdto.name}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="address" class="full"></td>
			</tr>
			<tr>
				<th>별점</th>
				<td>
					<select class="star-rating" name="star" id="star">
					    <option value="">Select a rating</option>
					    <option value="5">Excellent</option>
					    <option value="4">Very Good</option>
					    <option value="3" selected>Average</option>
					    <option value="2">Poor</option>
					    <option value="1">Terrible</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>메뉴</th>
				<td><textarea name="menu" id="menu" class="full"></textarea></td>
			</tr>
		</table>
		<div>
			<button type="button" class="ok" data-modal-ok="add">추가하기</button>
			<button type="button" class="cancle" data-modal-cancle="add">취소하기</button>
		</div>
		<input type="hidden" name="lat">
		<input type="hidden" name="lng">
		</form>
		
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef00a9579c4de664a8dcf691494c9b70&libraries=services"></script>
	<script src="/api/star/star-rating.js"></script>
	
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	
		let map;
		let m2 = null;
	
	//map
		function init() {
			const container = document.getElementById('map'); 
			const options = { 
				center: new kakao.maps.LatLng(37.499311, 127.033228),
				level: 3
			};
			map = new kakao.maps.Map(container, options);
		
		}//init
		
	//map2
		function addMap() {
			const container = document.getElementById('map2'); 
			const options = { 
				center: new kakao.maps.LatLng(37.499311, 127.033228),
				level: 3 
			};
			const map = new kakao.maps.Map(container, options);
			
			let m1 = null;
			
			kakao.maps.event.addListener(map, 'click', function(evt) {
				
				
				//마커를 1개만 찍히게 하기
				if (m1 != null) {
					m1.setMap(null);
				}
				
				//카테고리대로 마커이미지 바꾼거 그대로 냅두기
				let img = null;
				$('#category').children().each((index, item) => {
					if (item.selected) {
						img = $(item).data('img');
					}
				});
				const path = '/api/marker/' + img; //카테고리대로 마커이미지 바꾸기
				const size = new kakao.maps.Size(64, 64);
				const op = {
					offset: new kakao.maps.Point(32, 96)
				};
				const mImg = new kakao.maps.MarkerImage(path, size, op);
				
				
				
				m1 = new kakao.maps.Marker({
					position: evt.latLng
				});
							
				m1.setImage(mImg);
				m1.setMap(map);
				
				$('input[name=lat]').val(evt.latLng.getLat());
				$('input[name=lng]').val(evt.latLng.getLng());
				
				
				//추가한 장소의 주소 검색하기
				const geocoder = new kakao.maps.services.Geocoder();
				//geocoder.coord2Address(경도,위도,콜백함수);
				geocoder.coord2Address(evt.latLng.getLng()
									 , evt.latLng.getLat()
									 , function (result, status) {
					//alert();
					
					if (status == kakao.maps.services.Status.OK) {
						
						$('#address').val(result[0].road_address.address_name);
						
					} else {
						alert('해당 위치의 주소를 찾지 못하였습니다.')
					}
				
				});
				
				
			});//addMap > click
			
			//별점StarRating
			const stars = new StarRating('#star');
			
			//카테고리 변경시 마커 이미지도 같이 변경
			$('#category').change(function() {
				
				//alert($(this).val());
				//alert($(this).data('img'));
				
				
				$(this).children().each((index, item) => {
					if (item.selected) {
						//alert($(item).data('img')); //harbor.png
						
						const path = '/api/marker/' + $(item).data('img');
						const size = new kakao.maps.Size(64, 64);
						const op = {
							offset: new kakao.maps.Point(32, 96)
						};
						const mImg = new kakao.maps.MarkerImage(path, size, op);
						
						
						
					}
				});
				
			});
			
			
		}//addMap
		
		
		//map
		init();
		
		//map2
		$('.main .add').click(()=>{
			//팝업창 띄우고 지도가 나타나서 0.2초의 딜레이를 줘야됨
			setTimeout(addMap, 200);
			
		});
		
		
		
		
		$('#form1 .ok').click(()=>{
			
			//alert($('#form1').serialize());
			
			$.ajax({
				type: 'POST',
				url: '/api/addfood.do',
				/* data: {
					lat: 111,
					lng: 222,
					name: '중국집',
					category: 1
				} */
				data: $('#form1').serialize(),
				
				dataType: 'json',
				success: function(result) {
					
				},
				error: function(a,b,c) {
					console.log(a,b,c)
				}
				
			});
			
		});
		
		
		
		
		function load() {
			
			$.ajax({
				type: 'GET',
				url: '/api/listfood.do',
				dataType: 'json',
				success: function(arr) {
					
					//초기화
					$('#list').html('');
					
					//리스트별로 아래 보여주기
					$(arr).each((index, item)=>{
						//한개씩 꺼내화서 보여주기
						$('#list').append(`
						
							<div class="item" data-lat="\${item.lat}" data-lng="\${item.lng}" data-img="\${item.category.img}">
								<img src="/api/marker/\${item.category.img}">
								<div>
									<div>\${item.name}</div>
									<div>\${item.address}</div>
									<div>
										<select class="star" disabled>//읽기모드로 하는문장disabled
										    <option value="5"></option>
										    <option value="4"></option>
										    <option value="3"></option>
										    <option value="2"></option>
										    <option value="1"></option>
										</select>
									</div>
								</div>
								<div>
									<pre>\${item.menu}</pre>
								</div>
							</div>
								
						`);//append
						
								/* 
								<div>
									<pre>\${item.menu}</pre> 이거 대신 넣기
									\${item.menu.replace(/\r\n/g, '<br>')} 
								</div>
								*/
						
						//마지막꺼에 별점 널기
						$('#list > div:last-child select').val(item.star);
						
					});
					
					
					
					
					
					
					//숫자 말고 별점으로 보여주기StarRating
					new StarRating('.star');
					
					//별점 옆에 검정색 태그 없애기
					$('.star').parent().css('--gl-tooltip-background', 'transparent');
					
					
					

					
					$('.item').click(()=>{
						//alert();
						$('.item').css('background-color', 'transparent');
						
						$(event.currentTarget).css('background-color', 'rgba(255, 215, 0, .25)');
						
						const lat = $(event.currentTarget).data('lat');
						const lng = $(event.currentTarget).data('lng');
						const img = $(event.currentTarget).data('img');
						
						console.log(lat, lng, img);
						
						
						//마커를 1개만 찍히게 하기
						if (m2 != null) {
							m2.setMap(null);
						}
						
						const path = '/api/marker/' + img;
						const size = new kakao.maps.Size(64, 64);
						const op = {
							offset: new kakao.maps.Point(32, 96)
						};
						const mImg = new kakao.maps.MarkerImage(path, size, op);
						
						
						
						m2 = new kakao.maps.Marker({
							position: new kakao.maps.LatLng(lat, lng)
						});
									
						m2.setImage(mImg);
						m2.setMap(map);
						
						map.panTo(new kakao.maps.LatLng(lat, lng));
						
						$('html, body').animate({
			                scrollTop: 0
			            }, 500);
						
					});
					
					
				}, //success
				error: function(a,b,c) {
					console.log(a,b,c)
				}
			});
			
		}
		
		load();
		
		
		
	</script>
</body>
</html>