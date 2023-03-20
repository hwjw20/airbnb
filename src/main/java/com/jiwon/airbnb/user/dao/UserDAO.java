package com.jiwon.airbnb.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.airbnb.user.model.User;

@Repository
public interface UserDAO {

	public User selectUserByEmail(@Param("email") String email);
	
	public User selectUser(@Param("email") String email, @Param("password") String password);
	
	public int selectUserCount(@Param("email") String email);
	
	public int insertUser(
			@Param("name") String name
			, @Param("birthday") String birthday
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email
			, @Param("password") String password);
	
	public String selectUserName(@Param("userId") int userId);
	
}
