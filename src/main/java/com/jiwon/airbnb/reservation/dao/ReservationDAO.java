package com.jiwon.airbnb.reservation.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.airbnb.reservation.model.Reservation;

@Repository
public interface ReservationDAO {

	public List<Reservation> selectReservationList(@Param("userId") int userId); 
	
	public int insertReservation(
			@Param("userId") int userId
			, @Param("roomId") int roomId
			, @Param("date") String date
			, @Param("days") int days
			, @Param("headcount") int headcount);
}
