package com.jiwon.airbnb.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.airbnb.room.model.Room;

@Repository
public interface RoomDAO {

	public List<Room> selectRoomList();
	
	public List<Room> selectRoomListByType(@Param("type") int type);
	
	public Room selectRoom(@Param("roomId") int roomId);
	
	public int selectCountRoomByUserId(@Param("userId") int userId);
	
	public int selectRoomIdByUserId(@Param("userId") int userId);
}
