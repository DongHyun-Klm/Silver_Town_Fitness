package com.stf.page.model.service;

import java.util.List;

import com.stf.page.model.dto.Reservation;

public interface ReservationService {
		// 예약목록 조회
		public List<Reservation> selectRList(String id);
		
		// 이수목록 조회
		public List<Reservation> selectDList(String id);
		
		// 수강신청
		public void insertReservation(Reservation reservation);
		
		// 수강신청 삭제
		public void deleteReservation(int index);
}
