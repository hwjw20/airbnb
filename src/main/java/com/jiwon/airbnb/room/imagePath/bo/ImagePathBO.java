package com.jiwon.airbnb.room.imagePath.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jiwon.airbnb.room.imagePath.dao.ImagePathDAO;

@Service
public class ImagePathBO {

	@Autowired
	private ImagePathDAO imagePathDAO;
	
	public List<String> getImagePathByRoomId(int roomId) {
		return imagePathDAO.selectImagePathByRoomId(roomId);
	}
	
	public int insertImagePath(int roomId, String imagePath) {
		return imagePathDAO.insertImagePath(roomId, imagePath);
	}
}
