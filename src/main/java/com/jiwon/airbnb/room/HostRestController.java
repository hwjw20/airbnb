package com.jiwon.airbnb.room;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.reservation.bo.ReservationBO;
import com.jiwon.airbnb.reservation.model.ReservationInfo;
import com.jiwon.airbnb.room.model.Calendar;

@RestController
@RequestMapping("/host/reservation")
public class HostRestController {
	
	@Autowired
	private ReservationBO reservationBO;

	@GetMapping("/getSchedule")
	public List<Calendar> roomSchedule(HttpSession session) {
		
		int userId = (int) session.getAttribute("userId");
		
		List<ReservationInfo> reservList = reservationBO.getReservationList(userId);
		List<Calendar> list = new ArrayList<>();
		
		for(ReservationInfo reserv:reservList) {
			
			String title = reserv.getUserName();
			String content = title + " 외 " + (reserv.getHeadcount() - 1) + "명";
			
			Calendar calendar = new Calendar();
			calendar.setTitle(title);
			calendar.setContent(content);
			calendar.setStart(reserv.getDate());
			calendar.setEnd(reserv.getEndDate());
			
			list.add(calendar);
		}
		
		return list;
	}
}
