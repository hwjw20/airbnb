<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pop up</title>
	<script
		  src="https://code.jquery.com/jquery-3.6.3.min.js"
		  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		  crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<input type="file" id="fileInput">
	<button type="button" id="uploadBtn" class="btn">업로드</button>
	<script>
	$(document).ready(function() {
		$("#uploadBtn").on("click", function() {
			
			if($("#fileInput")[0].files == 0) {
				alert("파일을 선택해주세요.");
				return;
			}
			
			var formData = new FormData();
			formData.append("file", $("#fileInput")[0].files[0]);
			
			$.ajax({
				type:"post"
				, data:formData
				, enctype:"multipart/form-data"
				, processData:false
				, contentType:false
				, success:function(data) {
					if(data.result == "success") {
						alert("성공");
					} else {
						alert("업로드에 실패했습니다.");
					}
				}
				, error:function() {
					alert("업로드 에러");
				}
			});
			
		})
	})
	</script>
</body>

</html>