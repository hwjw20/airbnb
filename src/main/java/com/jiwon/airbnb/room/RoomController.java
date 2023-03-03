package com.jiwon.airbnb.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rooms")
public class RoomController {

	@GetMapping("/list/view")
	public String roomView() {
		return "rooms/main";
	}
}
