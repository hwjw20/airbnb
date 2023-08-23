package com.jiwon.airbnb.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.reservation.bo.ReservationBO;
import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.model.ScheduleCalendar;

@RestController
@RequestMapping("/host")
public class HostRestController {
	
	@Autowired
	private ReservationBO reservationBO;
	
	@Autowired
	private RoomBO roomBO;
	
	// 호스트가 숙소 예약 일정 가져오는 api
	@GetMapping("/reservation/schedule")
	public List<ScheduleCalendar> roomSchedule(HttpSession session) {
		int userId = (Integer) session.getAttribute("userId");
		int roomId = roomBO.getRoomIdByUserId(userId);
		
		return reservationBO.getReservationListByRoomId(roomId);
	}
	
	// 숙소 중복 확인 api
	@PostMapping("/room/is_duplicated")
	public Map<String, Boolean> roomDuplicated(
			@RequestParam("lat") double lat
			, @RequestParam("lng") double lng) {
		boolean isDuplicated = roomBO.isRoomDuplicated(lat, lng);
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("isDuplicated", isDuplicated);
		
		return result;
	}
	
}
