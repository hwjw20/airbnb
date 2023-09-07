package com.jiwon.airbnb.room.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jiwon.airbnb.common.GetDate;
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
		
		Date date = new Date();
		
		return GetDate.getDate(date, 10).substring(6);
	}
	
	public Room getRoom(int roomId) {
		return roomDAO.selectRoom(roomId);
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
	
	public List<RoomInfo> getRoomListByKeyword(String keyword) {
		List<RoomInfo> roomInfoList = new ArrayList<>();
		
		List<Room> roomList = roomDAO.selectRoomByKeyword(keyword);
		for(Room room:roomList) {
			RoomInfo roomInfo = new RoomInfo();
			
			int roomId = room.getId();
			List<String> imagePathList = imagePathBO.getImagePathByRoomId(roomId);
			double rating = reviewBO.getRating(roomId);
			
			roomInfo.setRoomId(roomId);
			roomInfo.setAddress(room.getAddress());
			roomInfo.setCharge(room.getCharge());
			roomInfo.setImagePathList(imagePathList);
			roomInfo.setRating(rating);
			
			roomInfoList.add(roomInfo);
		}
		
		return roomInfoList;
	}
	
	public RoomInfo getRoomInfo(int roomId) {
		Room room = roomDAO.selectRoom(roomId);
		int userId = room.getUserId();
		
		RoomInfo roomInfo = new RoomInfo();
		
		roomInfo.setRoomId(roomId);
		roomInfo.setHostName(userBO.getUserName(room.getUserId()));
		roomInfo.setType(room.getType());
		roomInfo.setPrivacy(room.getPrivacy());
		roomInfo.setAddress(room.getAddress());
		roomInfo.setLat(room.getLat());
		roomInfo.setLng(room.getLng());
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
	
	public List<Integer> getHeadcountList(int roomId) {
		
		int headcount = roomDAO.selectRoom(roomId).getHeadcount();
		
		List<Integer> headcountList = new ArrayList<>();
		for(int i = 1; i <= headcount; i++) {
			headcountList.add(i);
		}
		
		return headcountList;
	}

	public boolean isHost(int userId) {
		if(roomDAO.selectCountRoomByUserId(userId) != 0) {
			return true;
		}
		
		return false;
	}

	public int	getRoomIdByUserId(int userId) {
		return roomDAO.selectRoomIdByUserId(userId);
	}
	
	public boolean isRoomDuplicated(double lat, double lng) {
		if(roomDAO.selectCountRoomByLatLng(lat, lng) != 0) {
			return true;
		}
		
		return false;
	}
	
	public int addRoom(int userId, int type, String privacy, String address, double lat, double lng, 
			int headcount, int bed, int bedroom, int bathroom, int selfCheckin, int charge, String roomName, String roomDescription) {
		
		return roomDAO.insertRoom(userId, type, privacy, address, lat, lng, headcount, bed, bedroom, bathroom, selfCheckin, charge, roomName, roomDescription);
	}
	
}
