<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
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
	<c:import url="/WEB-INF/jsp/include/header1.jsp"></c:import>
	<div id="reservationDiv">
		<h5 class="mt-5"><b>위시리스트</b></h5>
		<hr>
		<c:choose>
			<c:when test="${fn:length(roomList) != 0 }">
				<c:forEach var="room" items="${roomList}">
					<div id="reservation" class="d-flex justify-content-between mt-5">
						<a href="/rooms/detail/view?roomId=${room.roomId}"><div class="mt-4 ml-5">
							<div><b>${room.address}</b></div>
							<div class="small">${room.roomName}</div>
							<div class="mt-3">₩${room.charge} /박</div>
						</div></a>
						<div>
							<a href="/rooms/detail/view?roomId=${room.roomId}"><img width="300" height="150" src="${room.imagePathList.get(0) }"></a>
						</div>
						
						
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="mt-5 ml-3"><b>아직 예약된 여행이 없습니다!</b></div>
			</c:otherwise>
		</c:choose>
		
	</div>
</body>
</html>