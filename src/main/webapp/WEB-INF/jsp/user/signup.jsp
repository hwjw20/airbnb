<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
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
	<c:import url="/WEB-INF/jsp/include/header2.jsp" />
	
	<section>
		<div id="signupBox">
			<div class="container mt-3">
				<div class="text-center">회원가입</div>
				<hr>
				<form id="signupForm">
					<input type="text" placeholder="이름" class="form-control mt-4" id="nameInput">
					<div class="d-flex text-danger">
						<i id="nameIcon" class="bi bi-exclamation d-none"></i>
						<div class="small pt-1 d-none" id="nameDiv">이름을 입력하세요.</div>
					</div>
					<input type="text" placeholder="생년월일" class="form-control mt-4" id="birthdayInput">
					<div class="d-flex text-danger">
						<i id="birthdayIcon" class="d-none bi bi-exclamation"></i>
						<div class="small d-none" id="birthdayDiv">생년월일을 입력하세요.</div>
					</div>
					<input type="text" placeholder="전화번호" class="form-control mt-4" id="phoneNumberInput">
					<div class="d-flex text-danger">
						<i id="phoneNumberIcon" class="d-none bi bi-exclamation"></i>
						<div class="small d-none" id="phoneNumberDiv">전화번호를 입력하세요.</div>
					</div>
					<input type="text" placeholder="이메일" class="form-control mt-4" id="emailInput">
					<div class="d-flex text-danger">
						<i id="emailIcon" class="d-none bi bi-exclamation"></i>
						<div class="small d-none" id="emailDiv">이메일을 입력하세요.</div>
						<div id="emailContainsDiv" class="small pt-1 d-none">이메일 형식이 올바르지 않습니다.</div>
					</div>
					<input type="password" placeholder="비밀번호" class="form-control mt-4" id="passwordInput">
					<div class="d-flex text-danger">
						<i id="passwordIcon" class="d-none bi bi-exclamation"></i>
						<div class="small d-none" id="passwordDiv">비밀번호를 입력하세요.</div>
					</div>
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
					<button type="submit" id="signupBtn" class="form-control mt-2 mb-3 text-white" style="background-color:#f52a4f">회원가입</button>
				</form>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function(){
			
			$("#birthdayInput").datepicker({
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
				,maxDate: 0
				,minDate: new Date("1900-01-01")
				,yearRange:"1900:2023"
			});
			
			$("#nameInput").on("input", function() {
				$("#nameIcon").addClass("d-none");
				$("#nameDiv").addClass("d-none");
			})
			$("#birthdayInput").on("input", function() {
				$("#birthdayIcon").addClass("d-none");
				$("#birthdayDiv").addClass("d-none");
			})
			$("#phoneNumberInput").on("input", function() {
				$("#phoneNumberIcon").addClass("d-none");
				$("#phoneNumberDiv").addClass("d-none");
			})
			$("#emailInput").on("input", function() {
				$("#emailIcon").addClass("d-none");
				$("#emailDiv").addClass("d-none");
				$("#emailContainsDiv").addClass("d-none");
			})
			$("#passwordInput").on("input", function() {
				$("#passwordIcon").addClass("d-none");
				$("#passwordDiv").addClass("d-none");
			})
			
			
			$("#signupForm").on("submit", function(e) {
				
				e.preventDefault();
				
				let name = $("#nameInput").val();
				let birthday = $("#birthdayInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let email = $("#emailInput").val();
				let password = $("#passwordInput").val();
				
				if(name == "") {
					$("#nameIcon").removeClass("d-none");
					$("#nameDiv").removeClass("d-none");
					return;
				}
				if(birthday == "") {
					$("#birthdayIcon").removeClass("d-none");
					$("#birthdayDiv").removeClass("d-none");
					return;
				}
				if(phoneNumber == "") {
					$("#phoneNumberIcon").removeClass("d-none");
					$("#phoneNumberDiv").removeClass("d-none");
					return;
				}
				if(email == "") {
					$("#emailIcon").removeClass("d-none");
					$("#emailDiv").removeClass("d-none");
					return;
				}
				if(email.indexOf("@") == -1) {
					$("#emailContainsDiv").removeClass("d-none");
					return;
				}
				if(password == "") {
					$("#passwordIcon").removeClass("d-none");
					$("#passwordDiv").removeClass("d-none");
					return;
				}
				
				if(!$("#check").is(":checked")) {
					alert("개인정보 수집 약관에 동의 해주세요.");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate_email"
					, data:{"email":email}
					, success:function(data) {
						if(data.duplicate) {
							alert("이미 가입된 이메일입니다.");
						} else {
							
							$.ajax({
								type:"post"
								, url:"/user/signup"
								, data:{"name":name, "birthday":birthday, "phoneNumber":phoneNumber, "email":email, "password":password}
								, success:function(data) {
									if(data.result == "success") {
										location.href="/user/signin/email/view";
									} else {
										alert("회원가입 실패");
									}
								}
								, error:function(){
									alert("회원가입 에러");
								}
							});
						}
					}
					, error:function() {
						alert("중복확인 에러");
					}
				});
				
			})
		});
	</script>
</body>
</html>