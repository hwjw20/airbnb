package com.jiwon.airbnb.room.like.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.imagePath.bo.ImagePathBO;
import com.jiwon.airbnb.room.like.dao.LikeDAO;
import com.jiwon.airbnb.room.like.model.Like;
import com.jiwon.airbnb.room.model.Room;
import com.jiwon.airbnb.room.model.RoomInfo;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	@Autowired
	private RoomBO roomBO;
	
	@Autowired
	private ImagePathBO imagePathBO;
	
	public int addLike(int userId, int roomId) {
		return likeDAO.insertLike(userId, roomId);
	}
	
	public boolean isLike(int userId, int roomId) {
		int count = likeDAO.selectCountLike(userId, roomId);
		if(count == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public int unlike(int userId, int roomId) {
		return likeDAO.deleteLike(userId, roomId);

	}
	
	public List<RoomInfo> getLikedRoom(int userId) {
		List<Like> likeList = likeDAO.selectLikedRoom(userId);
		
		List<RoomInfo> likedRoomList = new ArrayList<>();
		for(Like like:likeList) {
			int roomId = like.getRoomId();
			Room room = roomBO.getRoom(roomId);
			
			RoomInfo roomInfo = new RoomInfo();
			
			roomInfo.setRoomId(roomId);
			roomInfo.setAddress(room.getAddress());
			roomInfo.setRoomName(room.getRoomName());
			roomInfo.setCharge(room.getCharge());
			roomInfo.setImagePathList(imagePathBO.getImagePathByRoomId(roomId));
			
			likedRoomList.add(roomInfo);
		}
		
		return likedRoomList;
	}
}
