package com.jiwon.airbnb.room.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.model.RoomInfo;
import com.jiwon.airbnb.room.review.bo.ReviewBO;
import com.jiwon.airbnb.room.review.model.ReviewInfo;

@Controller
@RequestMapping("/rooms/detail")
public class ReviewController {

	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private RoomBO roomBO;
	
	@GetMapping("/review")
	public String reviewView(@RequestParam("roomId") int roomId, Model model) {
		List<ReviewInfo> reviewInfoList = reviewBO.getReviewList(roomId);
		RoomInfo room = roomBO.getRoom(roomId);
		
		model.addAttribute("room", room);
		model.addAttribute("reviewList", reviewInfoList);
		
		return "rooms/review";
	}
}
