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
	
	public int selectCountRoomByLatLng(@Param("lat") double lat, @Param("lng") double lng);	
	
	public int insertRoom(
			@Param("userId") int userId
			, @Param("type") int type
			, @Param("privacy") String privacy
			, @Param("address") String address
			, @Param("lat") double lat
			, @Param("lng") double lng
			, @Param("headcount") int headcount
			, @Param("bed") int bed
			, @Param("bedroom") int bedroom
			, @Param("bathroom") int bathroom
			, @Param("selfCheckin") int selfCheckin
			, @Param("charge") int charge
			, @Param("roomName") String roomName
			, @Param("roomDescription") String roomDescription
			);
	
	public int selectLatestRoomId();
	
	public List<Room> selectRoomByKeyword(@Param("keyword") String keyword);

}

