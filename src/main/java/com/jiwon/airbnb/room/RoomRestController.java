package com.jiwon.airbnb.room;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/room")
public class RoomRestController {

	public search(@RequestParam("searchWord") String searchWord) {
		
	}
}
