package com.jiwon.airbnb.room.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.room.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	
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
}
