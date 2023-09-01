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
import org.springframework.web.multipart.MultipartFile;

import com.jiwon.airbnb.reservation.bo.ReservationBO;
import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.imagePath.bo.ImagePathBO;
import com.jiwon.airbnb.room.model.ScheduleCalendar;

@RestController
@RequestMapping("/host")
public class HostRestController {
	
	@Autowired
	private ReservationBO reservationBO;
	
	@Autowired
	private RoomBO roomBO;
	
	@Autowired
	private ImagePathBO imagePathBO;
	
	// 테스트 api
	@PostMapping("/upload")
	public Map<String, String> upload(@RequestParam("file") MultipartFile file) {
		int count = imagePathBO.addImage(file);
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	
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
	
	// 호스트가 숙소 등록하는 api
	@GetMapping("/room/add")
	public Map<String, String> addRoom(
			@RequestParam("type") int type
			, @RequestParam("privacy") String privacy
			, @RequestParam("address") String address
			, @RequestParam("lat") double lat
			, @RequestParam("lng") double lng
			, @RequestParam("headcount") int headcount
			, @RequestParam("bed") int bed
			, @RequestParam("bedroom") int bedroom
			, @RequestParam("bathroom") int bathroom
			, @RequestParam("selfCheckin") int selfCheckin
			, @RequestParam("charge") int charge
			, @RequestParam("roomName") String roomName
			, @RequestParam("roomDescription") String roomDescription
			, HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		
		int count = roomBO.addRoom(userId, type, privacy, address, lat, lng, headcount, bed, bedroom, bathroom, selfCheckin, charge, roomName, roomDescription);

		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
