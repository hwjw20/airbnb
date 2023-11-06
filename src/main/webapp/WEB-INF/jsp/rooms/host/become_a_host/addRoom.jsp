<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>숙소 등록</title>
	<script type="text/javascript" 
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=yzz1j3llgp&submodules=geocoder"></script>
	
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
		<div class="font-weight-bold">1단계</div>
		<h2 class="font-weight-bold">숙소 정보를 알려주세요.</h2><br>
		
		<div class="mb-4">
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">다음 중 숙소를 가장 잘 설명하는 것은 무엇인가요?</h4>
			</div>
			<select id="typeSelect" class="custom-select col-6 mt-1 ml-4">
				<option selected>-- Type --</option>
				<option value=1>해변</option>
				<option value=2>한옥</option>
				<option value=3>캠핑장</option>
				<option value=4>최고의 전망</option>
				<option value=5>주택</option>
				<option value=6>아파트</option>
			</select>
		</div>
		<div class="mt-4">
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">게스트가 사용할 숙소 유형은 무엇인가요?</h4>
			</div>
			<div class="ml-2">
				<div class="small mt-1 ml-3">개인실: 게스트는 개인실에서 숙박하지만, 일부 공간은 호스트나 다른 사람과 함께 사용할 수 있습니다.</div>
				<div class="small mt-1 ml-3">다인실: 게스트가 개인 공간 없이 호스트나 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다.</div>
			</div>
			<select id="privacySelect" class="custom-select col-6 mt-3 ml-4">
				<option selected>-- Privacy --</option>
				<option value="개인실">개인실</option>
				<option value="다인실">다인실</option>
			</select>
		</div>
		<div class="pt-4">
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">숙소 위치는 어디인가요?</h4>
			</div>
			<button id="addressBtn" type="button" class="btn float-right">상세주소 검색하기</button>
			<!-- <div id="addressDiv" class="mt-2 ml-4">
				<input type="text" class="form-control" placeholder="주소" id="addressInput">
				<input type="text" class="form-control" placeholder="위도" id="latInput">
				<input type="text" class="form-control" placeholder="경도" id="lngInput">
				<div class="d-flex">
					<button class="btn mt-1" id="duplicateBtn">중복확인</button>
					<div id="duplicateDiv" class="d-none text-danger small ml-3 mt-3">이미 등록된 숙소입니다.</div>
					<div id="availableDiv" class="d-none text-danger small ml-3 mt-3">등록 가능한 숙소입니다.</div>
				</div>
			</div> -->
			<input type="text" class="form-control" placeholder="주소" id="addressInput"></div>
			<div id="map">
			</div>
		</div>			
		<div class="pt-4 pb-3">
			<div class="d-flex">
				<i class="bi bi-check-circle"></i>
				<h4 class="font-weight-bold ml-2">숙소 기본정보를 알려주세요.</h4>
			</div>
			<div id="addressDiv" class="mt-2 ml-4">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="게스트" id="headcountInput">
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
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">셀프 체크인이 가능한가요?</h4>
				</div>
				<select id="selfCheckinSelect" class="custom-select col-6 mt-3 ml-4">
					<option selected>-- Type --</option>
					<option value=0>셀프 체크인</option>
					<option value=1>대면 체크인</option>
				</select>
			</div>
			
		</div><hr class="mt-5 pb-3">
				
		<div class="font-weight-bold">2단계</div>
		<h2 class="font-weight-bold">숙소 매력을 돋보이게 하세요.</h2><br>
		<div class="d-flex">
			<i class="bi bi-check-circle"></i>
			<div>
				<h4 class="font-weight-bold ml-2">숙소의 이름을 정해주세요.</h4>
				<input id="roomNameInput" type="text" class="form-control" placeholder="숙소 이름">
			</div>
		</div>
		<div class="d-flex pt-4">
			<i class="bi bi-check-circle"></i>
			<div>
				<h4 class="font-weight-bold ml-2">숙소 소개글을 써주세요.</h4>
				<textarea rows="5" cols="130" style="resize:none" id="roomDescInput" class="form-control"></textarea>
			</div>
		</div>
		<div class="d-flex pt-4">
			<i class="bi bi-check-circle"></i>
			<h4 class="font-weight-bold ml-2">b&b 사진 추가하기</h4>
		</div>
		
		<div class="fileInputDiv mt-1">
			<div>5개 사진 이미지를 업로드 해주세요.</div><br>
			<input type="file" id="fileInput" multiple="multiple">
		</div> <hr class="pb-3">
				
		<div class="font-weight-bold">3단계</div>
		<h2 class="font-weight-bold">숙소의 가격을 정해주세요.</h2><br>
		
		<div class="d-flex justify-content-center">
			<div class="input-group col-6">
				<input id="chargeInput" type="text" class="form-control">
				<div class="input-group-append">
					<span class="input-group-text">/박</span>			
				</div>
			</div>
		</div><br>

		<button type="button" id="uploadBtn" class="btn float-right mt-5 mb-5" style="background-color:#f52a4f; color:white">등록하기</button><br>
	
	</div>
	
	<script>
		$(document).ready(function() {
			
	
			var map = new naver.maps.Map("map", {
			    center: new naver.maps.LatLng(37.3595316, 127.1052133),
			    zoom: 15,
			    mapTypeControl: true
			});
		
			var infoWindow = new naver.maps.InfoWindow({
			    anchorSkew: true
			});
		
			map.setCursor('pointer');
			
			function searchAddressToCoordinate(address) {
			    naver.maps.Service.geocode({
			        query: address
			    }, function(status, response) {
			    	
			        if (status === naver.maps.Service.Status.ERROR) {
			            return alert('Something Wrong!');
			        }
		
			        var htmlAddresses = [],
			            item = response.v2.addresses[0],
			            point = new naver.maps.Point(item.x, item.y);
		
			        if (item.roadAddress) {
			            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
			        }
		
			        if (item.jibunAddress) {
			            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
			        }
		
			        if (item.englishAddress) {
			            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
			        }
		
			        infoWindow.setContent([
			            '<div style="padding:10px;min-width:200px;line-height:150%;">',
			            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
			            htmlAddresses.join('<br />'),
			            '</div>'
			        ].join('\n'));
		
			        map.setCenter(point);
			        infoWindow.open(map, point);
			    });
			}
		
			function initGeocoder() {
			    map.addListener('click', function(e) {
			        searchCoordinateToAddress(e.coord);
			    });
		
			    $('#address').on('keydown', function(e) {
			        var keyCode = e.which;
		
			        if (keyCode === 13) { // Enter Key
			            searchAddressToCoordinate($('#address').val());
			        }
			    });
		
			    $('#submit').on('click', function(e) {
			        e.preventDefault();
		
			        searchAddressToCoordinate($('#address').val());
			    });
		
			    searchAddressToCoordinate('정자동 178-1');
			}
		
			function makeAddress(item) {
			    if (!item) {
			        return;
			    }
		
			    var name = item.name,
			        region = item.region,
			        land = item.land,
			        isRoadAddress = name === 'roadaddr';
		
			    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';
		
			    if (hasArea(region.area1)) {
			        sido = region.area1.name;
			    }
		
			    if (hasArea(region.area2)) {
			        sigugun = region.area2.name;
			    }
		
			    if (hasArea(region.area3)) {
			        dongmyun = region.area3.name;
			    }
		
			    if (hasArea(region.area4)) {
			        ri = region.area4.name;
			    }
		
			    if (land) {
			        if (hasData(land.number1)) {
			            if (hasData(land.type) && land.type === '2') {
			                rest += '산';
			            }
		
			            rest += land.number1;
		
			            if (hasData(land.number2)) {
			                rest += ('-' + land.number2);
			            }
			        }
		
			        if (isRoadAddress === true) {
			            if (checkLastString(dongmyun, '면')) {
			                ri = land.name;
			            } else {
			                dongmyun = land.name;
			                ri = '';
			            }
		
			            if (hasAddition(land.addition0)) {
			                rest += ' ' + land.addition0.value;
			            }
			        }
			    }
		
			    return [sido, sigugun, dongmyun, ri, rest].join(' ');
			}
		
			function hasArea(area) {
			    return !!(area && area.name && area.name !== '');
			}
		
			function hasData(data) {
			    return !!(data && data !== '');
			}
		
			function checkLastString (word, lastString) {
			    return new RegExp(lastString + '$').test(word);
			}
		
			function hasAddition (addition) {
			    return !!(addition && addition.value);
			}
		
			naver.maps.onJSContentLoaded = initGeocoder;
		
		
			const btn = document.querySelector("#addressBtn");
			btn.addEventListener("click", clickHandler);
			
			function clickHandler() {
				window.open("http://map.esran.com");
			}
	
			
			var isChecked = false;
			var duplicateFlag = true;
			
			$("#latInput").on("input", function() {
				$("#duplicateDiv").addClass("d-none");
				$("#available").addClass("d-none");
			})
			
			$("#duplicateBtn").on("click", function() {
				let address = $("#addressInput").val();
				let lat = $("#latInput").val();
				let lng = $("#lngInput").val();

				if(address == "") {
					alert("주소를 입력하세요.");
					return;
				}
				if(lat == "") {
					alert("위도를 입력하세요.");
					return;
				}
				if(lng == "") {
					alert("경도를 입력하세요.");
					return;
				}
				
				if(isNaN(lat && lng)) {
					alert("위도, 경도는 숫자만 입력 가능합니다.");
					return;
				}
				
				$.ajax({
					type:"POST"
					, url:"/host/room/is_duplicated"
					, data:{"lat":lat, "lng":lng}
					, success:function(data) {
						isChecked = true;
						
						if(data.isDuplicated) { //중복됨
							duplicateFlag = true;
							
							$("#duplicateDiv").removeClass("d-none");
							$("#availableDiv").addClass("d-none");
						} else { //중복되지 않음
							duplicateFlag = false;
							
							$("#duplicateDiv").addClass("d-none");
							$("#availableDiv").removeClass("d-none");
						}
					}
					, error:function() {
						alert("숙소 중복 확인 에러");
					}
					
				});
				
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
				let roomDescription = $("#roomDescInput").val();
				let charge = $("#chargeInput").val(); 
				
				// 숙소 중복을 확인하지 않았을 때
				if(!isChecked) {
					alert("숙소 중복 확인을 해주세요.");
					return;
				}
				
				// 파일이 선택되지 않았을 때
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}
				
				var fileInput = document.getElementById("fileInput");
				var imagePath;
				
				var files = fileInput.files;
				var file;
				
				// room 테이블에 숙소 정보 삽입
				$.ajax({
					type:"get"
					, url:"/host/room/add"
					, data:{"type":type, "privacy":privacy, "address":address, "lat":lat, "lng":lng, "headcount":headcount, 
						"bed":bed, "bedroom":bedroom, "bathroom":bathroom, "selfCheckin":selfCheckin, "charge":charge, "roomName":roomName, "roomDescription":roomDescription}
					, success:function(data) {
						if(data.result == "success") {
							
							// imagePath 테이블에 이미지 경로 삽입
							for(var i = 0; i < files.length; i++) {
								file = files[i];
								imagePath = file.name;
								
								$.ajax({
									type:"post"
									, url:"/host/add_imagePath"
									, data:{"imagePath":imagePath}
									, success:function(data) {
										if(data.result == "success") {
											
										} else {
											alert("실패");
										}
									}
									, error:function() {
										alert("에러");
									}
								})
							}
							
							alert("숙소 등록에 성공하였습니다!");
							location.href="/host/become_a_host/view";
						} else {
							alert("숙소 등록에 실패했습니다. 다시 시도해주세요.");
						}
					}
					, error:function() {
						alert("숙소 등록 에러");
					}
				});
				
				
			});
		});
		

	</script>


</body>
</html>