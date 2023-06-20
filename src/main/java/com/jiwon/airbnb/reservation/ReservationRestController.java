package com.jiwon.airbnb.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.reservation.bo.CalendarService;
import com.jiwon.airbnb.reservation.bo.ReservationBO;

@RestController
public class ReservationRestController {

	@Autowired
	private ReservationBO reservationBO;
	
	@Autowired
	CalendarService calendarService;
	
	@GetMapping("/room/detail/reservation")
	public Map<String, String> reservation(
			@RequestParam("roomId") int roomId
			, @RequestParam("date") String date
			, @RequestParam("endDate") String endDate
			, @RequestParam("days") int days
			, @RequestParam("headcount") int headcount
			, HttpSession session) {
		
		int userId = (int) session.getAttribute("userId");
		int count = reservationBO.addReservation(userId, roomId, date, endDate, days, headcount);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/calendar")
	public List<Map<String, Object>> getEvent(HttpSession session) {
		return calendarService.getEventList(session);
	}
	
}
