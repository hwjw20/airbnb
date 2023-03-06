package com.jiwon.airbnb.user;

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
}
