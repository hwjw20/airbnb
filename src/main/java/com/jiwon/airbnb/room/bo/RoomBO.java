package com.jiwon.airbnb.room.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.room.dao.RoomDAO;
import com.jiwon.airbnb.room.imagePath.bo.ImagePathBO;
import com.jiwon.airbnb.room.model.Room;
import com.jiwon.airbnb.room.model.RoomInfo;
import com.jiwon.airbnb.room.review.bo.ReviewBO;
import com.jiwon.airbnb.user.bo.UserBO;

@Service
public class RoomBO {

	@Autowired
	private RoomDAO roomDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private ImagePathBO imagePathBO;
	
	public String getDate() {
		String day = "";
		SimpleDateFormat format = new SimpleDateFormat("M월 d일");
		
		Calendar cal = Calendar.getInstance();
		Date date = new Date();
		cal.setTime(date);
		
		cal.add(Calendar.DATE, 10);
		day = format.format(cal.getTime());
		return day;
	}
	
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
			roomInfo.setRating(reviewBO.getRating(roomId));
			
			roomInfoList.add(roomInfo);
		}
		 
		return roomInfoList;
	}
	
	public RoomInfo getRoom(int roomId) {
		Room room = roomDAO.selectRoom(roomId);
		int userId = room.getUserId();
		
		RoomInfo roomInfo = new RoomInfo();
		
		roomInfo.setRoomId(roomId);
		roomInfo.setHostName(userBO.getUserName(room.getUserId()));
		roomInfo.setType(room.getType());
		roomInfo.setPrivacy(room.getPrivacy());
		roomInfo.setAddress(room.getAddress());
		roomInfo.setHeadcount(room.getHeadcount());
		roomInfo.setBed(room.getBed());
		roomInfo.setBathroom(room.getBathroom());
		roomInfo.setRoomName(room.getRoomName());
		roomInfo.setRoomDescription(room.getRoomDescription());
		roomInfo.setSelfCheckin(room.getSelfCheckin());
		roomInfo.setCharge(room.getCharge());
		roomInfo.setRating(reviewBO.getRating(roomId));
		roomInfo.setReviewCount(reviewBO.getReviewCount(roomId));
		roomInfo.setImagePathList(imagePathBO.getImagePathByRoomId(roomId));
		roomInfo.setSuperHost(reviewBO.getCountReviewByUserId(userId) >= 30);
		
		return roomInfo;
	}
	
}
