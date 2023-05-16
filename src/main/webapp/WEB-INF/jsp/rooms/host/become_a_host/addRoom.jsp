<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>숙소 등록</title>
	<script type="text/javascript" 
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=yzz1j3llgp"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  
	<script
	  src="https://code.jquery.com/jquery-3.6.3.min.js"
	  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	  crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com	/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/host_style.css" type="text/css">
</head>
<body>
	<div id="addRoomPage">
		
		<div id="typeDiv" class="mt-5">
		
			<div class="font-weight-bold">1단계</div>
			<h2 class="font-weight-bold">숙소 정보를 알려주세요.</h2><br>
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">다음 중 숙소를 가장 잘 설명하는 것은 무엇인가요?</h4>
			</div>
			<select class="form-select float-right">
				<option selected>-- Type --</option>
				<option value="beach">해변</option>
				<option value="hanok">한옥</option>
				<option value="camping">캠핑장</option>
				<option value="view">최고의 전망</option>
				<option value="mansion">주택</option>
				<option value="apartment">아파트</option>
			</select>
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">게스트가 사용할 숙소 유형은 무엇인가요?</h4>
				</div>
				<div class="ml-2">
					<div class="small mt-3 ml-3">개인실: 게스트는 개인실에서 숙박하지만, 일부 공간은 호스트나 다른 사람과 함께 사용할 수 있습니다.</div>
					<div class="small mt-3 ml-3">다인실: 게스트가 개인 공간 없이 호스트나 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다.</div>
				</div>
				<select class="form-select float-right">
					<option selected>-- Type --</option>
					<option value="private">개인실</option>
					<option value="hanok">다인실</option>
				</select>
			</div>
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">숙소 위치는 어디인가요?</h4>
				</div>
				<div id="addressDiv" class="mt-2 ml-4">
					<input type="text" class="form-control" placeholder="주소" id="addressInput">
					<input type="text" class="form-control" placeholder="위도" id="latInput">
					<input type="text" class="form-control" placeholder="경도" id="lngInput">
				</div>
			</div>			
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">숙소 기본정보를 알려주세요.</h4>
				</div>
				<div id="addressDiv" class="mt-2 ml-4">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="게스트" id="guestInput">
						<span class="input-group-text">명</span>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="침대" id="bedInput">
						<span class="input-group-text">개</span>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="침실" id="bedroomInput">
						<span class="input-group-text">개</span>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="욕실" id="bathroomInput">
						<span class="input-group-text">개</span>
					</div>
				</div>
			</div><hr class="mt-5">
					
			<div class="font-weight-bold">2단계</div>
			<h2 class="font-weight-bold">숙소 매력을 돋보이게 하세요.</h2><br>
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">b&b 사진 추가하기</h4>
			</div>
			<div id="fileInputDiv">
				<input type="file" id="fileInput" onchange="readURL(this);">
				<img id="preview" width="200" onchange="readURL(this);">
			</div>	
			<button type="button" class="btn float-right">등록하기</button><br>
		</div>
		
	</div>
	
	<script>
		
		function readURL(input) {
			if (input.files && input.files[0]) {
		    	var reader = new FileReader();
		    	
		    	reader.onload = function(e) {
		      		document.getElementById('preview').src = e.target.result;
		    	};
		    	
		    	reader.readAsDataURL(input.files[0]);
			  } else {
			  	document.getElementById('preview').src = "";
			  }
		}	
	
		$(document).ready(function() {
			
			$("#preview").on("click", function() {
				$("#fileInput").click();
			});
		});
		

	</script>
</body>
</html>