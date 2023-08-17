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
	
	public Date modifyEndDate(Date date) {
		Calendar cal = Calendar.getInstance();
		
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		
		return cal.getTime();
	}
	
	public List<ScheduleCalendar> roomSchedule(int userId) {
		
		List<ReservationInfo> reservList = this.getReservationList(userId);
		List<ScheduleCalendar> list = new ArrayList<>();
		
		for(ReservationInfo reserv: reservList) {
			String title = reserv.getUserName();
			Date end = this.modifyEndDate(reserv.getEndDate());
			int count = reserv.getHeadcount() - 1;
			
			// title은 [user의 이름 + 외 n명], 예약인원이 한 명일 경우 [user의 이름]만 표기
			if(count != 0) {
				title += " 외 " + count +"명";
			}
			
			ScheduleCalendar schCalendar = new ScheduleCalendar();
			schCalendar.setId(reserv.getReservationId());
			schCalendar.setTitle(title);
			schCalendar.setStart(reserv.getDate());
			schCalendar.setEnd(end);
		
			list.add(schCalendar);
		}
		
		return list;
	}


}
