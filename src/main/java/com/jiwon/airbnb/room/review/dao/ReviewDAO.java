package com.jiwon.airbnb.room.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.airbnb.room.review.model.Review;

@Repository
public interface ReviewDAO {

	public int selectReviewCount(@Param("roomId") int roomId);
	
	public List<Double> selectRating(@Param("roomId") int roomId);
			
	public List<Review> selectReviewList(@Param("roomId") int roomId);
	
	public int selectCountReview(@Param("userId") int userId);
}
