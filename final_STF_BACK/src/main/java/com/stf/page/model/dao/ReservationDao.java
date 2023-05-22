package com.stf.page.model.dao;

import java.util.List;

import com.stf.page.model.dto.Reservation;
import com.stf.page.model.dto.Regist;

public interface ReservationDao {
	// 예약목록 조회
	List<Reservation> selectRList(String id);
	
	// 이수중목록 조회
	List<Reservation> selectList(String id);
	
	// 이수목록 조회
	List<Reservation> selectDList(String id);
	
	// 수강신청
	void insertReservation(Regist regist);
	
	// 수강신청 삭제
	void deleteReservation(int index);
}
