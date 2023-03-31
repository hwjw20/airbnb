package com.jiwon.airbnb.room;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/become_a_host")
public class HostController {

	@GetMapping("/view")
	public String hostmodeView(HttpSession session) {
		return "rooms/host/hostmode";
	}
	@GetMapping("/host/view")
	public String hostView(HttpSession session) {
		return "rooms/host/become_a_host/host";
	}
	@GetMapping("/type/view")
	public String typeView(
			HttpSession session
			) {
		return "rooms/host/become_a_host/type";
	}
}
