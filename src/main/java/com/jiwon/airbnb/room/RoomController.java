package com.jiwon.airbnb.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/rooms")
public class RoomController {

	@GetMapping("/list/view")
	public String roomView(
			@RequestParam(value="type", required=false) String type) {
		
		if(type == null) {
			
		}
		return "rooms/main";
	}
}
