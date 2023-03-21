package com.jiwon.airbnb.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return userDAO.selectUser(email, password);
	}
	
	public int getUserCount(String email) {
		return userDAO.selectUserCount(email);
	}
	
	public int addUser(String name, String birthday, String phoneNumber, String email, String password) {
		return userDAO.insertUser(name, birthday, phoneNumber, email, password);
	}
	
	public String getUserName(int userId) {
		return userDAO.selectUserName(userId);
	}
	
}
