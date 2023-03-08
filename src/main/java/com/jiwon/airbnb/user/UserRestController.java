package com.jiwon.airbnb.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jiwon.airbnb.user.bo.UserBO;
import com.jiwon.airbnb.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@GetMapping("/signin/email")
	public Map<String, String> signinEmail(
			@RequestParam("email") String email
			, HttpSession session) {
		
		User user = userBO.getUserByEmail(email);
		
		Map<String, String> result = new HashMap<>();
		if(user != null) {
			result.put("result", "success");
			session.setAttribute("email", user.getEmail());
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/signin/password")
	public Map<String, String> signinPw(
			@RequestParam("email") String email
			, @RequestParam("password") String password
			, HttpSession session) {
		
//		String encryptPassword = EncryptUtils.md5(password);
		
		User user = userBO.getUser(email, password);
		
		Map<String, String> result = new HashMap<>();
		if(user != null) {
			result.put("result", "success");
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userEmail", user.getEmail());
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
