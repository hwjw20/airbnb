<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 디테일 화면</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  
	<script
	  src="https://code.jquery.com/jquery-3.6.3.min.js"
	  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	  crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/detailHeader.jsp" />
	
	<div class="container detailBox">
		<article>
			<h5><b>${room.roomName}</b></h5>
			<div class="d-flex justify-content-between">
				<div class="d-flex small">
					<div class="d-flex">
						<i class="bi bi-star-fill"></i>
						<div class="ml-1">${room.rating}</div>
					</div>
					<a href="/rooms/detail/review?roomId=${room.roomId }" class="ml-2">후기 ${room.reviewCount }개</a>
					<div class="ml-1">· ${room.address }</div>
				</div>
				<button type="button" class="btn btn-link d-flex pr-5">
					<i class="small bi bi-heart"></i>
					<div class="ml-1 small">저장</div>
				</button>
			</div>
			<div class="d-flex">
				<img src="${room.imagePathList.get(0)}" width="400" height="350">
				<div>
					<div class="pl-2">
						<img src="${room.imagePathList.get(1)}" width="220" height="170">
						<img src="${room.imagePathList.get(1)}" width="220" height="170">
					</div>
					<div class="pt-2 pl-2">
						<img src="${room.imagePathList.get(1)}" width="220" height="170">
						<img src="${room.imagePathList.get(1)}" width="220" height="170">
					</div>
				</div>
			</div>
		</article>
		<aside class="d-flex mt-3">
			<div id="descBox">
				<div>
					<div><b>${room.hostName}님이 호스팅하는 숙소</b></div>
					<div class="small">최대 인원 ${room.headcount}명·침대${room.bed}개·욕실${room.bathroom}개</div>
				</div>	
				<hr>
				
				<c:if test="${room.selfCheckin eq 1}">
					<div class="d-flex">
						<i class="bi bi-door-open"></i>
						<div class="small pl-4">
							<div><b>셀프 체크인</b></div>
							<div>키패드를 이용해 셀프 체크인 하세요.</div>
						</div>
					</div>
				</c:if>
				
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
				
				<div class="small">${room.roomDescription }</div>
				<hr>
				
				<div class="ml-2">
					<div><b>숙박 장소</b></div>
					<div class="d-flex mt-2">
						<div class="small mr-3">${room.privacy }</div>
						<div class="small mr-3">침대 ${room.bed }개</div>
						<div class="small mr-3">침실 ${room.bedroom }개</div>
						<div class="small mr-3">화장실 ${room.bathroom }개</div>
					</div>
				</div>
			</div>
			<hr>			
			<div id="reservBox" class="container pt-3 mr-3">
				<div><b>₩${room.charge} /박</b></div>
				<div class="d-flex mt-4">
					<input type="text" placeholder="체크인" id="checkinInput" class="form-control">
					<input type="text" placeholder="체크아웃" id="checkoutInput" class="form-control">
				</div>
				<select class="form-select" id="headcountSelect">
					<option selected>인원</option>
					
				</select>
				<button type="button" class="btn form-control mt-4 mb-4 text-white" id="reservBtn" style="background-color:#f52a4f">예약하기</button>
				<hr>
				<div class="d-flex justify-content-between">
					<b><div>총 합계</div></b>
					<b><div>₩230,000</div></b>
				</div>
			</div>
		</aside>
		<hr>
		<div id="mapBox" class="bg-success">
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			
			
			$("#checkinInput").datepicker({
				dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
	            ,dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				,dateFormat: "yy년 mm월 dd일"
				,showOtherMonths: true 
		        ,showMonthAfterYear:true
		        ,changeYear: true
		        ,changeMonth: true 
				,changeMonth:true
				,changeYear:true
				,minDate:0
				,onSelect:function (dateText) {
                    $("#checkoutInput").datepicker('option', 'minDate', dateText);
                }
			});
			
			$("#checkoutInput").datepicker({
				dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
	            ,dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				,dateFormat: "yy년 mm월 dd일"
				,showOtherMonths: true 
		        ,showMonthAfterYear:true
		        ,changeYear: true
		        ,changeMonth: true 
				,changeMonth:true
				,changeYear:true
			});
			
			
			$("#reservBtn").on("click", function() {
				let checkin = $("#checkinInput").val();
				let checkout = $("#checkoutInput").val();
				alert(checkin);
				
			});
		});
	</script>
</body>
</html>