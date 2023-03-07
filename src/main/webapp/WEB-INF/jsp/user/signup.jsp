<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
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
		<div id="signupBox">
			<div class="container mt-3">
				<div class="text-center">회원가입</div>
				<hr>
				<input type="text" placeholder="이름" class="form-control mt-4">
				<input type="text" placeholder="생년월일" class="form-control mt-4">
				<input type="text" placeholder="이메일" class="form-control mt-4">
				<input type="password" placeholder="비밀번호" class="form-control mt-4">
				<input type="text" placeholder="전화번호" class="form-control mt-4">
				<hr>
				<div class="d-flex justify-content-between">
					<div class="small">개인 정보 수집 및 이용에 동의합니다.</div>
					<input type="checkbox" id="check" value="check">
				</div>
				<div class="d-flex justify-content-between">
					<div class="small">마케팅 이메일 수신을 원합니다.(선택)</div>
					<input type="checkbox">
				</div>
				<br>
				<button id="signupBtn" class="form-control mt-2 text-white" style="background-color:#f52a4f">회원가입</button>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function(){
			$("#signupBtn").on("click", function() {
				if(!$("#check").is(":checked")) {
					alert("개인정보 수집 약관에 동의 해주세요.");
					return;
				}
			})
		});
	</script>
</body>
</html>