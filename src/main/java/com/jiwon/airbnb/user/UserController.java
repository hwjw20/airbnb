package com.jiwon.airbnb.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signin/email/view")
	public String signinEmailView() {
		return "user/signin_email";
	}
	
	@GetMapping("/signin/password/view")
	public String signinPwView() {
		return "user/signin_pw";
	}
	
	@GetMapping("/find_pw/view")
	public String findPwView() {
		return "user/findPw";
	}
	
	@GetMapping("/signup/view")
	public String signupView() {
		return "user/signup";
	}
	
	@GetMapping("/signout")
	public String signout(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userEmail");
		return "redirect:/rooms/list/view";
	}
}
