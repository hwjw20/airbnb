<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    
    <title>우리학교 일정</title>
    
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 	<script>
		
      	document.addEventListener('DOMContentLoaded', function() {
	  		var urlParams = new URL(location.href).searchParams;
			var schoolId = urlParams.get('schoolId');  
	
			var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	        	expandRows: true, // 화면에 맞게 높이 재설정
	            slotMinTime: '08:00', // Day 캘린더에서 시작 시간
	            slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
	           
	            // 해더에 표시할 툴바
				customButtons: {
					myCustomButton: {
	 					text: '일정등록',
					    click: function() {
					    	window.open('/school/schedule/view?schoolId='+schoolId,'일정등록','width=430,height=500,location=no,status=no,scrollbars=yes');
					    }
					  }
					},
				headerToolbar: {
				  left: 'prev,next today myCustomButton',
				  center: 'title',
				  right: 'dayGridMonth,timeGridDay,listWeek'
				},            
	           
				initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	            editable: false, // 수정 가능?
	            selectable: false, // 달력 일자 드래그 설정가능
	            nowIndicator: true, // 현재 시간 마크
	            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	            locale: 'ko', // 한국어 설정
	            events:function(info, successCallback, failureCallback){
	                $.ajax({
	                       url: '/school/getschedule'
	                       , data:{'schoolId':schoolId}
	                       , success: function(data) {
	                          successCallback(data);
	                       }
	                }); // ajax end
	            }     		
	        }); //fullcalendar end
	      
	        calendar.render();
	      });

    </script>

  </head>
  <body>
    <div id='calendar'></div>
       

  </body>
</html>