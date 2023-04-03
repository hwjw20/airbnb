<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signin</title>
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
	<c:import url="/WEB-INF/jsp/include/header2.jsp" />
	
	<section>
		<div id="signinBox">
			<div class="container mt-3">
				<div class="text-center">로그인</div>
				<hr>
				<div class="small">에어비앤비에 오신 것을 환영합니다.</div>
				<form id="loginForm"></form>
				<input type="text" placeholder="이메일" class="form-control mt-4" id="emailInput" name="email">
				<div class="d-flex text-danger">
					<i id="warningIcon" class="bi bi-exclamation d-none"></i>				
					<div id="emailDiv" class="small pt-1 d-none">이메일을 입력하세요.</div>
					<div id="emailContainsDiv" class="small pt-1 d-none">이메일 형식이 올바르지 않습니다.</div>
				</div>
				<button type="button" class="form-control mt-2 text-white" id="signinBtn" style="background-color:#f52a4f">계속</button>
				<div class="text-center small text-secondary mt-4">또는</div>
				<button type="button" class="form-control mt-4 d-flex">
					<i class="bi bi-google"></i>
					<div class="small pl-5">구글로 로그인하기</div>
				</button>
				<button class="form-control mt-2 d-flex">
					<i class="bi bi-telephone-fill"></i>
					<div class="small pl-5">전화번호로 로그인하기</div>
				</button>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function() {
			
			$("#emailInput").on("input", function() {
				
				$("#warningIcon").addClass("d-none");
				$("#emailDiv").addClass("d-none");
				$("#emailContainsDiv").addClass("d-none");
				
			})
			
			$("#signinBtn").on("click", function() {
				
				let email = $("#emailInput").val();
				
				if(email == "") {
					$("#warningIcon").removeClass("d-none");
					$("#emailDiv").removeClass("d-none");
					return;
				}
				
				if(email.indexOf("@") == -1) {
					$("#emailContainsDiv").removeClass("d-none");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/signin/email"
					, data:{"email":email}
					, success:function(data) {
						if(data.result == "success") {
							location.href = "/user/signin/password/view";
						} else {
							location.href = "/user/signup/view";
						}
					}
					, error:function() {
						alert("로그인 에러");
					}
				})
				
			});
			
		});
	</script>
</body>
</html>