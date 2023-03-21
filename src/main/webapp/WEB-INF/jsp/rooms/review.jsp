<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
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
	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header2.jsp" />
		<div id="reviewBox" class="d-flex justify-content-between">
		
			<div class="d-flex ml-5 mt-4">
				<h4><i class="bi bi-star-fill"></i></h4>
				<h4 class="ml-1">${room.rating} 후기 ${room.reviewCount}개</h4>
			</div>
			<div>
				<div class="input-group pr-5 mr-5 mt-4">
				  <span class="input-group-text"><i class="bi bi-search"></i></span>
				  <input type="text" class="form-control">
				</div>
				
				<div id="reviewList" class="mt-5 mr-5">
					<c:forEach var="review" items="${reviewList}">
						<div class="d-flex mt-3">
							<div>${review.userName }</div>
							<div class="small ml-2 mt-1">
								<fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월" />
							</div>
						</div>
						<div class="small">
							${review.content }
						</div>
					</c:forEach>
				</div>
			</div>
		
		</div>
	</div>
</body>
</html>