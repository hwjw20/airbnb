package com.jiwon.airbnb.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.model.RoomInfo;

@RestController
@RequestMapping("/rooms")
public class RoomRestController {

	@Autowired
	private RoomBO roomBO;
	
//	@PostMapping("/list/search")
//	public search(@RequestParam("keyword") String keyword) {
//		List<RoomInfo> list = roomBO.getRoomListByKeyword(keyword);
//	}
	
}
