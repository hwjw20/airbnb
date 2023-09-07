<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>airbnb</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script
	  src="https://code.jquery.com/jquery-3.6.3.min.js"
	  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	  crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header1.jsp" />
		
		<section>
			<!-- 숙소 타입 탭 메뉴 -->
			<div id="tabMenu" class="d-flex justify-content-around mt-4">
				<a href="/rooms/list/view">
					<div class="room-img pl-3"><img src="https://a0.muscache.com/pictures/3726d94b-534a-42b8-bca0-a0304d912260.jpg" width="30"></div>
					<div class="small">인기 급상승</div>
				</a>
				<a href="/rooms/list/view?type=1">
					<div><img src="https://a0.muscache.com/pictures/bcd1adc0-5cee-4d7a-85ec-f6730b0f8d0c.jpg" width="30"></div>
					<div class="small">해변</div>
				</a>
				<a href="/rooms/list/view?type=2">
					<img src="https://a0.muscache.com/pictures/51f5cf64-5821-400c-8033-8a10c7787d69.jpg" width="30">
					<div class="small">한옥</div>
				</a>
				<a href="/rooms/list/view?type=3">
					<div class="pl-1"><img src="https://a0.muscache.com/pictures/ca25c7f3-0d1f-432b-9efa-b9f5dc6d8770.jpg" width="30"></div>
					<div class="small">캠핑장</div>
				</a>
				<a href="/rooms/list/view?type=4">
					<div class="pl-3"><img src="https://a0.muscache.com/pictures/3b1eb541-46d9-4bef-abc4-c37d77e3c21b.jpg" width="30"></div>
					<div class="small">최고의 전망</div>
				</a>
				<a href="/rooms/list/view?type=5">
					<div class="pl-1"><img src="https://a0.muscache.com/pictures/6ad4bd95-f086-437d-97e3-14d12155ddfe.jpg" width="30"></div>
					<div class="small">주택</div>
				</a>
				<a href="/rooms/list/view?type=6">
					<div class="pl-1"><img src="https://a0.muscache.com/pictures/eb7ba4c0-ea38-4cbb-9db6-bdcc8baad585.jpg" width="30"></div>
					<div class="small">아파트</div>
				</a>
			</div>
			
			<!-- 숙소 리스트 -->
			<div id="roomList" class="d-flex flex-wrap">
				<c:forEach var="room" items="${roomList}">
				
				<div class="room">
					<div class="relative">
						<a href="/rooms/detail/view?roomId=${room.roomId}"><img class="rounded room-img mt-4" src="${room.imagePathList.get(0)}" class="rounded" width="250" height="200"></a>
					</div>
					<a href="/rooms/detail/view?roomId=${room.roomId}"><div class="d-flex small mt-1">
						<div>${room.address}</div>
						<div class="pl-2"><i class="bi bi-star-fill"></i>${room.rating}</div>
					</div></a>
					<div class="small">
						<div><b>₩${room.charge} /박</b></div>
					</div>
				</div>
				</c:forEach>
			</div>
		</section>
	</div>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	<script>
		$(document).ready(function() {
			
			$("#unlikeBtn").on("click", function() {
				let roomId = $(this).data("room-id");
				
				$.ajax({
					type:"get"
					, url:"/room/unlike"
					, data:{"roomId":roomId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("위시리스트 저장 취소 실패");
						}
					}
					, error:function() {
						alert("위시리스트 저장 취소 에러");
					}
			});
				
			$("#likeBtn").on("click", function() {
				let roomId = $(this).data("room-id");
				
				$.ajax({
					type:"get"
					, url:"/room/like"
					, data:{"roomId":roomId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("위시리스트 저장 실패");
						}
					}
					, error:function() {
						alert("위시리스트 저장 에러");
					}
				});
		});
	</script>
</body>
</html>