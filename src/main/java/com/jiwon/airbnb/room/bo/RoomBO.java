package com.jiwon.airbnb.room.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.room.dao.RoomDAO;
import com.jiwon.airbnb.room.imagePath.bo.ImagePathBO;
import com.jiwon.airbnb.room.imagePath.model.ImagePath;
import com.jiwon.airbnb.room.model.Room;
import com.jiwon.airbnb.room.model.RoomInfo;

@Service
public class RoomBO {

	@Autowired
	private RoomDAO roomDAO;
	
	@Autowired
	private ImagePathBO imagePathBO;
	
	public List<RoomInfo> getRoomList(Integer type) {
		
		List<Room> roomList = new ArrayList<>();
		
		if(type == null) {
			roomList = roomDAO.selectRoomList();
		} else {
			roomList = roomDAO.selectRoomListByType(type);
		}
		 
		List<RoomInfo> roomInfoList = new ArrayList<>();
		
		for(Room room:roomList) {
			
			RoomInfo roomInfo = new RoomInfo();
			
			int roomId = room.getId();
			
			roomInfo.setRoomId(roomId);
			roomInfo.setAddress(room.getAddress());
			roomInfo.setCharge(room.getCharge());
			roomInfo.setImagePathList(imagePathBO.getImagePathByRoomId(roomId));
			
			roomInfoList.add(roomInfo);
		}
		 
		return roomInfoList;
	}
	
	public RoomInfo getRoom(int roomId) {
		Room room = roomDAO.selectRoom(roomId);
		
		RoomInfo roomInfo = new RoomInfo();
		
		roomInfo.setRoomId(roomId);
		roomInfo.setType(room.getType());
		roomInfo.setAddress(room.getAddress());
		roomInfo.setCharge(room.getCharge());
		roomInfo.setImagePathList(imagePathBO.getImagePathByRoomId(roomId));
		
		
		
	
	}
	
	
}
