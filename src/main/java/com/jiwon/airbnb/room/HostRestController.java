package com.jiwon.airbnb.room;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.reservation.bo.ReservationBO;
import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.model.ScheduleCalendar;

@RestController
@RequestMapping("/host/reservation")
public class HostRestController {
	
	@Autowired
	private ReservationBO reservationBO;
	
	@Autowired
	private RoomBO roomBO;
	
	@GetMapping("/schedule")
	public List<ScheduleCalendar> roomSchedule(HttpSession session) {
		int userId = (Integer) session.getAttribute("userId");
		int roomId = roomBO.getRoomIdByUserId(userId);
		
		return reservationBO.getReservationListByRoomId(roomId);
	}
	
	public Map<String, String> addRoom(HttpSession session) {
		
	}
}
