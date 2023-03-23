package com.jiwon.airbnb.room.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.room.like.bo.LikeBO;

@RestController
@RequestMapping("/room")
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/like")
	public Map<String, String> addLike(
			HttpSession session
			, @RequestParam("roomId") int roomId) {
		
		int userId = (int) session.getAttribute("userId");
		
		int count = likeBO.addLike(userId, roomId);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/unlike")
	public Map<String, String> deleteLike(
			HttpSession session
			, @RequestParam("roomId") int roomId) {
		
		int userId = (int) session.getAttribute("userId");
		
		int count = likeBO.unlike(userId, roomId);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
