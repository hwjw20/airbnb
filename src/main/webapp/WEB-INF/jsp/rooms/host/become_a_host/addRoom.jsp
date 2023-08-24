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
	<div id="addRoomPage" class="mt-5">
		<div class="font-weight-bold">1�ܰ�</div>
		<h2 class="font-weight-bold">���� ������ �˷��ּ���.</h2><br>
		
		<div class="mb-4">
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">���� �� ���Ҹ� ���� �� �����ϴ� ���� �����ΰ���?</h4>
			</div>
			<select id="typeSelect" class="custom-select col-6 mt-1 ml-4">
				<option selected>-- Type --</option>
				<option value="beach">�غ�</option>
				<option value="hanok">�ѿ�</option>
				<option value="camping">ķ����</option>
				<option value="view">�ְ��� ����</option>
				<option value="mansion">����</option>
				<option value="apartment">����Ʈ</option>
			</select>
		</div>
		<div class="mt-4">
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">�Խ�Ʈ�� ����� ���� ������ �����ΰ���?</h4>
			</div>
			<div class="ml-2">
				<div class="small mt-1 ml-3">���ν�: �Խ�Ʈ�� ���νǿ��� ����������, �Ϻ� ������ ȣ��Ʈ�� �ٸ� ����� �Բ� ����� �� �ֽ��ϴ�.</div>
				<div class="small mt-1 ml-3">���ν�: �Խ�Ʈ�� ���� ���� ���� ȣ��Ʈ�� �ٸ� ����� �Բ� ���� ħ���̳� ���� �������� �����մϴ�.</div>
			</div>
			<select id="privacySelect" class="custom-select col-6 mt-3 ml-4">
				<option selected>-- Privacy --</option>
				<option value="private">���ν�</option>
				<option value="multi-person">���ν�</option>
			</select>
		</div>
		<div class="pt-4">
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">���� ��ġ�� ����ΰ���?</h4>
			</div>
			<button id="addressBtn" type="button" class="btn float-right">���ּ� �˻��ϱ�</button>
			<div id="addressDiv" class="mt-2 ml-4">
				<input type="text" class="form-control" placeholder="�ּ�" id="addressInput">
				<input type="text" class="form-control" placeholder="����" id="latInput">
				<input type="text" class="form-control" placeholder="�浵" id="lngInput">
				<div class="d-flex">
					<button class="btn mt-1" id="duplicateBtn">�ߺ�Ȯ��</button>
					<div id="duplicateDiv" class="d-none text-danger small ml-3 mt-3">�̹� ��ϵ� �����Դϴ�.</div>
					<div id="availableDiv" class="d-none text-danger small ml-3 mt-3">��� ������ �����Դϴ�.</div>
				</div>
			</div>
		</div>			
		<div class="pt-4 pb-3">
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">���� �⺻������ �˷��ּ���.</h4>
			</div>
			<div id="addressDiv" class="mt-2 ml-4">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="�Խ�Ʈ" id="headcountInput">
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
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">���� üũ���� �����Ѱ���?</h4>
				</div>
				<select class="custom-select col-6 mt-3 ml-4">
					<option id="selfCheckinSelect" selected>-- Type --</option>
					<option value="selfcheckin">���� üũ��</option>
					<option value="nSelfcheckin">��� üũ��</option>
				</select>
			</div>
			
		</div><hr class="mt-5 pb-3">
				
		<div class="font-weight-bold">2�ܰ�</div>
		<h2 class="font-weight-bold">���� �ŷ��� �����̰� �ϼ���.</h2><br>
		<div class="d-flex">
			<i class="bi bi-check-circle"></i>
			<div>
				<h4 class="font-weight-bold ml-2">������ �̸��� �����ּ���.</h4>
				<input id="roomNameInput" type="text" class="form-control" placeholder="���� �̸�">
			</div>
		</div>
		<div class="d-flex pt-4">
			<i class="bi bi-check-circle"></i>
			<div>
				<h4 class="font-weight-bold ml-2">���� �Ұ����� ���ּ���.</h4>
				<textarea rows="5" cols="130" style="resize:none" id="roomDescInput" class="form-control"></textarea>
			</div>
		</div>
		<div class="d-flex pt-4">
			<i class="bi bi-check-circle"></i>
			<h4 class="font-weight-bold ml-2">b&b ���� �߰��ϱ�</h4>
		</div>
		<div id="fileInputDiv" class="mt-1">
			<input type="file" id="fileInput" multiple class="d-none" onchange="readURL(this);">
			<img id="preview" width="200">
		</div> <hr class="pb-3">
				
		<div class="font-weight-bold">3�ܰ�</div>
		<h2 class="font-weight-bold">������ ������ �����ּ���.</h2><br>
		
		<div class="d-flex justify-content-center">
			<div class="input-group col-6">
				<input id="chargeInput" type="text" class="form-control">
				<div class="input-group-append">
					<span class="input-group-text">/��</span>			
				</div>
			</div>
		</div><br>

		<button type="button" id="uploadBtn" class="btn float-right mt-5 mb-5" style="background-color:#f52a4f; color:white">����ϱ�</button><br>
	
	</div>
	
	<script>
	
		const btn = document.querySelector("#addressBtn");
		btn.addEventListener("click", clickHandler);
		
		function clickHandler() {
			window.open("http://map.esran.com");
		}
		
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
			var isChecked = false;
			var isDuplicated = true;
			
			$("#latInput").on("input", function() {
				$("#duplicateDiv").addClass("d-none");
				$("#available").addClass("d-none");
			})
			
			$("#duplicateBtn").on("click", function() {
				let address = $("#addressInput").val();
				let lat = $("#latInput").val();
				let lng = $("#lngInput").val();

				if(address == "") {
					alert("�ּҸ� �Է��ϼ���.");
					return;
				}
				if(lat == "") {
					alert("������ �Է��ϼ���.");
					return;
				}
				if(lng == "") {
					alert("�浵�� �Է��ϼ���.");
					return;
				}
				
				if(isNaN(lat && lng)) {
					alert("����, �浵�� ���ڸ� �Է� �����մϴ�.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/host/room/is_duplicated"
					, data:{"lat":lat, "lng":lng}
					, success:function(data) {
						isChecked = true;
						
						if(data.is_duplicated) { //�ߺ���
							isDuplicated = true;
							
							$("#duplicateDiv").removeClass("d-none");
							$("#availableDiv").addClass("d-none");
						} else { //�ߺ����� ����
							isDuplicated = false;
							
							$("#duplicateDiv").addClass("d-none");
							$("#availableDiv").removeClass("d-none");
						}
					}
					, error:function() {
						alert("���� �ߺ� Ȯ�� ����");
					}
					
				});
				
			});
			
			$("#preview").on("click", function() {
				$("#fileInput").click();
			});
			
			$("#uploadBtn").on("click", function() {
				
				let type = $("#typeSelect").val();
				let privacy = $("#privacySelect").val();
				let address = $("#addressInput").val();
				let lat = $("#latInput").val();
				let lng = $("#lngInput").val();
				let headcount = $("#headcountInput").val();
				let bed = $("#bedInput").val();
				let bedroom = $("#bedroomInput").val();
				let bathroom = $("#bathroomInput").val();
				let selfCheckin = $("#selfCheckinSelect").val();
				let roomName = $("#roomNameInput").val();
				let roomDesc = $("#roomDescInput").val();
				let charge = $("#chargeInput").val();
				
				/* if(!isChecked) {
					alert("���� �ߺ� Ȯ���� ���ּ���.");
					return;
				} */
				
				// ������ ���õ��� �ʾ�����
				/* if($("#fileInput")[0].files.length == 0) {
					alert("������ �������ּ���");
					return;
				} */
				
				var formData = new FormData();
				for(let i = 0; i < $("#fileInput")[0].files.length; i++) {
					formData.append("file", $("#fileInput")[0].files[i]);
				}
				/* formData.append("type", type);
				formData.append("privacy", privacy);
				formData.append("address", address);
				formData.append("lat", lat);
				formData.append("lng", lng);
				formData.append("headcount", headcount);
				formData.append("bed", bed);
				formData.append("bedroom", bedroom);
				formData.append("bathroom", bathroom);
				formData.append("selfCheckin", selfCheckin);
				formData.append("roomName", roomName);
				formData.append("roomDesc", roomDesc);
				formData.append("charge", charge); */
				
				$.ajax({
					type:"post"
					, url:"/host/add_room"
					, data:{"type":type, "privacy":privacy, "address":address, "lat":lat, "lng":lng, "headcount":headcount, "bed":bed, "bedroom":bedroom, "bathroom":bathroom
						, "selfCheckin":selfCheckin, "roomName":roomName, "roomDesc":roomDesc, "charge":charge}
					, success:function(data) {
						if(data.result == "success") {
							alert("����");
						} else {
							alert("���� ��Ͽ� �����߽��ϴ�.");
						}
					}
					, error:function() {
						alert("���� ��� ����");
					}
				}); 
				
				
			});
		});
		

	</script>


</body>
</html>