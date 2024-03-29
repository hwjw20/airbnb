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
	<section id="sec">
		<h4 class="font-weight-bold" style="display:inline">${userName } </h4><h6 style="display:inline">(${email })</h6><h4 class="font-weight-bold" style="display:inline"> 님, 반갑습니다!</h4><br>
		<div>
			<c:choose>
				<c:when test="${isHost }">
					<button type="button" class="btn mt-2" onclick="location.href='/host/become_a_host/host/view'">숙소 정보 수정하기</button><br>
					<h5 class="font-weight-bold mt-5">예약</h5>
					<div id="calendar" class="mt-3 mb-5" data-room-id="${roomId }"></div>
				</c:when>
				<c:otherwise>
					<article>
						<button type="button" class="btn float-left mt-5 ml-3" onclick="location.href='/host/become_a_host/host/view'">숙소 등록하기</button>
					</article>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		var roomId = $("#calendar").data("room-id");  

		var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {

        	eventColor: "#f52a4f",
            events: function(info, successCallback, failureCallback) {
            	$.ajax({
            		url: "/host/reservation/schedule"
	            	, success: function(data) {
	                    successCallback(data);
	                 }
            	});
            }
     		
        }); 
      
        calendar.render();
      });
		 
		
	        
	        
	</script>
</body>
</html>