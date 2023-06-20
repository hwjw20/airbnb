package com.jiwon.airbnb.reservation.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.reservation.model.ReservationInfo;
import com.jiwon.airbnb.room.bo.RoomBO;

@Service
public class CalendarService {
	
	@Autowired
	private ReservationBO reservationBO;
	
	@Autowired
	private RoomBO roomBO;

	public List<Map<String, Object>> getEventList(HttpSession session) {
		
//        Map<String, Object> event = new HashMap<String, Object>();
//        List<Map<String, Object>> eventList = new ArrayList<Map<String, Object>>();
//        
//        event.put("start", LocalDate.now());
//        event.put("title", "test");
//        event.put("end",LocalDate.now());
//        eventList.add(event);
//        event = new HashMap<String, Object>();
//        event.put("start", LocalDate.now().plusDays(3));
//        event.put("title", "test2");
//        event.put("end",LocalDate.now().plusDays(4));
//        eventList.add(event);
//        
//        return eventList;
		
		int userId = (int) session.getAttribute("userId");
		int roomId = roomBO.getRoom(userId).getId();
		List<ReservationInfo> list = reservationBO.getReservationCal(roomId);
		
        List<Map<String, Object>> eventList = new ArrayList<>();
        
        for(ReservationInfo reservationInfo:list) {
        	Map<String, Object> event = new HashMap<String, Object>();
        	
        	event.put("start", reservationInfo.getDate());
        	event.put("title", reservationInfo.getUserName() + " (총 " + reservationInfo.getHeadcount() + "명)");
        	event.put("end", reservationInfo.getEndDate());
        	
        	eventList.add(event);
        }
        
        return eventList;
    }
}
