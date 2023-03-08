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
			<div id="tabMenu" class="d-flex justify-content-around pt-2">
				<a>
					<div class="room-img pl-3"><img src="https://a0.muscache.com/pictures/3726d94b-534a-42b8-bca0-a0304d912260.jpg" width="30"></div>
					<div class="small">인기 급상승</div>
				</a>
				<a>
					<div><img src="https://a0.muscache.com/pictures/bcd1adc0-5cee-4d7a-85ec-f6730b0f8d0c.jpg" width="30"></div>
					<div class="small">해변</div>
				</a>
				<a>
					<img src="https://a0.muscache.com/pictures/51f5cf64-5821-400c-8033-8a10c7787d69.jpg" width="30">
					<div class="small">한옥</div>
				</a>
				<a>
					<div class="pl-1"><img src="https://a0.muscache.com/pictures/ca25c7f3-0d1f-432b-9efa-b9f5dc6d8770.jpg" width="30"></div>
					<div class="small">캠핑장</div>
				</a>
				<a >
					<div class="pl-1"><img src="https://a0.muscache.com/pictures/eb7ba4c0-ea38-4cbb-9db6-bdcc8baad585.jpg" width="30"></div>
					<div class="small">개인실</div>
				</a>
				<a >
					<div class="pl-3"><img src="https://a0.muscache.com/pictures/3b1eb541-46d9-4bef-abc4-c37d77e3c21b.jpg" width="30"></div>
					<div class="small">최고의 전망</div>
				</a>
			</div>
			
			<div id="roomList" class="d-flex flex-wrap">
			
				<c:forEach var="room" items="${roomList}">
				<div class="room">
					<div class="relative">
						<div class="room-like"><i class="bi bi-heart text-white"></i></div>
						<img class="room-img" src="https://cdn.pixabay.com/photo/2013/07/19/00/18/water-165219__340.jpg" class="rounded" width="250" height="200">
					</div>
					<div class="d-flex small">
						<div>구좌읍, 제주시, 한국</div>
						<div class="pl-2"><i class="bi bi-star-fill"></i>5.0</div>
					</div>
					<div class="small">
						<div><b>₩180,000 /박</b></div>
					</div>
				</div>
				</c:forEach>
				
				
				
			</div>
		</section>
	</div>
</body>
</html>