package com.jiwon.airbnb.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	public static final String FILE_UPLOAD_PATH = "D:\\지원\\airbnb\\upload\\images";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// 디렉토리 생성
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(directoryPath);
		if(directory.mkdir() == false) {
			//디렉토리 생성 실패
			// 디렉토리 생성 실패 로그 추가
			logger.error("savefile : 디렉토리 생성 실패" + directoryPath);
			return null;
		}
		
		// 파일 저장
		String filePath = null;
		try {
			byte[] bytes = file.getBytes();
			
			filePath = directoryPath + file.getOriginalFilename();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			logger.error("savefile : 파일 생성 에러 - " + filePath);
			
			return null;
		}
		
		return "/images" + directoryName + file.getOriginalFilename();
	}
	
	// 파일 삭제 메소드
	public static boolean removeFile(String filePath) { // 데이터베이스에 저장되어 있는 경로(내가 만든 경로): /images/4_1676378303268/animal-4638681__340.jpg
		// 삭제 경로 /image를 제외하고
		// 실제 파일 저장 경로에 이어 붙여준다. => 서버에 저장되어 있는 실제 경로를 다시 찾아서 삭제해야 함
		// "D:\\지원\\airbnb\\upload\\images" + "/4_1676378303268/animal-4638681__340.jpg"
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		Path path = Paths.get(realFilePath); // 문자열로 만들어진 경로를 path 라고 경로로 바꿔주는 과정
		
		// 파일이 존재하는지 
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		
		// D:\\지원\\airbnb\\upload\\images/4_1676378303268/animal-4638681__340.jpg
		// 디렉토리 경로
		Path dirPath = path.getParent();
		// 디렉토리 존재하는지
		if(Files.exists(dirPath)) {
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		
		return true;
	}
}
