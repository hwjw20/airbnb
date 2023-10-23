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
	
	// 기본 화면
	@GetMapping("/list/view")
	public String roomView(
			@RequestParam(value="type", required=false) Integer type 
			, Model model) {
		
		List<RoomInfo> roomList = roomBO.getRoomList(type);
		model.addAttribute("roomList", roomList);
		
		return "rooms/main";
	}
	
	// 숙소 상세화면
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
	
	// 숙소 사진 캐러셸 화면
	@GetMapping("/detail/view/photo")
	public String detailImgView(
			@RequestParam("roomId") int roomId
			, Model model
			, HttpSession session)	{
	
		Integer userId = (Integer) session.getAttribute("userId");
		boolean isLike;
		
		if(userId == null) {
			isLike = false;
		} else {
			userId = (int) session.getAttribute("userId");
			isLike = likeBO.isLike(userId, roomId);
		}
		RoomInfo room = roomBO.getRoomInfo(roomId);
		
		model.addAttribute("room", room);
		model.addAttribute("isLike", isLike);
		
		return "rooms/detailImg";
	}
	
	// 숙소 검색어로 검색
	@GetMapping("/search")
	public String searchView(
			@RequestParam("keyword") String keyword, Model model) {
		List<RoomInfo> roomListByKeyword = roomBO.getRoomListByKeyword(keyword);
		
		model.addAttribute("roomListByKeyword", roomListByKeyword);
		
		return "rooms/main";
	}

}
