package com.jiwon.airbnb.room.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(@Param("userId") int userId, @Param("roomId") int roomId);
	
	public int selectCountLike(@Param("userId") int userId, @Param("roomId") int roomId);
	
	public int deleteLike(@Param("userId") int userId, @Param("roomId") int roomId);
}
