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

	// 이메일 로그인 api
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
	
	// 비밀번호 로그인 api
	@PostMapping("/signin/password")
	public Map<String, String> signinPw(
			@RequestParam("email") String email
			, @RequestParam("password") String password
			, HttpSession session) {
		
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
	
	// 비밀번호 찾기 api
	@GetMapping("/find_pw")
	public Map<String, String> findPw(@RequestParam("email") String email) {
		int count = userBO.getUserCount(email);
		
		Map<String, String> result =  new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 회원가입 api 
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("name") String name
			, @RequestParam("birthday") String birthday
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email
			, @RequestParam("password") String password) {
		
		int count = userBO.addUser(name, birthday, phoneNumber, email, password);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 회원가입 시 이메일 중복확인 api 
	@GetMapping("/duplicate_email")
	public Map<String, Boolean> duplicateEmail(@RequestParam("email") String email) {
		User user = userBO.getUserByEmail(email);
		
		Map<String, Boolean> result = new HashMap<>();
		if(user == null) {
			result.put("duplicate", false);
		} else {
			result.put("duplicate", true);
		}
		
		return result;
	}
}
