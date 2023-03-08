package com.jiwon.airbnb.room.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jiwon.airbnb.room.model.Room;

@Repository
public interface RoomDAO {

	public List<Room> selectRoomList();
}
