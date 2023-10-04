package com.jiwon.airbnb.room.imagePath;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.imagePath.bo.ImagePathBO;

@RestController
public class ImagePathRestController {
	
	@Autowired
	private ImagePathBO imagePathBO;
	
	@Autowired
	private RoomBO roomBO;

	// 숙소 이미지 등록하기
	@PostMapping("/host/add_imagePath")
	public Map<String, String> addImagePath(@RequestParam("imagePath") String imagePath) {
		// 방금 등록한 숙소의 id
		int roomId = roomBO.getLatestRoomId();
		int count = imagePathBO.insertImagePath(roomId, imagePath);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
