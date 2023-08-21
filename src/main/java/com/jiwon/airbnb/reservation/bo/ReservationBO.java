package com.jiwon.airbnb.reservation.bo;

import java.util.ArrayList;
import java.util.Calendar;
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
import com.jiwon.airbnb.room.model.ScheduleCalendar;
import com.jiwon.airbnb.user.bo.UserBO;

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private RoomBO roomBO;
	
	@Autowired
	private ImagePathBO imagePathBO;
	
	@Autowired
	private UserBO userBO;
	
	
	public List<ReservationInfo> getReservationList(int userId) {
		List<Reservation> reservationList = reservationDAO.selectReservationList(userId);
		
		List<ReservationInfo> reservationInfoList = new ArrayList<>();
		
		for(Reservation reservation:reservationList) {
			ReservationInfo reservationInfo = new ReservationInfo();
			
			Room room = roomBO.getRoom(reservation.getRoomId());
			String firstImagePath = imagePathBO.getImagePathByRoomId(reservation.getRoomId()).get(0);
			int days = reservation.getDays();
			Date date = reservation.getDate();
			Date endDate = reservation.getEndDate();
			String finDate = GetDate.getDate(date, days);
			
			reservationInfo.setReservationId(reservation.getId());
			reservationInfo.setUserId(userId);
			reservationInfo.setUserName(userBO.getUserName(userId));
			reservationInfo.setHeadcount(reservation.getHeadcount());
			reservationInfo.setRoomId(reservation.getRoomId());
			reservationInfo.setRoomName(room.getRoomName());
			reservationInfo.setAddress(room.getAddress());
			reservationInfo.setDate(date);
			reservationInfo.setEndDate(endDate);
			reservationInfo.setDays(days);
			reservationInfo.setImagePath(firstImagePath);
			reservationInfo.setFinDate(finDate);
			
			reservationInfoList.add(reservationInfo);
		}
		
		return reservationInfoList;
	}
	
	public int addReservation(int userId, int roomId, String date, String endDate, int days, int headcount) {
		return reservationDAO.insertReservation(userId, roomId, date, endDate, days, headcount);
	}
	
	public List<ScheduleCalendar> getReservationListByRoomId(int roomId) {
		List<Reservation> reservationList = reservationDAO.selectReservationByRoomId(roomId);
		
		List<ScheduleCalendar> calendarList = new ArrayList<>();
		
		for(Reservation reserv:reservationList) {
			ScheduleCalendar scheduleCalendar = new ScheduleCalendar();
			
			// title: '예약자 이름님' + 외 n명의 예약
			String guestName = userBO.getUserName(reserv.getGuestId());
			String title = "'" + guestName + "'" + " 님";
			int substractHeadcount = reserv.getHeadcount() - 1;
			if(substractHeadcount != 0) {
				title += " 외 " + substractHeadcount + "명"; 
			}
			
			// fullCalendar의 end 날짜가 하루 일찍 끝나는 특징을 보완
			Date end = reserv.getEndDate();
			Calendar cal = Calendar.getInstance();
			cal.setTime(end);
			cal.add(Calendar.DATE, 1);
			end = cal.getTime();
			
			scheduleCalendar.setTitle(title + "의 예약");
			scheduleCalendar.setStart(reserv.getDate());
			scheduleCalendar.setEnd(end);
			
			calendarList.add(scheduleCalendar);
		}
		
		return calendarList;
	}
	
	
	
	


}
