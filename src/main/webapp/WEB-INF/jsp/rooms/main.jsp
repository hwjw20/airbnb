<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
</head>
<body>
	<div id="wrap">
		<header>
			<div class="d-flex justify-content-between pt-3">
				
				<div class="d-flex pl-3">
					<div>로고</div>
					<h4 class="ml-2" style="color:#f52a4f">airbnb</h4>
				</div>
				
				<div class="input-group col-5">
			  		<input type="text" class="form-control">
			  		<div class="input-group-append">
			    		<button class="btn" type="button" style="background-color:#f52a4f"><i class="bi bi-search text-white"></i></button>
			  		</div>	
				</div>
				
				<div class="btn-group pr-3">
				  	<button type="button" class="btn btn-outline-secondary">
						<i class="bi bi-list"></i>
		    			<i class="bi bi-person-circle"></i>
				  	</button>
				</div>
			</div>
			<hr>
		</header>
		<section>
			<div id="tabMenu" class="bg-warning">
				<i class="bi bi-house"></i>
				<i class="bi bi-fire"></i>
			</div>
			<div id="roomList">
				<div id="card" class="">
					<img src="https://cdn.pixabay.com/photo/2013/07/19/00/18/water-165219__340.jpg" class="rounded" width="350">
					<div class="d-flex">
						<h4>구좌읍, 제주시, 한국</h4>
						<div><i class="bi bi-star-fill"></i>5.0</div>
					</div>	
				</div>
			
			</div>
		</section>
	</div>
</body>
</html>