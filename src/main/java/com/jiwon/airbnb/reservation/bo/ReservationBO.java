package com.jiwon.airbnb.reservation.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiwon.airbnb.common.GetDate;
import com.jiwon.airbnb.reservation.dao.ReservationDAO;
import com.jiwon.airbnb.reservation.model.Reservation;
import com.jiwon.airbnb.reservation.model.ReservationInfo;
import com.jiwon.airbnb.room.bo.RoomBO;
import com.jiwon.airbnb.room.imagePath.bo.ImagePathBO;
import com.jiwon.airbnb.room.model.Room;

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private RoomBO roomBO;
	
	@Autowired
	private ImagePathBO imagePathBO;
	
	
	public List<ReservationInfo> getReservationList(int userId) {
		List<Reservation> reservationList = reservationDAO.selectReservationList(userId);
		
		List<ReservationInfo> reservationInfoList = new ArrayList<>();
		
		for(Reservation reservation:reservationList) {
			ReservationInfo reservationInfo = new ReservationInfo();
			
			Room room = roomBO.getRoom(reservation.getRoomId());
			String firstImagePath = imagePathBO.getImagePathByRoomId(reservation.getRoomId()).get(0);
			int days = reservation.getDays();
			Date date = reservation.getDate();
			String finDate = GetDate.getDate(date, days);
			
			reservationInfo.setReservationId(reservation.getId());
			reservationInfo.setUserId(userId);
			reservationInfo.setRoomId(reservation.getRoomId());
			reservationInfo.setRoomName(room.getRoomName());
			reservationInfo.setAddress(room.getAddress());
			reservationInfo.setDate(reservation.getDate());
			reservationInfo.setDays(days);
			reservationInfo.setImagePath(firstImagePath);
			reservationInfo.setFinDate(finDate);
			
			reservationInfoList.add(reservationInfo);
		}
		
		return reservationInfoList;
	}
	
	public int addReservation(int userId, int roomId, String date, int days, int headcount) {
		return reservationDAO.insertReservation(userId, roomId, date, days, headcount);
	}
}
