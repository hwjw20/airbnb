<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���</title>
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
		
			<div class="font-weight-bold">1�ܰ�</div>
			<h2 class="font-weight-bold">���� ������ �˷��ּ���.</h2><br>
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">���� �� ���Ҹ� ���� �� �����ϴ� ���� �����ΰ���?</h4>
			</div>
			<select class="form-select float-right">
				<option selected>-- Type --</option>
				<option value="beach">�غ�</option>
				<option value="hanok">�ѿ�</option>
				<option value="camping">ķ����</option>
				<option value="view">�ְ��� ����</option>
				<option value="mansion">����</option>
				<option value="apartment">����Ʈ</option>
			</select>
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">�Խ�Ʈ�� ����� ���� ������ �����ΰ���?</h4>
				</div>
				<div class="ml-2">
					<div class="small mt-3 ml-3">���ν�: �Խ�Ʈ�� ���νǿ��� ����������, �Ϻ� ������ ȣ��Ʈ�� �ٸ� ����� �Բ� ����� �� �ֽ��ϴ�.</div>
					<div class="small mt-3 ml-3">���ν�: �Խ�Ʈ�� ���� ���� ���� ȣ��Ʈ�� �ٸ� ����� �Բ� ���� ħ���̳� ���� �������� �����մϴ�.</div>
				</div>
				<select class="form-select float-right">
					<option selected>-- Type --</option>
					<option value="private">���ν�</option>
					<option value="hanok">���ν�</option>
				</select>
			</div>
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">���� ��ġ�� ����ΰ���?</h4>
				</div>
				<div id="addressDiv" class="mt-2 ml-4">
					<input type="text" class="form-control" placeholder="�ּ�" id="addressInput">
					<input type="text" class="form-control" placeholder="����" id="latInput">
					<input type="text" class="form-control" placeholder="�浵" id="lngInput">
				</div>
			</div>			
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">���� �⺻������ �˷��ּ���.</h4>
				</div>
				<div id="addressDiv" class="mt-2 ml-4">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="�Խ�Ʈ" id="guestInput">
						<span class="input-group-text">��</span>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="ħ��" id="bedInput">
						<span class="input-group-text">��</span>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="ħ��" id="bedroomInput">
						<span class="input-group-text">��</span>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="���" id="bathroomInput">
						<span class="input-group-text">��</span>
					</div>
				</div>
			</div><hr class="mt-5">
					
			<div class="font-weight-bold">2�ܰ�</div>
			<h2 class="font-weight-bold">���� �ŷ��� �����̰� �ϼ���.</h2><br>
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">b&b ���� �߰��ϱ�</h4>
			</div>
			<div id="fileInputDiv">
				<input type="file" id="fileInput" onchange="readURL(this);">
				<img id="preview" width="200" onchange="readURL(this);">
			</div>	
			<button type="button" class="btn float-right">����ϱ�</button><br>
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