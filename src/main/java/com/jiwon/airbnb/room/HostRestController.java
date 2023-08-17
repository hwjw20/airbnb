package com.jiwon.airbnb.room;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.reservation.bo.ReservationBO;
import com.jiwon.airbnb.room.model.ScheduleCalendar;

@RestController
@RequestMapping("/host/reservation")
public class HostRestController {
	
	@Autowired
	private ReservationBO reservationBO;
	
	@GetMapping("/schedule")
	public List<ScheduleCalendar> roomSchedule(HttpSession session) {
		int userId = (Integer) session.getAttribute("userId");
		List<ScheduleCalendar> list = reservationBO.roomSchedule(userId);
		return reservationBO.roomSchedule(userId);
	}
}
