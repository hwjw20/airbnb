<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 디테일 화면</title>
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
	<c:import url="/WEB-INF/jsp/include/detailHeader.jsp" />
	
	<div class="container detailBox">
		<article>
			<h5><b>영덕 완벽한 오션뷰 풀빌라 201</b></h5>
			<div class="d-flex justify-content-between">
				<div class="d-flex">
					<a href="#" class="small">후기 12개</a>
					<div class="small ml-1">· Ganggu-myeon, Yeongdeok-gun, 경상북도, 한국</div>
				</div>
				<button type="button" class="btn btn-link d-flex pr-5">
					<i class="small bi bi-heart"></i>
					<div class="ml-1 small">저장</div>
				</button>
			</div>
			<div class="d-flex">
				<img src="https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515_960_720.jpg" width="400" height="350">
				<div>
					<div class="pl-2">
						<img src="https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515_960_720.jpg" width="220" height="170">
						<img src="https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515_960_720.jpg" width="220" height="170">
					</div>
					<div class="pt-2 pl-2">
						<img src="https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515_960_720.jpg" width="220" height="170">
						<img src="https://cdn.pixabay.com/photo/2019/08/19/13/58/bed-4416515_960_720.jpg" width="220" height="170">
					</div>
				</div>
			</div>
		</article>
		<aside class="d-flex mt-3">
			<div id="descBox">
				<div>
					<div><b>지원님이 호스팅하는 숙소</b></div>
					<div class="small">최대 인원 6명·침대2개·욕실1개</div>
				</div>	
				<hr>
				<div class="d-flex">
					<i class="bi bi-door-open"></i>
					<div class="small pl-4">
						<div><b>셀프 체크인</b></div>
						<div>키패드를 이용해 셀프 체크인 하세요.</div>
					</div>
				</div>
				<div class="d-flex mt-4">
					<i class="bi bi-star"></i>
					<div class="small pl-4">
						<div><b>경험이 풍부한 호스트</b></div>
						<div>지원님은 다른 숙소에 대해 30개의 후기가 있습니다.</div>
					</div>
				</div>
				
				<div class="d-flex mt-4">
					<i class="bi bi-calendar"></i>
					<div class="small pl-4">
						<div><b>4월 13일까지 무료 취소</b></div>
					</div>
				</div>
				<hr>
				
				<div class="small">안녕하세요 저희는 어쩌고 ..........</div>
				<hr>
				
				<div class="ml-2">
					<div><b>숙박 장소</b></div>
					<div class="mt-2 small">공용공간</div>
					<div class="small">침대 2개</div>
				</div>
			</div>
			<hr>			
			<div id="reservBox" class="bg-warning mr-3">
			</div>
		</aside>
		<hr>
		<div id="mapBox" class="bg-success">
		</div>
	</div>
</body>
</html>