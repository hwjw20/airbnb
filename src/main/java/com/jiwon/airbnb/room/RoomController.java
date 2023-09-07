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
	
	//테스트 화면
	@GetMapping("/popup")
	public String popupView() {
		return "rooms/host/become_a_host/popup";
	}
	
	@GetMapping("/list/view")
	public String roomView(
			@RequestParam(value="type", required=false) Integer type 
			, @RequestParam(value="keyword", required=false) String keyword
			, Model model) {
		
		// 검색창에 키워드를 입력했을 때
		if(keyword != null) {
//			if((keyword != null) || (keyword != "")) {
			List<RoomInfo> roomList = roomBO.getRoomListByKeyword(keyword);
			model.addAttribute("roomList", roomList);
		} else {
			// null 이거나 공백일때
			List<RoomInfo> roomList = roomBO.getRoomList(type);
			model.addAttribute("roomList", roomList);
		}
		
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
		List<Integer> headcountList = roomBO.getHeadcountList(roomId);
		
		if(userId != null) {
			boolean isLike = likeBO.isLike(userId, roomId);
			model.addAttribute("isLike", isLike);
		}
		
		model.addAttribute("date", date);
		model.addAttribute("room", room);
		model.addAttribute("headcountList", headcountList);
		
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
