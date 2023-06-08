package com.jiwon.airbnb.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiwon.airbnb.reservation.bo.ReservationBO;
import com.jiwon.airbnb.reservation.model.ReservationInfo;
import com.jiwon.airbnb.room.like.bo.LikeBO;
import com.jiwon.airbnb.room.model.RoomInfo;

@Controller
@RequestMapping("/mypage")
public class ReservationController {

	@Autowired
	private ReservationBO reservationBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/reservation/view")
	public String mypageView(
			HttpSession session
			, Model model) {
		
		int userId = (int) session.getAttribute("userId");
		
		List<ReservationInfo> reservationList = reservationBO.getReservationList(userId);
		
		model.addAttribute("reservationList", reservationList);
		
		return "mypage/travel";
	}
	
	@GetMapping("/wishlist/view")
	public String wishListView(
			HttpSession session
			, Model model) {
		
		int userId = (int) session.getAttribute("userId");
		
		List<RoomInfo> roomList = likeBO.getLikedRoom(userId);
		
		model.addAttribute("roomList", roomList);
		
		return "mypage/wishlist";
	}
	
	@GetMapping("/reservation/modal/view")
	public String modalPopUp(
			HttpSession session
			, Model model) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		return "modal_popup/reservation";
	}
	
}
