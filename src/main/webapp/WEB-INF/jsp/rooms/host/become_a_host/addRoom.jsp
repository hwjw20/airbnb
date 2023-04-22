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
	<div id="wrap">
		
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
					<input type="text" class="form-control" placeholder="��/��">
					<input type="text" class="form-control" placeholder="����">
					<input type="text" class="form-control" placeholder="���θ�">
					<input type="text" class="form-control" placeholder="����Ʈ �̸�, ��ȣ�� ��(����)">
					<input type="text" class="form-control" placeholder="�����ȣ">
				</div>
			</div>			
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">���� �⺻������ �˷��ּ���.</h4>
				</div>
				<div id="addressDiv" class="mt-2 ml-4">
					<input type="text" class="form-control" placeholder="�Խ�Ʈ" id="guestInput">
					<input type="text" class="form-control" placeholder="ħ��" id="bedInput">
					<input type="text" class="form-control" placeholder="ħ��" id="bedroomInput">
					<input type="text" class="form-control" placeholder="���" id="bathroomInput">
				</div>
			</div>	
					
			<div class="font-weight-bold">2�ܰ�</div>
			<h2 class="font-weight-bold">���� �ŷ��� �����̰� �ϼ���.</h2><br>
			<div class="pt-4">
				<div class="d-flex">
					<i class="bi bi-check-circle"></i>
					<h4 class="font-weight-bold ml-2">b&b ���� �߰��ϱ�</h4>
					<
				</div>
				<div id="addressDiv" class="mt-2 ml-4">
					<input type="text" class="form-control" placeholder="�Խ�Ʈ" id="guestInput">
					<input type="text" class="form-control" placeholder="ħ��" id="bedInput">
					<input type="text" class="form-control" placeholder="ħ��" id="bedroomInput">
					<input type="text" class="form-control" placeholder="���" id="bathroomInput">
				</div>
			</div>	
		</div>
		
	</div>
	
	<script>
		var map = new naver.maps.Map('map');
		var infoWindow = new naver.maps.InfoWindow({
		    anchorSkew: true
		});

		map.setCursor('pointer');

		function searchCoordinateToAddress(latlng) {

		    infoWindow.close();

		    naver.maps.Service.reverseGeocode({
		        coords: latlng,
		        orders: [
		            naver.maps.Service.OrderType.ADDR,
		            naver.maps.Service.OrderType.ROAD_ADDR
		        ].join(',')
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }

		        var items = response.v2.results,
		            address = '',
		            htmlAddresses = [];

		        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
		            item = items[i];
		            address = makeAddress(item) || '';
		            addrType = item.name === 'roadaddr' ? '[���θ� �ּ�]' : '[���� �ּ�]';

		            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
		        }

		        infoWindow.setContent([
		            '<div style="padding:10px;min-width:200px;line-height:150%;">',
		            '<h4 style="margin-top:5px;">�˻� ��ǥ</h4><br />',
		            htmlAddresses.join('<br />'),
		            '</div>'
		        ].join('\n'));

		        infoWindow.open(map, latlng);
		    });
		}

		function searchAddressToCoordinate(address) {
		    naver.maps.Service.geocode({
		        query: address
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }

		        if (response.v2.meta.totalCount === 0) {
		            return alert('totalCount' + response.v2.meta.totalCount);
		        }

		        var htmlAddresses = [],
		            item = response.v2.addresses[0],
		            point = new naver.maps.Point(item.x, item.y);

		        if (item.roadAddress) {
		            htmlAddresses.push('[���θ� �ּ�] ' + item.roadAddress);
		        }

		        if (item.jibunAddress) {
		            htmlAddresses.push('[���� �ּ�] ' + item.jibunAddress);
		        }

		        if (item.englishAddress) {
		            htmlAddresses.push('[������ �ּ�] ' + item.englishAddress);
		        }

		        infoWindow.setContent([
		            '<div style="padding:10px;min-width:200px;line-height:150%;">',
		            '<h4 style="margin-top:5px;">�˻� �ּ� : '+ address +'</h4><br />',
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

		    searchAddressToCoordinate('���ڵ� 178-1');
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
		                rest += '��';
		            }

		            rest += land.number1;

		            if (hasData(land.number2)) {
		                rest += ('-' + land.number2);
		            }
		        }

		        if (isRoadAddress === true) {
		            if (checkLastString(dongmyun, '��')) {
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

	</script>
</body>
</html>