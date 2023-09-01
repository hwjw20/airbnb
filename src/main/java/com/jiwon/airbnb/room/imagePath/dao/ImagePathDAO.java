package com.jiwon.airbnb.room.imagePath.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ImagePathDAO {

	public List<String> selectImagePathByRoomId(@Param("roomId") int roomId);
	
	//test
	public int insertImage(@Param("imagePath") String imagePath);
}
