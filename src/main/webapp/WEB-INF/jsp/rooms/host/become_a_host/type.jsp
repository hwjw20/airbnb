<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소등록</title>
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
  	
  	<link rel="stylesheet" href="/static/css/host_style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/hostheader.jsp" />
		<section>
			<div id="typeDiv">
				<h2 class="font-weight-bold">다음 중 숙소를 가장 잘 설명하는 것은 무엇인가요?</h2><br>
				<div id="typeBox" class="ml-3">
					<div class="d-flex justify-content-around">
						<a href="#"><div class="typeBtn rounded text-center pt-2" style="border:1px solid">해변</div></a>
						<a><div class="typeBtn rounded text-center pt-2" style="border:1px solid">한옥</div></a>
						<a><div class="typeBtn rounded text-center pt-2" style="border:1px solid">캠핑장</div></a>
					</div>
					<div class="d-flex justify-content-around mt-3">
						<a><div class="typeBtn rounded text-center pt-2" style="border:1px solid">최고의 전망</div></a>
						<a><div class="typeBtn rounded text-center pt-2" style="border:1px solid">주택</div></a>
						<a><div class="typeBtn rounded text-center pt-2" style="border:1px solid">아파트</div></a>
					</div>	
				</div>
				<button class="btn btn-secondary float-right mt-5">다음</button>
			</div>
		</section>
	</div>
</body>
</html>