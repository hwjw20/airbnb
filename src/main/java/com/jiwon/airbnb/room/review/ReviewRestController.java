package com.jiwon.airbnb.room.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.room.review.bo.ReviewBO;
import com.jiwon.airbnb.room.review.model.ReviewInfo;

@RestController
public class ReviewRestController {

	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/rooms/detail/review/search")
	public Map<String, String> searchReview(@RequestParam("searchWord") String searchWord) {
		List<ReviewInfo> reviewList = reviewBO.getSearchReviewList(searchWord);
		
		Map<String, String> result = new HashMap<>();
		if(reviewList.size() != 0) {
			result.put("result", "success");
		} else {
			result.put("result", "success");
		}
		
		return result;
	}
}
