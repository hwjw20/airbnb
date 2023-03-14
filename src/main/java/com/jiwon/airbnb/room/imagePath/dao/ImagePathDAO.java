package com.jiwon.airbnb.room.imagePath.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.airbnb.room.imagePath.model.ImagePath;

@Repository
public interface ImagePathDAO {

	public List<String> selectImagePathByRoomId(@Param("roomId") int roomId);
}
