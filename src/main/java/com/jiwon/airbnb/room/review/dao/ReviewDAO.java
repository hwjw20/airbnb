package com.jiwon.airbnb.room.review.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface ReviewDAO {

	public int selectReviewCount(@Param("roomId") int roomId);
}
