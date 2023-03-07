<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find password</title>
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
				<div class="text-center">비밀번호를 잊으셨나요?</div>
				<hr>
				<input type="text" placeholder="비밀번호" class="form-control mt-4" id="passwordInput" data-email="${email}">
				<div class="d-flex text-danger">
					<i id="warningIcon" class="bi bi-exclamation d-none"></i>				
					<div id="passwordDiv" class="small pt-1 d-none">비밀번호를 입력하세요.</div>
				</div>
				<button class="form-control mt-2 text-white" style="background-color:#f52a4f" id="signinBtn">로그인</button>
				<a href="/user/find_pw/view"><div class="small mt-4" style="text-decoration: underline;">비밀번호를 잊으셨나요?</div></a>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function() {
			
			$("#passwordInput").on("input", function() {
				$("#warningIcon").addClass("d-none");
				$("#passwordDiv").addClass("d-none");
			})
			
			
			$("#signinBtn").on("click", function() {
				let password = $("#passwordInput").val();
				let email = $("#passwordInput").data("email");
				
				if(password == "") {
					$("#warningIcon").removeClass("d-none");
					$("#passwordDiv").removeClass("d-none");
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signin/password"
					, data:{"email":email, "password":password}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/rooms/list/view";
						} else {
							alert("일치하는 회원이 없습니다.");
						}
					}
					, error:function() {
						alert("로그인 에러");
					}
				});
			});
		});
	</script>
</body>
</html>