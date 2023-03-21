package com.jiwon.airbnb.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jiwon.airbnb.reservation.model.Reservation;

@Repository
public interface ReservationDAO {

	public List<Reservation> selectReservationList(@Param("userId") int userId); 
}
