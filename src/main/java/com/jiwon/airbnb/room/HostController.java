package com.jiwon.airbnb.room;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.user.bo.UserBO;

@Controller
@RequestMapping("/host/become_a_host")
public class HostController {

	@Autowired
	private RoomBO roomBO;
	
	@Autowired
	private UserBO userBO;
	
	@GetMapping("/view")
	public String hostmodeView(
			HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		model.addAttribute("roomId", roomBO.getRoomIdByUserId(userId));
		model.addAttribute("email", userBO.getEmailByUserId(userId));
		model.addAttribute("isHost", roomBO.isHost(userId));
		
		return "rooms/host/hostmode";
	}
	@GetMapping("/host/view")
	public String hostView(
			HttpSession session
			, Model model) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		model.addAttribute("userId", userId);
		
		return "rooms/host/become_a_host/addRoom";
	}
	
	
}
