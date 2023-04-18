package com.jiwon.airbnb.room;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.like.bo.LikeBO;
import com.jiwon.airbnb.room.model.RoomInfo;

@Controller
@RequestMapping("/rooms")
public class RoomController {

	@Autowired
	private RoomBO roomBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/list/view")
	public String roomView(
			@RequestParam(value="type", required=false) Integer type 
			, Model model) {
		
		List<RoomInfo> roomList = roomBO.getRoomList(type);
		
		model.addAttribute("roomList", roomList);
		
		return "rooms/main";
	}
	
	@GetMapping("/detail/view")
	public String roomDetail(
			@RequestParam("roomId") int roomId
			, Model model
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String date = roomBO.getDate();
		RoomInfo room = roomBO.getRoomInfo(roomId);
		
		if(userId != null) {
			boolean isLike = likeBO.isLike(userId, roomId);
			model.addAttribute("isLike", isLike);
		}
		
		model.addAttribute("date", date);
		model.addAttribute("room", room);
		
		return "rooms/detail";
	}
	
	@GetMapping("/detail/view/photo")
	public String detailImgView(
			@RequestParam("roomId") int roomId
			, Model model
			, HttpSession session)	{
	
		int userId = (int) session.getAttribute("userId");
		RoomInfo room = roomBO.getRoomInfo(roomId);
		boolean isLike = likeBO.isLike(userId, roomId);
		
		model.addAttribute("room", room);
		model.addAttribute("isLike", isLike);
		
		return "rooms/detailImg";
	}

}
