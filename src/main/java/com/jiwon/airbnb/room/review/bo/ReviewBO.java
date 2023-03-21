package com.jiwon.airbnb.room.review.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.room.review.dao.ReviewDAO;
import com.jiwon.airbnb.room.review.model.Review;
import com.jiwon.airbnb.room.review.model.ReviewInfo;
import com.jiwon.airbnb.user.bo.UserBO;

@Service
public class ReviewBO {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int getReviewCount(int roomId) {
		return reviewDAO.selectReviewCount(roomId);
	}
	
	public double getRating(int roomId) {
		List<Double> ratingList = reviewDAO.selectRating(roomId);
		
		double result = 0;
		for(Double rating:ratingList) {
			result += rating;  
		}
		result /= ratingList.size();
		
		return Math.round(result * 10) / 10.0;
	}
	
	public List<ReviewInfo> getReviewList(int roomId) {
		List<Review> reviewList = reviewDAO.selectReviewList(roomId);
		
		List<ReviewInfo> reviewInfoList = new ArrayList<>();
		for(Review review:reviewList) {
			ReviewInfo reviewInfo = new ReviewInfo();
			
			reviewInfo.setId(review.getId());
			reviewInfo.setRoomId(review.getRoomId());
			reviewInfo.setUserId(review.getUserId());
			reviewInfo.setUserName(userBO.getUserName(review.getUserId()));
			reviewInfo.setContent(review.getContent());
			reviewInfo.setRating(getRating(roomId));
			reviewInfo.setReviewCount(getReviewCount(roomId));
			reviewInfo.setCreatedAt(review.getCreatedAt());
			reviewInfo.setUpdatedAt(review.getUpdatedAt());
			
			reviewInfoList.add(reviewInfo);
		}
		
		return reviewInfoList;
	}
	
	public int getCountReviewByUserId(int userId) {
		return reviewDAO.selectReviewCount(userId);
	}
	
}
