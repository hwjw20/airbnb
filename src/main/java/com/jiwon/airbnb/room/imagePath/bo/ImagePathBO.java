package com.jiwon.airbnb.room.imagePath.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.room.imagePath.dao.ImagePathDAO;
import com.jiwon.airbnb.room.imagePath.model.ImagePath;

@Service
public class ImagePathBO {

	@Autowired
	private ImagePathDAO imagePathDAO;
	
	public List<String> getImagePathByRoomId(int roomId) {
		return imagePathDAO.selectImagePathByRoomId(roomId);
	}
}
