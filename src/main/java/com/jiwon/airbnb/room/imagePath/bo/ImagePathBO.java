package com.jiwon.airbnb.room.imagePath.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jiwon.airbnb.common.FileManagerService;
import com.jiwon.airbnb.room.imagePath.dao.ImagePathDAO;

@Service
public class ImagePathBO {

	@Autowired
	private ImagePathDAO imagePathDAO;
	
	public List<String> getImagePathByRoomId(int roomId) {
		return imagePathDAO.selectImagePathByRoomId(roomId);
	}
	
	// test
	public int addImage(MultipartFile file) {
		String imagePath = FileManagerService.saveFile(13, file);
		return imagePathDAO.insertImage(imagePath);
	}
}
