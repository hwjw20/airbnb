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

@Controller
@RequestMapping("/mypage")
public class ReservationController {

	@Autowired
	private ReservationBO reservationBO;
	
	@GetMapping("/reservation/view")
	public String mypageView(
			HttpSession session
			, Model model) {
		
		int userId = (int) session.getAttribute("userId");
		
		List<ReservationInfo> reservationList = reservationBO.getReservationList(userId);
		
		model.addAttribute("reservationList", reservationList);
		
		return "mypage/travel";
	}
}
