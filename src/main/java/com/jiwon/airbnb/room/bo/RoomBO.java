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
	
	
	public List<RoomInfo> getRoomList() {
		
		List<Room> roomList = roomDAO.selectRoomList();
		
		List<RoomInfo> roomInfoList = new ArrayList<>();
		
		for(Room room:roomList) {
			
			RoomInfo roomInfo = new RoomInfo();
			
			int roomId = room.getId();
			String type = room.getType();
			String address = room.getAddress();
			int charge = room.getCharge();
			double rating = room.getRating();
			String imagePath = imagePathBO.getImagePath(roomId).get(0);
			
			roomInfo.setRoomId(roomId);
			roomInfo.setType(type);
			roomInfo.setAddress(address);
			roomInfo.setCharge(charge);
			roomInfo.setRating(rating);
			roomInfo.setImagePath(imagePath);
			
			roomInfoList.add(roomInfo);
		}
		
		return roomInfoList;
	}
	
	
}
