package com.jiwon.airbnb.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.common.EncryptUtils;
import com.jiwon.airbnb.user.dao.UserDAO;
import com.jiwon.airbnb.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	
	public User getUserByEmail(String email) {
		return userDAO.selectUserByEmail(email);
	}
	
	public User getUser(String email, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(email, encryptPassword);
	}
	
	public int getUserCount(String email) {
		return userDAO.selectUserCount(email);
	}
	
	public int addUser(String name, String birthday, String phoneNumber, String email, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(name, birthday, phoneNumber, email, encryptPassword);
	}
	
	public String getUserName(int userId) {
		return userDAO.selectUserName(userId);
	}
	
	public String getEmailByUserId(int userId) {
		return userDAO.selectEmailByUserId(userId);
	}
	
}
