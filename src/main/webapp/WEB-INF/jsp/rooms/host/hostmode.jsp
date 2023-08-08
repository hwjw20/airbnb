<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jiwon.airbnb.reservation.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 모드</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  
	<script
	  src="https://code.jquery.com/jquery-3.6.3.min.js"
	  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	  crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	<!-- 부트스트랩 아이콘 -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  	
  	<!-- 풀캘린더 -->
  	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>
  	
  	<link rel="stylesheet" href="/static/css/host_style.css" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/hostheader.jsp" />
	<section>
		<h4 class="font-weight-bold" style="display:inline">지원 </h4><h6 style="display:inline">(${email })</h6><h4 class="font-weight-bold" style="display:inline"> 님, 반갑습니다!</h4><br>
		<div>
			<c:choose>
				<c:when test="${isHost }">
				<button type="button" class="btn mt-2" onclick="location.href='/host/become_a_host/host/view'">숙소 정보 수정하기</button><br>
				<h5 class="font-weight-bold mt-5">예약</h5>
				<div id="calendar" class="mt-3" data-user-id="${userId }" data-room-id="${roomId }"></div>
				</c:when>
				<c:otherwise>
				<button type="button" class="btn float-right" onclick="location.href='/host/become_a_host/host/view'">숙소 등록하기</button><br>
				</c:otherwise>
			</c:choose>
			<div id="calendar"></div>
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	<script>
		
		document.addEventListener('DOMContentLoaded', function() {
			
			var userId = $("#calendar").data("user-id");
			var roomId = $("#calendar").data("room-id");
			
			var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {

	        	expandRows: true, // 화면에 맞게 높이 재설정
	            initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	            navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	            editable: false, // 수정 가능?
	            selectable: false, // 달력 일자 드래그 설정가능
	            nowIndicator: true, // 현재 시간 마크
	            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	            locale: 'ko', // 한국어 설정
	            events:function(info, successCallback, failureCallback){
	                
	            	$.ajax({
	            		url: "/host/reservation/getSchedule"
	            		, data: {}
	            		, success: function(data) {
	            			successCallback(data);
	            		}
	            	});
	            	
	            }    		
	        }); //fullcalendar end
	      
	        calendar.render();
		});
		
		
	        
	        
	</script>
</body>
</html>