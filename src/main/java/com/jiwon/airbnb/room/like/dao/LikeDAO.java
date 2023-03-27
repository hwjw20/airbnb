package com.jiwon.airbnb.room.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.airbnb.room.like.model.Like;

@Repository
public interface LikeDAO {

	public int insertLike(@Param("userId") int userId, @Param("roomId") int roomId);
	
	public int selectCountLike(@Param("userId") int userId, @Param("roomId") int roomId);
	
	public int deleteLike(@Param("userId") int userId, @Param("roomId") int roomId);
	
	public List<Like> selectLikedRoom(@Param("userId") int userId); 
}
