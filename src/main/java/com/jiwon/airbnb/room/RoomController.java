package com.jiwon.airbnb.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.model.Room;
import com.jiwon.airbnb.room.model.RoomInfo;

@Controller
@RequestMapping("/rooms")
public class RoomController {

	@Autowired
	private RoomBO roomBO;
	
	
	@GetMapping("/list/view")
	public String roomView(
			@RequestParam(value="type", required=false) Integer type 
			, Model model) {
		
		List<RoomInfo> roomList = roomBO.getRoomList(type);
		
		model.addAttribute("roomList", roomList);
		
		return "rooms/main";
	}
	
	@GetMapping("/detail/view")
	public String roomDetail(
			@RequestParam("roomId") int roomId
			, Model model) {
		
		Room room = roomBO.getRoom(roomId);
		
		model.addAttribute("room", room);
		
		return "rooms/detail";
	}
	
	

}
